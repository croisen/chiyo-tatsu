#include "google/protobuf/stubs/common.h"

#include "shutdown_hooks.hpp"

namespace chiyotatsu
{
void shutdown(void)
{
    google::protobuf::ShutdownProtobufLibrary();
}
} // namespace chiyotatsu
