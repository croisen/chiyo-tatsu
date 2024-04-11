#ifndef CROI_APP_CHIYO_TATSU_TACHIYOMI_GZIP
#define CROI_APP_CHIYO_TATSU_TACHIYOMI_GZIP

#include <stdint.h>

uint64_t tachiyomiGzipLoad(const char *filename, uint8_t **out_buf);

#endif
