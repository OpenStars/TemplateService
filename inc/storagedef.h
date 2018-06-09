/* 
 * File:   storagedef.h
 * Author: trungthanh
 *
 * Created on June 08, 2018, 4:57 PM
 */

#ifndef STORAGEDEF_H
#define STORAGEDEF_H

#include "ModelData.h"
#include "Storage/CachePersistent.h"
#include "Caching/AbstractCache.h"
#include "Caching/CacheFactory.h"
#include "thriftutil/TSerializer.h"
#include "Hashing/DefaultHasher.h"


typedef {{THRIFT_NS}}::TKey KEYTYPE;
typedef {{THRIFT_NS}}::TData VALUETYPE;

typedef TSerializer<VALUETYPE> DataSerializer;
typedef openstars::storage::ObjectStorage< KEYTYPE
, model::ModelData
, DataSerializer > BackendStorageType;

typedef openstars::storage::CachePersistent<KEYTYPE
, model::ModelData
, BackendStorageType
> PersistentStorageType;


typedef PersistentStorageType::CacheType CacheType;

typedef openstars::hashing::DefaultHasher HasherType;

typedef openstars::caching::BasicCacheFactory< KEYTYPE, model::ModelData, HasherType > CacheFactory;



#endif /* STORAGEDEF_H */

