#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux
CND_DLIB_EXT=so
CND_CONF=Release
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/src/ServerApp.o \
	${OBJECTDIR}/src/ServiceModel.o \
	${OBJECTDIR}/src/main.o \
	${OBJECTDIR}/thrift/gen-cpp/TDataService.o \
	${OBJECTDIR}/thrift/gen-cpp/{{THRIFT_FILE_NAME}}_constants.o \
	${OBJECTDIR}/thrift/gen-cpp/{{THRIFT_FILE_NAME}}_types.o \
	${OBJECTDIR}/thrift/gen-cpp/{{THRIFT_SERVICE_NAME}}.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=../../corelibs/OpenStorage/lib/libopenstorage.a ../../../corelibs/BaseFoundation/lib/libbasefoundation.a ../../../contribs/ApacheThrift/lib/libapachethrift.a ../../../contribs/SpecialContribs/lib/libspecialcontribs.a ../../../contribs/Poco/lib/libpocoall.a ../../../contribs/LibEvent/lib/libevent.a  ../../../contribs/SpecialContribs/lib/libetcd-cpp-api.a ../../../contribs/SpecialContribs/lib/libares.a ../../../contribs/SpecialContribs/lib/libboost_atomic.a ../../../contribs/SpecialContribs/lib/libboost_chrono.a ../../../contribs/SpecialContribs/lib/libboost_date_time.a ../../../contribs/SpecialContribs/lib/libboost_locale.a ../../../contribs/SpecialContribs/lib/libboost_regex.a ../../../contribs/SpecialContribs/lib/libboost_system.a ../../../contribs/SpecialContribs/lib/libboost_thread.a ../../../contribs/SpecialContribs/lib/libcpprest.a ../../../contribs/SpecialContribs/lib/libgpr.a ../../../contribs/SpecialContribs/lib/libgrpc++.a ../../../contribs/SpecialContribs/lib/libgrpc++_core_stats.a ../../../contribs/SpecialContribs/lib/libgrpc++_cronet.a ../../../contribs/SpecialContribs/lib/libgrpc++_error_details.a ../../../contribs/SpecialContribs/lib/libgrpc++_reflection.a ../../../contribs/SpecialContribs/lib/libgrpc++_unsecure.a ../../../contribs/SpecialContribs/lib/libgrpc.a ../../../contribs/SpecialContribs/lib/libgrpc_unsecure.a ../../../contribs/SpecialContribs/lib/libgrpcpp_channelz.a ../../../contribs/SpecialContribs/lib/libprotobuf.a `pkg-config --libs zlib` `pkg-config --libs openssl` -ldl  -lpthread -lrt  

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk bin/{{SERVICE_BIN}}

bin/{{SERVICE_BIN}}: ../../../corelibs/OpenStorage/lib/libopenstorage.a

bin/{{SERVICE_BIN}}: ../../../corelibs/BaseFoundation/lib/libbasefoundation.a

bin/{{SERVICE_BIN}}: ../../../contribs/ApacheThrift/lib/libapachethrift.a

bin/{{SERVICE_BIN}}: ../../../contribs/SpecialContribs/lib/libspecialcontribs.a

bin/{{SERVICE_BIN}}: ../../../contribs/Poco/lib/libpocoall.a

bin/{{SERVICE_BIN}}: ../../../contribs/LibEvent/lib/libevent.a

bin/{{SERVICE_BIN}}: ${OBJECTFILES}
	${MKDIR} -p bin
	${LINK.cc} -o bin/{{SERVICE_BIN}} ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/src/ServerApp.o: src/ServerApp.cpp
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DHAVE_CONFIG_H -Iinc -I../../contribs/LibEvent/include -I../../contribs/Boost/include -I../../contribs/Poco/include -I../../contribs/ApacheThrift/include -I../../contribs/SpecialContribs/include -Ithrift/gen-cpp -I../../contribs/SpecialContribs/src/hashkit -I../../contribs/SpecialContribs/src/libstatgrab -I../../contribs/SpecialContribs/include/kyotocabinet -I../../contribs/SpecialContribs/include/leveldb -I../../contribs/SpecialContribs/src/ -I../../corelibs/BaseFoundation/include -I../../corelibs/OpenStorage/inc -I../../corelibs/BaseFoundation/thrift/gen-cpp -IClient -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/ServerApp.o src/ServerApp.cpp

${OBJECTDIR}/src/ServiceModel.o: src/ServiceModel.cpp
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DHAVE_CONFIG_H -Iinc -I../../contribs/LibEvent/include -I../../contribs/Boost/include -I../../contribs/Poco/include -I../../contribs/ApacheThrift/include -I../../contribs/SpecialContribs/include -Ithrift/gen-cpp -I../../contribs/SpecialContribs/src/hashkit -I../../contribs/SpecialContribs/src/libstatgrab -I../../contribs/SpecialContribs/include/kyotocabinet -I../../contribs/SpecialContribs/include/leveldb -I../../contribs/SpecialContribs/src/ -I../../corelibs/BaseFoundation/include -I../../corelibs/OpenStorage/inc -I../../corelibs/BaseFoundation/thrift/gen-cpp -IClient -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/ServiceModel.o src/ServiceModel.cpp

${OBJECTDIR}/src/main.o: src/main.cpp
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DHAVE_CONFIG_H -Iinc -I../../contribs/LibEvent/include -I../../contribs/Boost/include -I../../contribs/Poco/include -I../../contribs/ApacheThrift/include -I../../contribs/SpecialContribs/include -Ithrift/gen-cpp -I../../contribs/SpecialContribs/src/hashkit -I../../contribs/SpecialContribs/src/libstatgrab -I../../contribs/SpecialContribs/include/kyotocabinet -I../../contribs/SpecialContribs/include/leveldb -I../../contribs/SpecialContribs/src/ -I../../corelibs/BaseFoundation/include -I../../corelibs/OpenStorage/inc -I../../corelibs/BaseFoundation/thrift/gen-cpp -IClient -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/main.o src/main.cpp

${OBJECTDIR}/thrift/gen-cpp/TDataService.o: thrift/gen-cpp/TDataService.cpp
	${MKDIR} -p ${OBJECTDIR}/thrift/gen-cpp
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DHAVE_CONFIG_H -Iinc -I../../contribs/LibEvent/include -I../../contribs/Boost/include -I../../contribs/Poco/include -I../../contribs/ApacheThrift/include -I../../contribs/SpecialContribs/include -Ithrift/gen-cpp -I../../contribs/SpecialContribs/src/hashkit -I../../contribs/SpecialContribs/src/libstatgrab -I../../contribs/SpecialContribs/include/kyotocabinet -I../../contribs/SpecialContribs/include/leveldb -I../../contribs/SpecialContribs/src/ -I../../corelibs/BaseFoundation/include -I../../corelibs/OpenStorage/inc -I../../corelibs/BaseFoundation/thrift/gen-cpp -IClient -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/thrift/gen-cpp/TDataService.o thrift/gen-cpp/TDataService.cpp

${OBJECTDIR}/thrift/gen-cpp/{{THRIFT_FILE_NAME}}_constants.o: thrift/gen-cpp/{{THRIFT_FILE_NAME}}_constants.cpp
	${MKDIR} -p ${OBJECTDIR}/thrift/gen-cpp
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DHAVE_CONFIG_H -Iinc -I../../contribs/LibEvent/include -I../../contribs/Boost/include -I../../contribs/Poco/include -I../../contribs/ApacheThrift/include -I../../contribs/SpecialContribs/include -Ithrift/gen-cpp -I../../contribs/SpecialContribs/src/hashkit -I../../contribs/SpecialContribs/src/libstatgrab -I../../contribs/SpecialContribs/include/kyotocabinet -I../../contribs/SpecialContribs/include/leveldb -I../../contribs/SpecialContribs/src/ -I../../corelibs/BaseFoundation/include -I../../corelibs/OpenStorage/inc -I../../corelibs/BaseFoundation/thrift/gen-cpp -IClient -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/thrift/gen-cpp/{{THRIFT_FILE_NAME}}_constants.o thrift/gen-cpp/{{THRIFT_FILE_NAME}}_constants.cpp

${OBJECTDIR}/thrift/gen-cpp/{{THRIFT_FILE_NAME}}_types.o: thrift/gen-cpp/{{THRIFT_FILE_NAME}}_types.cpp
	${MKDIR} -p ${OBJECTDIR}/thrift/gen-cpp
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DHAVE_CONFIG_H -Iinc -I../../contribs/LibEvent/include -I../../contribs/Boost/include -I../../contribs/Poco/include -I../../contribs/ApacheThrift/include -I../../contribs/SpecialContribs/include -Ithrift/gen-cpp -I../../contribs/SpecialContribs/src/hashkit -I../../contribs/SpecialContribs/src/libstatgrab -I../../contribs/SpecialContribs/include/kyotocabinet -I../../contribs/SpecialContribs/include/leveldb -I../../contribs/SpecialContribs/src/ -I../../corelibs/BaseFoundation/include -I../../corelibs/OpenStorage/inc -I../../corelibs/BaseFoundation/thrift/gen-cpp -IClient -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/thrift/gen-cpp/{{THRIFT_FILE_NAME}}_types.o thrift/gen-cpp/{{THRIFT_FILE_NAME}}_types.cpp

${OBJECTDIR}/thrift/gen-cpp/{{THRIFT_SERVICE_NAME}}.o: thrift/gen-cpp/{{THRIFT_SERVICE_NAME}}.cpp
	${MKDIR} -p ${OBJECTDIR}/thrift/gen-cpp
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -DHAVE_CONFIG_H -Iinc -I../../contribs/LibEvent/include -I../../contribs/Boost/include -I../../contribs/Poco/include -I../../contribs/ApacheThrift/include -I../../contribs/SpecialContribs/include -Ithrift/gen-cpp -I../../contribs/SpecialContribs/src/hashkit -I../../contribs/SpecialContribs/src/libstatgrab -I../../contribs/SpecialContribs/include/kyotocabinet -I../../contribs/SpecialContribs/include/leveldb -I../../contribs/SpecialContribs/src/ -I../../corelibs/BaseFoundation/include -I../../corelibs/OpenStorage/inc -I../../corelibs/BaseFoundation/thrift/gen-cpp -IClient -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/thrift/gen-cpp/{{THRIFT_SERVICE_NAME}}.o thrift/gen-cpp/{{THRIFT_SERVICE_NAME}}.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
