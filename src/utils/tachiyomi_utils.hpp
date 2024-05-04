#ifndef __CHIYOTATSU_TACHIYOMI_SOURCE_IDS__
#define __CHIYOTATSU_TACHIYOMI_SOURCE_IDS__

#include <cstdint>
#include <map>
#include <string>

#include "../compiled_proto/tachiyomi.pb.h"

namespace tachiyomi
{
extern const std::map<int64_t, std::string> PBoneSourceIDs;
Backup parseTachiyomiFile(std::string input);
} // namespace tachiyomi

#endif // __CHIYOTATSU_TACHIYOMI_SOURCE_IDS__
