#include <stdbool.h>
#include <stdio.h>

#include <string.h>
#include <zlib.h>

#include "tachiyomi_gzip.h"

#if defined(MSDOS) || defined(OS2) || defined(_WIN32) || defined(__CYGWIN__)
#include <fcntl.h>
#include <io.h>
#define SET_BINARY_MODE(file) setmode(fileno(file), O_BINARY)
#else
#define SET_BINARY_MODE(file)
#endif

#define CHUNK 131072

static volatile bool zlib_inflate_init = false;

int zlib_deflate(FILE *source, FILE *dest)
{
    int ret = 0, flush = 0;
    unsigned have;
    z_stream strm;
    unsigned char in[CHUNK];
    unsigned char out[CHUNK];

    strm.opaque = Z_NULL;
    strm.zalloc = Z_NULL;
    strm.zfree  = Z_NULL;

    if (zlib_inflate_init == false)
    {
        ret               = inflateInit(&strm);
        zlib_inflate_init = true;
    }

    if (ret != Z_OK)
    {
        return ret;
    }

    do
    {
        strm.avail_in = fread(in, 1, CHUNK, source);
        if (ferror(source))
        {
            (void)inflateEnd(&strm);
            return Z_ERRNO;
        }

        flush        = feof(source) ? Z_FINISH : Z_NO_FLUSH;
        strm.next_in = in;

        do
        {
            strm.avail_out = CHUNK;
            strm.next_out  = out;

            ret            = inflate(&strm, flush);
            have           = CHUNK - strm.avail_out;
            if (fwrite(out, 1, have, dest) != have || ferror(dest))
            {
                (void)inflateEnd(&strm);
                return Z_ERRNO;
            }
        } while (strm.avail_out == 0);
    } while (flush != Z_FINISH);

    (void)inflateEnd(&strm);
    return Z_OK;
}
