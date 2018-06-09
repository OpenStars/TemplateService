/* 
 * File:   ServiceModel.cpp
 * Author: trungthanh
 * 
 * Created on June 08, 2018, 6:13 PM
 */

#include "ServiceModel.h"

using namespace std;

ServiceModel::ServiceModel(Poco::SharedPtr<PersistentStorageType> aStorage) : m_storage(aStorage) {
}

ServiceModel::~ServiceModel(void) {
}

void ServiceModel::getData({{THRIFT_NS}}::TDataResult& _return, 
        const {{THRIFT_NS}}::TKey key)
{
    class get_value_visitor : public PersistentStorageType::data_visitor {
    public:

        get_value_visitor({{THRIFT_NS}}::TDataResult& _output) : output(_output) {
        }

        virtual bool visit(const PersistentStorageType::TKey& key, PersistentStorageType::TValue& value) {
            value.assignTo(this->output.data);
            return false;
        }

        {{THRIFT_NS}}::TDataResult& output;
    };

    
    if (this->m_storage) {
        get_value_visitor visitor(_return);
        this->m_storage->visit(key, &visitor);        
    }    
}

{{THRIFT_NS}}::TErrorCode::type ServiceModel::putData(
                                const {{THRIFT_NS}}::TData& data)
{
    class putdata_visitor : public PersistentStorageType::data_visitor {
    public:

        putdata_visitor(const {{THRIFT_NS}}::TData& aData) : data(aData) {
        }

        virtual bool visit(const PersistentStorageType::TKey& key, PersistentStorageType::TValue& value) {
            value.assignFrom(data);
            return true;
        }

        const {{THRIFT_NS}}::TData& data;
    };


    if (this->m_storage) {
        putdata_visitor visitor(data);
        this->m_storage->visit(data.uid, &visitor);
    }    
}
