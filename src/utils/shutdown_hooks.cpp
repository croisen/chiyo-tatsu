#include "google/protobuf/stubs/common.h"

#include "chiyotatsu_util.hpp"

namespace chiyotatsu
{
void shutdown(void)
{
    google::protobuf::ShutdownProtobufLibrary();
}
} // namespace chiyotatsu
