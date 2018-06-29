package main
import (
	"../../thrift{{GOGEN_PATH}}" //Todo: Fix this
	"../transports"  //Todo: Fix this
	"fmt"
	"context"
)

func main(){
	aClient := transports.Get{{THRIFT_SERVICE_NAME}}CompactClient("127.0.0.1", "8883") //Todo: Check port and protocol
	defer aClient.BackToPool();
	fmt.Println("Client: ", aClient);

	res, _ := aClient.Client.(*{{GO_PACKAGE}}.{{THRIFT_SERVICE_NAME}}Client).GetData(context.Background(), ({{GO_PACKAGE}}.TKey)(10) )
	fmt.Println("get result: ",res)

	aClient.Client.(*{{GO_PACKAGE}}.{{THRIFT_SERVICE_NAME}}Client).PutData(context.Background(),
			 ({{GO_PACKAGE}}.TKey)(10), &{{GO_PACKAGE}}.{{DATAITEM_TYPE_THRIFT}}{} );//Todo: fill structure here

	res, _ = aClient.Client.(*{{GO_PACKAGE}}.{{THRIFT_SERVICE_NAME}}Client).GetData(context.Background(), ({{GO_PACKAGE}}.TKey)(10) )
	fmt.Println("get after put :", res)

}