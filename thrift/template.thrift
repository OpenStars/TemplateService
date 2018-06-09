namespace cpp {{THRIFTDOT_CPP_NS}}
namespace go {{THRIFTDOT_CPP_NS}}
namespace java {{THRIFTDOT_CPP_NS}}

typedef i64 TKey

enum TErrorCode{
    EGood = 0,
    ENotFound = -1,
    EUnknown = -2 ,
    EDataExisted = -3
}

struct {{DATAITEM_TYPE_THRIFT}}{
    1: TKey uid
    2: string username,
    3: string displayName
    4: map<string, bool> trustedEmails,
    5: map<string, bool> trustedMobiles,
    6: list<string> publicKeys, //for using with secp256k1

}

typedef {{DATAITEM_TYPE_THRIFT}} TData


struct TDataResult{
    1: TErrorCode errorCode,
    2: optional TData data
    
}

service TDataServiceR{
    TDataResult getData(1: TKey key), 
}

service TDataService{
    TDataResult getData(1: TKey key), 
    TErrorCode putData(1: TData data)
}

service {{THRIFT_SERVICE_NAME}} extends TDataService{
    
}


