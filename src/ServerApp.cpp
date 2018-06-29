/* 
 * File:   ServerApp.cpp
 * Author: trungthanh
 * 
 * Created on June 08, 2018, 6:18 PM
 */

#include "ServerApp.h"
#include "ServiceModel.h"
#include "ServiceFactoryT.h"
#include "ServiceHandler.h"
#include "monitor/TStorageStatModule.h"
#include "monitor/TStorageMonitorThriftHandler.h"
#include "storagedef.h"

typedef ServiceFactoryT< CacheType, CacheFactory, BackendStorageType, PersistentStorageType, ServiceModel> ServiceFactory;

ServerApp::ServerApp(void) : _showHelp(false), _zkReg("") {
}

ServerApp::~ServerApp(void) {
}

void ServerApp::initialize(Poco::Util::Application& app) {
    if (_showHelp)
        return;

    loadConfiguration();
    ServiceFactory::init(app);

    ServiceHandler::TServiceThriftServer* aBizServer = new ServiceHandler::TServiceThriftServer(
            ServiceFactory::_svrPort
            , ServiceFactory::_workerCount
            , apache::thrift::stdcxx::shared_ptr< ServiceHandler > (new ServiceHandler(ServiceFactory::getModel())));
    this->addSubsystem(aBizServer);

    int aBinaryPort = app.config().getInt("sns.thrift.binary.port" , 0);
    if (aBinaryPort > 0) {
        cout<<"Binary protocol listened on port "<< aBinaryPort;
        ServiceHandler::TBinaryServiceThriftServer* aBizServer = new ServiceHandler::TBinaryServiceThriftServer(
                aBinaryPort
                , ServiceFactory::_workerCount
                , apache::thrift::stdcxx::shared_ptr< ServiceHandler > (new ServiceHandler(ServiceFactory::getModel())));
        this->addSubsystem(aBizServer);
        
    }


    this->addSubsystem(new TStorageStatModule);

    //Stat handler
    TStorageMonitorThriftHandler* aStatHandler = new TStorageMonitorThriftHandler();

    this->addSubsystem(new TStorageMonitorThriftHandler::TStorageMonitorServer(
            ServiceFactory::_cfgPort
            , 2
            , apache::thrift::stdcxx::shared_ptr< openstars::base::storage::monitor::StorageMonitorServiceIf > (aStatHandler)
            ));

    aStatHandler->setCacheStorage(ServiceFactory::getCache().get(), ServiceFactory::getStorage().get(), ServiceFactory::getKVStorage().get());

    Poco::Util::ServerApplication::initialize(app);

    TStorageStatModule::getInstance().setStatusFetcher(ServiceFactory::getStatFetcher());
    ServiceFactory::getStorage()->setObserver(&TStorageStatModule::getInstance());
    ServiceFactory::getStorage()->setNumSavingThread(app.config().getInt("sns.cachepersistent.savingthread", 1));

    aStatHandler->setServer(aBizServer->thriftServer());
}

int ServerApp::main(const std::vector<std::string>& args) {
    Poco::Util::ServerApplication::main(args);

    try {

        if (args.size() > 1 && (args[1] == "nozk" || args[1] == "testkv"))
            throw 1;

        _zkReg.setZkHosts(ServiceFactory::_zkServers);

        this->_zkReg.addService(ServiceFactory::_zkRegPath, ServiceFactory::_svrHost, ServiceFactory::_svrPort, ServiceFactory::_zkScheme);
        this->_zkReg.addService("/server-monitor/" + ServiceFactory::_zkRegPath, ServiceFactory::_svrHost, ServiceFactory::_cfgPort, "thrift_binary");
        _zkReg.start();
    } catch (...) {
    }

    if (!_showHelp)
        waitForTerminationRequest();

    //flush db
    ServiceFactory::getKVStorage()->flush();
    return 0;
}

void ServerApp::defineOptions(Poco::Util::OptionSet& options) {
    Poco::Util::ServerApplication::defineOptions(options);

    options.addOption(Poco::Util::Option("help", "help")
            .description("show help messages")
            .callback(Poco::Util::OptionCallback<ServerApp > (this, &ServerApp::handleShowHelp)));
}

void ServerApp::handleEnableTimer(const std::string& name, const std::string& value) {
}

