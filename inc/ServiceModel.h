/* 
 * File:   ServiceModel.h
 * Author: trungthanh
 *
 * Created on June 08, 2018, 6:13 PM
 */

#ifndef _SERVICEMODEL_H
#define _SERVICEMODEL_H

#include <vector>
#include <map>
#include "storagedef.h"

class ServiceModel {
public:
    ServiceModel(Poco::SharedPtr<PersistentStorageType> aStorage);
    virtual ~ServiceModel(void);

public:
  void getData( {{THRIFT_NS}}::TDataResult& _return, const {{THRIFT_NS}} ::TKey key);

  {{THRIFT_NS}}::TErrorCode::type putData( {{THRIFT_NS}}::TKey key, 
                const {{THRIFT_NS}}::{{DATAITEM_TYPE_THRIFT}}& data);
   {{THRIFT_NS}}::TErrorCode::type         removeData(int64_t key);
   
private:
    ServiceModel(const ServiceModel& orig);
    Poco::SharedPtr<PersistentStorageType> m_storage;
};

#endif /* _SERVICEMODEL_H */

