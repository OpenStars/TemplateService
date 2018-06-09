rm gen-cpp/*
../../../../contribs/ApacheThrift/bin/thrift -r -gen cpp {{THRIFT_FILE_NAME}}.thrift
../../../../contribs/ApacheThrift/bin/thrift -r -gen go  {{THRIFT_FILE_NAME}}.thrift
rm gen-cpp/*skele*
