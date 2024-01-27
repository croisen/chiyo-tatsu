#ifndef CROI_APP_CHIYO_TATSU_TACHIYOMI_GZIP
#define CROI_APP_CHIYO_TATSU_TACHIYOMI_GZIP

#include <stdio.h>

extern unsigned char **input_uncompressed;

size_t tachiyomi_gzip_load(const char *filename,
                           unsigned char **input_uncompressed);
void tachiyomi_gzip_print(const unsigned char **input_uncompressed);

#endif
