/* 
 * File:   ServiceHandler.h
 * Author: trungthanh
 *
 * Created on June 08, 2018, 6:40 PM
 */

#ifndef SERVICEHANDLER_H
#define SERVICEHANDLER_H

#include "ServiceModel.h"
#include "ServiceThriftHandlerBaseT.h"
#include "{{THRIFT_SERVICE_NAME}}.h"

class ServiceHandler : public TServiceThriftHandlerBaseT<ServiceModel,
                    {{THRIFT_SERVICE_FULLNSNAME}}If 
                    , {{THRIFT_SERVICE_FULLNSNAME}}Processor> {
public:
    typedef TServiceThriftHandlerBaseT<ServiceModel,
            {{THRIFT_SERVICE_FULLNSNAME}}If ,
            {{THRIFT_SERVICE_FULLNSNAME}}Processor> _Base;

    ServiceHandler(Poco::SharedPtr<ServiceModel> aModel) : _Base(aModel) {
    };

public:
    void getData({{THRIFT_NS}}::TDataResult& _return, 
                const {{THRIFT_NS}}::TKey key)
    {
        if (this->m_pmodel)
            m_pmodel->getData(_return, key);
    }
    {{THRIFT_NS}}::TErrorCode::type putData( {{THRIFT_NS}}::TKey key,
                                const {{THRIFT_NS}}::TData& data)
    {
        if (this->m_pmodel)
            return m_pmodel->putData(key, data);
        return {{THRIFT_NS}}::TErrorCode::EUnknown;
    }
    {{THRIFT_NS}}::TErrorCode::type removeData(int64_t key){
         if(this->m_pmodel) 
            return m_pmodel->removeData(key);
        return  {{THRIFT_NS}}::TErrorCode::EUnknown;
    }
    
    void getListData({{THRIFT_NS}}::TListDataResult& _return, const std::vector<int64_t> lskeys){
         std::vector<OpenStars::Common::TPostStorageService::TPostItem> listdatas;
         if (this->m_pmodel) {
             for(int i = 0 ; i < listkey.size();i++){
                 OpenStars::Common::TPostStorageService::TDataResult tempresult;
                 getData(tempresult,listkey[i]);
                 if (tempresult.errorCode == OpenStars::Common::TPostStorageService::TErrorCode::EGood){
                      listdatas.push_back(tempresult.data);  
                 }
             }
            _return.__set_errorCode(OpenStars::Common::TPostStorageService::TErrorCode::EGood);
            _return.__set_listDatas(listdatas);
            return;
         }
         _return.__set_errorCode(OpenStars::Common::TPostStorageService::TErrorCode::EUnknown);
    }
};

#endif /* SERVICEHANDLER_H */
