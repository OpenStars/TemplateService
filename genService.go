package main
import (
	"os"
	// "text/template"
	"strings"
	// "io"
    "io/ioutil"
	// "os"
	"fmt"
)

type CODE_VARS struct {
	
}
var (
	SERVICE_NAME_KEY="{{SERVICE_NAME}}"
	SERVICE_NAME="PlatformProfileService2"
	
	SERVICE_BIN_KEY="{{SERVICE_BIN}}"
	SERVICE_BIN="platformprofileservice"
	
	THRIFT_FILE_KEY="{{THRIFT_FILE_NAME}}"
	THRIFT_FILE="openstarsprofile"
	
	THRIFTCPP_NS_KEY="{{THRIFT_NS}}"
	THRIFTCPP_NS="OpenStars::Platform::Profile"
	
	THRIFTCPPDOT_NS_KEY="{{THRIFTDOT_CPP_NS}}"
	THRIFTCPPDOT_NS="OpenStars.Platform.Profile"
	
	THRIFT_SERVICE_NAME_KEY="{{THRIFT_SERVICE_NAME}}"
	THRIFT_SERVICE_NAME="TPlatformProfileService"
	
	
	THRIFT_SERVICE_FULLNS_KEY="{{THRIFT_SERVICE_FULLNSNAME}}"
	THRIFT_SERVICE_FULLNS=THRIFTCPP_NS+"::"+THRIFT_SERVICE_NAME
	
	DATAITEM_THRIFT_KEY="{{DATAITEM_TYPE_THRIFT}}"
	DATAITEM_THRIFT="TPlatformProfile"
	
	DATAINMODEL_THRIFT_KEY="{{MODELDATA_TYPE_THRIFT}}"
	DATAINMODEL_THRIFT=THRIFTCPP_NS+"::"+DATAITEM_THRIFT

	TempMap map[string]string = make(map[string]string)
)
func main(){
	var outDir string;
	if len(os.Args) > 1 {
		outDir = os.Args[1]+"/"+SERVICE_NAME
	} else {
		outDir = "../gen/"+SERVICE_NAME
	}
	fmt.Println("outDir:", outDir)
	os.MkdirAll(outDir, 0777)
	os.MkdirAll(outDir + "/inc", 0777)
	os.MkdirAll(outDir + "/src", 0777)
	os.MkdirAll(outDir + "/thrift", 0777)
	os.MkdirAll(outDir + "/nbproject", 0777)
	
	processFile( "inc/ModelData.h", outDir+"/inc/ModelData.h")	
	processFile( "inc/ServerApp.h" , outDir + "/inc/ServerApp.h" )
	processFile( "inc/ServiceHandler.h" , outDir + "/inc/ServiceHandler.h" )
	processFile( "inc/ServiceModel.h" , outDir + "/inc/ServiceModel.h")
	processFile( "inc/storagedef.h" , outDir + "/inc/storagedef.h" )
		
	processFile( "src/ServerApp.cpp" , outDir + "/src/ServerApp.cpp" )
	processFile( "src/ServiceModel.cpp" , outDir + "/src/ServiceModel.cpp" )
	processFile( "src/main.cpp" , outDir + "/src/main.cpp")
	
	processFile( "thrift/template.thrift" , outDir + "/thrift/"+THRIFT_FILE+ ".thrift" )
	processFile( "thrift/thriftgen.sh" , outDir + "/thrift/thriftgen.sh" )

	processFile( "nbproject/configurations.xml" , outDir + "/nbproject/configurations.xml" )
	processFile( "nbproject/Makefile-Debug.mk" , outDir + "/nbproject/Makefile-Debug.mk" )
	processFile( "nbproject/Makefile-Release.mk" , outDir + "/nbproject/Makefile-Release.mk" )
	processFile( "nbproject/Makefile-Release_Full.mk" , outDir + "/nbproject/Makefile-Release_Full.mk" )
	processFile( "nbproject/configurations.xml" , outDir + "/nbproject/configurations.xml" )
	processFile( "nbproject/project.xml" , outDir + "/nbproject/project.xml" )
	processFile( "Makefile" , outDir + "/Makefile" )
	processFile( "template_service.properties" , outDir + "/"+SERVICE_BIN + ".properties" )
		
}

func processFile(filename string, outFileName string){
	template, err := ioutil.ReadFile(filename)
	if err != nil {
		return
	}
	s := strings.Replace(string(template), SERVICE_NAME_KEY, SERVICE_NAME, -1)
	s = strings.Replace( s, SERVICE_BIN_KEY, SERVICE_BIN, -1)
	s = strings.Replace( s, THRIFT_FILE_KEY, THRIFT_FILE, -1)
	s = strings.Replace( s, THRIFTCPP_NS_KEY, THRIFTCPP_NS, -1)	
	s = strings.Replace( s, THRIFTCPPDOT_NS_KEY, THRIFTCPPDOT_NS, -1);
	s = strings.Replace( s, THRIFT_SERVICE_NAME_KEY, THRIFT_SERVICE_NAME, -1)
	s = strings.Replace( s, THRIFT_SERVICE_FULLNS_KEY, THRIFT_SERVICE_FULLNS, -1)	
	s = strings.Replace( s, DATAITEM_THRIFT_KEY, DATAITEM_THRIFT, -1)
	s = strings.Replace( s, DATAINMODEL_THRIFT_KEY, DATAINMODEL_THRIFT, -1)

	ioutil.WriteFile(outFileName,  []byte(s) , 0644 );
	//fmt.Println(s);
}
