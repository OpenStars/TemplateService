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
    {{THRIFT_NS}}::TErrorCode::type putData(
                                const {{THRIFT_NS}}::TData& data)
    {
        if (this->m_pmodel)
            return m_pmodel->putData(data);
        return {{THRIFT_NS}}::TErrorCode::EUnknown;
    }

};

#endif /* SERVICEHANDLER_H */
