#ifndef CROI_APP_CHIYO_TATSU_TACHIYOMI_GZIP
#define CROI_APP_CHIYO_TATSU_TACHIYOMI_GZIP

#include <stdint.h>

extern unsigned char **input_uncompressed;

uint64_t tachiyomi_gzip_load(const char *filename, uint8_t **out_buf);

#endif
