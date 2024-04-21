#include <google/protobuf/service.h>

#include "shutdown_hooks.hpp"

void shutdownChiyotatsu(void)
{
    google::protobuf::ShutdownProtobufLibrary();
}
