#include "google/protobuf/stubs/common.h"

#include "chiyotatsu-util.hpp"

namespace chiyotatsu
{
void shutdown(void)
{
    google::protobuf::ShutdownProtobufLibrary();
}
} // namespace chiyotatsu
