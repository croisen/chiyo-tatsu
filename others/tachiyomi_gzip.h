#ifndef CROI_APP_CHIYO_TATSU_TACHIYOMI_GZIP
#define CROI_APP_CHIYO_TATSU_TACHIYOMI_GZIP

#include <stdio.h>

void tachiyomi_gzip_inflate(const char **compressed_bytes,
                            const char **uncompressed_bytes);

void tachiyomi_gzip_load(FILE *input, const char *filename);
void tachiyomi_gzip_print(FILE *input);

#endif
