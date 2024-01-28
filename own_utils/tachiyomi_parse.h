#ifndef CROI_APP_CHIYO_TATSU_PARSE
#define CROI_APP_CHIYO_TATSU_PARSE

#include <stdint.h>

#include "tachiyomi.pb-c.h"

BackupManga *deserialize_protobuf(uint8_t *input_uncompressed, uint64_t size);

#endif
