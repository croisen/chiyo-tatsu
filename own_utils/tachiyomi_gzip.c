#include <stdbool.h>
#include <stdio.h>

#include <string.h>
#include <zconf.h>
#include <zlib.h>

#include "bread_parser.h"
#include "tachiyomi_gzip.h"

#define CHUNK      524288
#define WINDOWBITS 16

size_t tachiyomi_gzip_load(const char *filename,
                           unsigned char **input_uncompressed)
{
    FILE *tachiyomi_bk = fopen(filename, "rb");
    if (tachiyomi_bk == NULL)
    {
        __bread_panic("Cannot open tachiyomi backup %s, LINE: %d\n", filename,
                      __LINE__);
    }

    int ret       = 0;
    unsigned have = 0;

    z_stream strm = {0};
    unsigned char in[CHUNK];
    unsigned char out[CHUNK];

    if (inflateInit2(&strm, WINDOWBITS + MAX_WBITS) != Z_OK)
    {
        __bread_panic(
            "Cannot decompress the tachiyomi input file %s, LINE: %d\n",
            filename, __LINE__);
    }

    do
    {
        strm.avail_in = fread(in, 1, CHUNK, tachiyomi_bk);
        if (ferror(tachiyomi_bk))
        {
            (void)inflateEnd(&strm);
            fclose(tachiyomi_bk);
            __bread_panic("Error in decompressing file %s, LINE: %d\n",
                          filename, __LINE__);
        }

        if (strm.avail_in == 0)
        {
            break;
        }

        strm.next_in = in;
        do
        {
            strm.avail_out = CHUNK;
            strm.next_out  = out;

            ret            = inflate(&strm, Z_NO_FLUSH);
            if (ret == Z_STREAM_ERROR)
            {
                (void)inflateEnd(&strm);
                fclose(tachiyomi_bk);
                __bread_panic("Error in decompressing file %s, LINE: %d\n",
                              filename, __LINE__);
            }

            switch (ret)
            {
            case Z_NEED_DICT:
                printf("Decompressing: %s, Need a dict\n", filename);
                ret = Z_DATA_ERROR; /* and fall through */
            case Z_DATA_ERROR:
                printf("Decompressing: %s, Data error\n", filename);
            case Z_MEM_ERROR:
                printf("Decompressing: %s, Mem error\n", filename);
                (void)inflateEnd(&strm);
                fclose(tachiyomi_bk);
                __bread_panic("Error in decompressing file %s, LINE: %d\n",
                              filename, __LINE__);
            }

            have                    = CHUNK - strm.avail_out;
            unsigned char *new_size = __bread_realloc(
                *input_uncompressed, strm.total_out * sizeof(unsigned char));
            if (new_size == NULL)
            {
                (void)inflateEnd(&strm);
                fclose(tachiyomi_bk);
                __bread_panic("Error in decompressing file %s, LINE: %d\n",
                              filename, __LINE__);
            }

            *input_uncompressed = new_size;
            memcpy(*input_uncompressed + strm.total_out - have, out, have);
        } while (strm.avail_out == 0);
    } while (ret != Z_STREAM_END);

    size_t written_out = strm.total_out;

    (void)inflateEnd(&strm);
    fclose(tachiyomi_bk);

    return written_out;
}
