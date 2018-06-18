# #!/bin/bash 

	# flag.StringVar(&SERVICE_BIN, "SERVICE_BIN", "platformprofileservice", "Binary output name")
	# flag.StringVar(&THRIFT_FILE, "THRIFT_FILE", "serviceinterface", "thrift file name name")
	# flag.StringVar(&THRIFTCPP_NS, "THRIFTCPP_NS", "OpenStars::Platform::Profile", "cpp namespace of thrift generated")
	# flag.StringVar(&THRIFTCPPDOT_NS, "THRIFTCPPDOT_NS", "OpenStars.Platform.Profile", "namespace in thrift file")
	# flag.StringVar(&THRIFT_SERVICE_NAME, "THRIFT_SERVICE_NAME", "TPlatformProfileService", "Main Thrift serivce name")
	# flag.StringVar(&DATAITEM_THRIFT, "DATAITEM_THRIFT", "TPlatformProfile", "Data item type name")
	# flag.StringVar(&SERVICE_NAME, "SERVICE_NAME", "PlatformProfileService2", "Project Name")

./genService -SERVICE_BIN=passportinfoservice -THRIFT_FILE=passportinfo -THRIFTCPP_NS="OpenStars::Platform::Passport" -THRIFTCPPDOT_NS="OpenStars.Platform.Passport" \
        -THRIFT_SERVICE_NAME="TPassportService" -DATAITEM_THRIFT="TPassportInfo" -SERVICE_NAME=PlatformPassportService

./genService -SERVICE_BIN=gkvservice -THRIFT_FILE=gkv -THRIFTCPP_NS="OpenStars::KV" -THRIFTCPPDOT_NS="OpenStars.KV" \
        -THRIFT_SERVICE_NAME="TSimpleKVService" -DATAITEM_THRIFT="TValueType" -SERVICE_NAME=GKVService

# SERVICE_NAME_KEY="{{SERVICE_NAME}}"
# SERVICE_NAME=PlatformProfileService2

# SERVICE_BIN_KEY="{{SERVICE_BIN}}"
# SERVICE_BIN=platformprofileservice

# THRIFT_FILE_KEY="{{THRIFT_FILE_NAME}}"
# THRIFT_FILE=openstarsprofile

# THRIFTCPP_NS_KEY="{{THRIFT_NS}}"
# THRIFTCPP_NS="OpenStars::Platform::Profile"

# THRIFTCPPDOT_NS_KEY="{{THRIFTDOT_CPP_NS}}"
# THRIFTCPPDOT_NS="OpenStars.Platform.Profile"

# THRIFT_SERVICE_NAME_KEY="{{THRIFT_SERVICE_NAME}}"
# THRIFT_SERVICE_NAME="TPlatformProfileService"


# THRIFT_SERVICE_FULLNS_KEY="{{THRIFT_SERVICE_FULLNSNAME}}"
# THRIFT_SERVICE_FULLNS="$THRIFTCPP_NS::$THRIFT_SERVICE_NAME"

# DATAITEM_THRIFT_KEY="{{DATAITEM_TYPE_THRIFT}}"
# DATAITEM_THRIFT="TPlatformProfile"

# DATAINMODEL_THRIFT_KEY="{{MODELDATA_TYPE_THRIFT}}"
# DATAINMODEL_THRIFT="$THRIFTCPP_NS::$DATAITEM_THRIFT"


# DEST_DIR=../../gen/$SERVICE_NAME
# #
# mkdir -p $DEST_DIR/inc
# mkdir -p $DEST_DIR/src
# mkdir -p $DEST_DIR/thrift
# mkdir -p $DEST_DIR/nbproject

# #cat inc/ModelData.h | sed -e "s/$DATAINMODEL_THRIFT_KEY/$DATAINMODEL_THRIFT/" | sed -e "s/$THRIFTCPP_NS_KEY/$THRIFTCPP_NS/" | \
# #     sed -e "s/$THRIFTCPPDOT_NS_KEY/$THRIFTCPPDOT_NS/" | sed -e "s/$THRIFT_SERVICE_NAME_KEY/$THRIFT_SERVICE_NAME/"  > $DEST_DIR/inc/ModelData.h

# function ProcessFile {
#     echo $1
#     echo $2    
#     cat $1 |  sed -e "s/$DATAINMODEL_THRIFT_KEY/$DATAINMODEL_THRIFT/" | sed -e "s/$THRIFT_FILE_KEY/$THRIFT_FILE/" | sed -e "s/$THRIFT_FILE_KEY/$THRIFT_FILE/" | sed -e "s/$THRIFTCPP_NS_KEY/$THRIFTCPP_NS/" | sed -e "s/$THRIFTCPPDOT_NS_KEY/$THRIFTCPPDOT_NS/" | sed -e "s/$THRIFT_SERVICE_NAME_KEY/$THRIFT_SERVICE_NAME/" | sed -e "s/$THRIFT_SERVICE_FULLNS_KEY/$THRIFT_SERVICE_FULLNS/" | sed -e "s/$THRIFT_SERVICE_NAME_KEY/$THRIFT_SERVICE_NAME/" | sed -e "s/$SERVICE_BIN_KEY/$SERVICE_BIN/" | sed -e "s/$SERVICE_NAME_KEY/$SERVICE_NAME/" | sed -e "s/$DATAITEM_THRIFT_KEY/$DATAITEM_THRIFT/"    > $2
# }

# ProcessFile "inc/ModelData.h" "$DEST_DIR/inc/ModelData.h"
# ProcessFile "inc/ServerApp.h" "$DEST_DIR/inc/ServerApp.h"
# ProcessFile "inc/ServiceHandler.h" "$DEST_DIR/inc/ServiceHandler.h"
# ProcessFile "inc/ServiceModel.h" "$DEST_DIR/inc/ServiceModel.h"
# ProcessFile "inc/storagedef.h" "$DEST_DIR/inc/storagedef.h"


# ProcessFile "src/ServerApp.cpp" "$DEST_DIR/src/ServerApp.cpp"
# ProcessFile "src/ServiceModel.cpp" "$DEST_DIR/src/ServiceModel.cpp"
# ProcessFile "src/main.cpp" "$DEST_DIR/src/main.cpp"

# ProcessFile "thrift/template.thrift" "$DEST_DIR/thrift/$THRIFT_FILE.thrift"
# ProcessFile "thrift/thriftgen.sh" "$DEST_DIR/thrift/thriftgen.sh"


# ProcessFile "nbproject/configurations.xml" "$DEST_DIR/nbproject/configurations.xml"
# ProcessFile "nbproject/Makefile-Debug.mk" "$DEST_DIR/nbproject/Makefile-Debug.mk"
# ProcessFile "nbproject/Makefile-Release.mk" "$DEST_DIR/nbproject/Makefile-Release.mk"
# ProcessFile "nbproject/Makefile-Release_Full.mk" "$DEST_DIR/nbproject/Makefile-Release_Full.mk"
# ProcessFile "nbproject/configurations.xml" "$DEST_DIR/nbproject/configurations.xml" 
# ProcessFile "nbproject/project.xml" "$DEST_DIR/nbproject/project.xml"
# ProcessFile "Makefile" "$DEST_DIR/Makefile"
# ProcessFile "template_service.properties" "$DEST_DIR/$SERVICE_BIN.properties"

# cd $DEST_DIR/thrift/ && bash thriftgen.sh