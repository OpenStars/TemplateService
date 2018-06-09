/* 
 * File:   ServerApp.h
 * Author: trungthanh
 *
 * Created on June 08, 2018, 6:18 PM
 */

#ifndef SERVERAPP_H
#define SERVERAPP_H

#include <vector>
#include <iostream>
#include "Poco/Util/ServerApplication.h"
#include "Poco/Util/HelpFormatter.h"
#include "Poco/NumberParser.h"
#include "ZKRegister.h"

class ServerApp : public Poco::Util::ServerApplication {
public:
    ServerApp(void);
    ServerApp(const ServerApp& orig);
    virtual ~ServerApp(void);

    void handleShowHelp(const std::string& name, const std::string& value) {
        _showHelp = true;
        Poco::Util::HelpFormatter helpFormatter(options());
        helpFormatter.setCommand(commandName());

        helpFormatter.setUsage("OPTIONS");
        helpFormatter.setHeader("Parameters");
        helpFormatter.format(std::cout);
    }

    void handleSetHostPort(const std::string& name, const std::string& value);

    void handleEnableTimer(const std::string& name, const std::string& value);

    void defineOptions(Poco::Util::OptionSet& options);

    void initialize(Poco::Util::Application& app);

    virtual int main(const std::vector<std::string>& args);

private:
    bool _showHelp;
    ZKRegister _zkReg;

};

#endif /* SERVERAPP_H */

