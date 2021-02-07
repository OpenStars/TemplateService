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
        if (this->m_pmodel){
            m_pmodel->getData(_return, key);
            if(_return.data.uid == 0){
                 _return.__set_errorCode({{THRIFT_NS}}::TErrorCode::ENotFound);
            }
        }
            
    }
    {{THRIFT_NS}}::TErrorCode::type putData( {{THRIFT_NS}}::TKey key,
                                const {{THRIFT_NS}}::TData& data)
    {
        if (this->m_pmodel){
            return m_pmodel->putData(key, data);
        }
        return {{THRIFT_NS}}::TErrorCode::EUnknown;
    }
    {{THRIFT_NS}}::TErrorCode::type removeData(int64_t key){
         if(this->m_pmodel) 
            return m_pmodel->removeData(key);
        return  {{THRIFT_NS}}::TErrorCode::EUnknown;
    }
    
    void getListData({{THRIFT_NS}}::TListDataResult& _return, const std::vector<int64_t>&lskeys){
         std::vector<{{THRIFT_NS}}::{{DATAITEM_TYPE_THRIFT}}> listdatas;
         std::vector<int64_t> missingkeys;
         if (this->m_pmodel) {
             for(int i = 0 ; i < lskeys.size();i++){
                 {{THRIFT_NS}}::TDataResult tempresult;
                 getData(tempresult,lskeys[i]);
                 if (tempresult.errorCode == {{THRIFT_NS}}::TErrorCode::EGood){
                      listdatas.push_back(tempresult.data);  
                 }else{
                     missingkeys.push_back(lskeys[i]);
                 }
             }
            _return.__set_errorCode({{THRIFT_NS}}::TErrorCode::EGood);
            _return.__set_data(listdatas);
            _return.__set_missingkeys(missingkeys);
            return;
         }
         _return.__set_errorCode({{THRIFT_NS}}::TErrorCode::EUnknown);
    }
};

#endif /* SERVICEHANDLER_H */
