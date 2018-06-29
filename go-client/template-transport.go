package transports

import (
	// "github.com/OpenStars/backendclients/go/{{GOGEN_PATH}}" //Todo: Fix this
	"../../thrift{{GOGEN_PATH}}" //Todo: Fix this
	"git.apache.org/thrift.git/lib/go/thrift"
	"fmt"
	"github.com/OpenStars/thriftpool"	
	)


var (
	m{{THRIFT_SERVICE_NAME}}BinaryMapPool = thriftpool.NewMapPool(1000, 3600, 3600, 
		thriftpool.GetThriftClientCreatorFunc( func( c thrift.TClient ) (interface{}) { return  ({{GO_PACKAGE}}.New{{THRIFT_SERVICE_NAME}}Client(c)) }),
		thriftpool.DefaultClose)

	m{{THRIFT_SERVICE_NAME}}CommpactMapPool = thriftpool.NewMapPool(1000, 3600, 3600, 
		thriftpool.GetThriftClientCreatorFuncCompactProtocol( func(c thrift.TClient) (interface{}) { return  ({{GO_PACKAGE}}.New{{THRIFT_SERVICE_NAME}}Client(c)) }),
		thriftpool.DefaultClose)		
	
	)

 


func init(){
	fmt.Println("init thrift {{THRIFT_SERVICE_NAME}} client ");
}

//Get{{THRIFT_SERVICE_NAME}}BinaryClient client by host:port
func Get{{THRIFT_SERVICE_NAME}}BinaryClient(aHost, aPort string) *thriftpool.ThriftSocketClient{
	client, _ := m{{THRIFT_SERVICE_NAME}}BinaryMapPool.Get(aHost, aPort).Get()
	return client;
}

//Get{{THRIFT_SERVICE_NAME}}CompactClient get compact client by host:port
func Get{{THRIFT_SERVICE_NAME}}CompactClient(aHost, aPort string) *thriftpool.ThriftSocketClient{
	client, _ := m{{THRIFT_SERVICE_NAME}}CommpactMapPool.Get(aHost, aPort).Get()
	return client;
}