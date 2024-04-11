#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include <string.h>
#include <zconf.h>
#include <zlib.h>

#include "memtracker.h"
#include "tachiyomi_gzip.h"

#define CHUNK      131072
#define WINDOWBITS 16

uint64_t tachiyomiGzipLoad(const char *filename, uint8_t **buffer_out)
{
    FILE *tachiyomiBk = fopen(filename, "rb");
    if (tachiyomiBk == NULL)
        memTrackerPanic(
            EXIT_FAILURE, MTFAIL, "Cannot open tachiyomi backup file %s\n",
            filename
        );

    int64_t ret        = 0;
    uint64_t have      = 0;
    uint8_t in[CHUNK]  = {0};
    uint8_t out[CHUNK] = {0};
    z_stream strm      = {0};

    if (inflateInit2(&strm, WINDOWBITS + MAX_WBITS) != Z_OK) {
        memTrackerPanic(
            EXIT_FAILURE, MTFAIL,
            "Cannot decompress the tachiyomi input file %s\n", filename
        );
    }

    do {
        strm.avail_in = fread(in, 1, CHUNK, tachiyomiBk);
        if (ferror(tachiyomiBk)) {
            (void)inflateEnd(&strm);
            fclose(tachiyomiBk);
            memTrackerPanic(
                EXIT_FAILURE, MTFAIL, "Error in decompressing file %s\n",
                filename
            );
        }

        if (strm.avail_in == 0) {
            break;
        }

        strm.next_in = in;
        do {
            strm.avail_out = CHUNK;
            strm.next_out  = out;

            ret            = inflate(&strm, Z_NO_FLUSH);
            if (ret == Z_STREAM_ERROR) {
                (void)inflateEnd(&strm);
                fclose(tachiyomiBk);
                memTrackerPanic(
                    EXIT_FAILURE, MTFAIL, "Error in decompressing file %s\n",
                    filename
                );
            }

            switch (ret) {
            case Z_NEED_DICT:
                ret = Z_DATA_ERROR; /* and fall through */
            case Z_DATA_ERROR:
            case Z_MEM_ERROR:
                (void)inflateEnd(&strm);
                fclose(tachiyomiBk);
                memTrackerPanic(
                    EXIT_FAILURE, MTFAIL, "Error in decompressing file %s\n",
                    filename
                );
            }

            have              = CHUNK - strm.avail_out;
            uint8_t *new_size = mTRealloc(*buffer_out, strm.total_out);
            if (new_size == NULL) {
                (void)inflateEnd(&strm);
                fclose(tachiyomiBk);
                memTrackerPanic(
                    EXIT_FAILURE, MTFAIL, "Error in decompressing file %s\n",
                    filename
                );
            }

            *buffer_out = new_size;
            memcpy(*buffer_out + strm.total_out - have, out, have);
        } while (strm.avail_out == 0);
    } while (ret != Z_STREAM_END);

    uint64_t written_out = strm.total_out;

    (void)inflateEnd(&strm);
    fclose(tachiyomiBk);

    return written_out;
}
