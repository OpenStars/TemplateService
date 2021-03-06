package main
import (
	"os"
	// "text/template"
	"strings"
	// "io"
    "io/ioutil"
	// "os"
	"fmt"
	"flag"
	"path/filepath"
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
	
	DATAITEM_THRIFT_KEY="{{DATAITEM_TYPE_THRIFT}}"
	DATAITEM_THRIFT="TPlatformProfile"
		
	THRIFT_SERVICE_FULLNS_KEY="{{THRIFT_SERVICE_FULLNSNAME}}"
	THRIFT_SERVICE_FULLNS=THRIFTCPP_NS+"::"+THRIFT_SERVICE_NAME
	
	
	DATAINMODEL_THRIFT_KEY="{{MODELDATA_TYPE_THRIFT}}"
	DATAINMODEL_THRIFT=THRIFTCPP_NS+"::"+DATAITEM_THRIFT

	GO_PACKAGE_KEY="{{GO_PACKAGE}}"
	GO_PACKAGE=""

	GOGEN_PATH_KEY="{{GOGEN_PATH}}"
	GOGEN_PATH="/gen-go"
	TempMap map[string]string = make(map[string]string)
)
func main(){
	var outDir string;
	flag.StringVar(&outDir, "outdir", "../generated-services/", "output directory")
	
	// if len(os.Args) > 1 {

	// 	outDir = os.Args[1]+"/"+SERVICE_NAME
	// } else {
	// 	outDir = "../gen/"+SERVICE_NAME
	// }

	// SERVICE_NAME_KEY="{{SERVICE_NAME}}"
	// SERVICE_NAME="PlatformProfileService2"
	
	// SERVICE_BIN="platformprofileservice"
	
	// THRIFT_FILE="openstarsprofile"
	
	// THRIFTCPP_NS="OpenStars::Platform::Profile"
	
	// THRIFTCPPDOT_NS="OpenStars.Platform.Profile"
	
	// THRIFT_SERVICE_NAME="TPlatformProfileService"
	
	// DATAITEM_THRIFT="TPlatformProfile"
	flag.StringVar(&SERVICE_BIN, "SERVICE_BIN", "platformprofileservice", "Binary output name")
	flag.StringVar(&THRIFT_FILE, "THRIFT_FILE", "serviceinterface", "thrift file name name")
	flag.StringVar(&THRIFTCPP_NS, "THRIFTCPP_NS", "OpenStars::Platform::Profile", "cpp namespace of thrift generated")
	flag.StringVar(&THRIFTCPPDOT_NS, "THRIFTCPPDOT_NS", "OpenStars.Platform.Profile", "namespace in thrift file")
	flag.StringVar(&THRIFT_SERVICE_NAME, "THRIFT_SERVICE_NAME", "TPlatformProfileService", "Main Thrift serivce name")
	flag.StringVar(&DATAITEM_THRIFT, "DATAITEM_THRIFT", "TPlatformProfile", "Data item type name")
	flag.StringVar(&SERVICE_NAME, "SERVICE_NAME", "PlatformProfileService2", "Project Name")

	flag.Parse()

	//re-evaluate 
	THRIFT_SERVICE_FULLNS=THRIFTCPP_NS+"::"+THRIFT_SERVICE_NAME		
	DATAINMODEL_THRIFT=THRIFTCPP_NS+"::"+DATAITEM_THRIFT

//
//	Parse something from THRIFTCPPDOT_NS

	Packages := strings.Split(THRIFTCPPDOT_NS,".")
	if len(Packages) > 0 {
		GO_PACKAGE = Packages[len(Packages)-1]

		GOGEN_PATH = "/gen-go";

		for _, aPkg := range Packages{
			GOGEN_PATH = GOGEN_PATH+"/"+ aPkg
		}
	}
	// GO_PACKAGE_KEY="{{GO_PACKAGE}}"
	// GO_PACKAGE=""

	// GOGEN_PATH_KEY="{{GOGEN_PATH}}"
	// GOGEN_PATH="/gen-go/OpenStars/"

//

	outDir = filepath.Join(outDir, SERVICE_NAME)
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
	processFile( "nbproject/Makefile-variables.mk" , outDir + "/nbproject/Makefile-variables.mk" )
	processFile( "nbproject/Makefile-impl.mk" , outDir + "/nbproject/Makefile-impl.mk" )
	processFile( "nbproject/Makefile-Debug.mk" , outDir + "/nbproject/Makefile-Debug.mk" )
	processFile( "nbproject/Makefile-Release.mk" , outDir + "/nbproject/Makefile-Release.mk" )
	processFile( "nbproject/Makefile-Release_Full.mk" , outDir + "/nbproject/Makefile-Release_Full.mk" )
	processFile( "nbproject/configurations.xml" , outDir + "/nbproject/configurations.xml" )
	processFile( "nbproject/project.xml" , outDir + "/nbproject/project.xml" )
	processFile( "Makefile" , outDir + "/Makefile" )
	processFile( "template_service.properties" , outDir + "/"+SERVICE_BIN + ".properties" )

	os.MkdirAll(outDir + "/go-clients/transports", 0777)
	os.MkdirAll(outDir + "/go-clients/test", 0777)
	processFile("go-client/template-transport.go" , outDir + "/go-clients/transports/transport.go")
	processFile("go-client/template-testclient.go" , outDir + "/go-clients/test/main.go")
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

	s = strings.Replace( s, GOGEN_PATH_KEY, GOGEN_PATH, -1)
	s = strings.Replace( s, GO_PACKAGE_KEY, GO_PACKAGE, -1)
	
	ioutil.WriteFile(outFileName,  []byte(s) , 0644 );
	//fmt.Println(s);
}
