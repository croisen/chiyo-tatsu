#include <stdbool.h>
#include <stdio.h>

#include <string.h>
#include <zlib.h>

#include "bread_parser.h"
#include "tachiyomi_gzip.h"

#if defined(MSDOS) || defined(OS2) || defined(_WIN32) || defined(__CYGWIN__)
#include <fcntl.h>
#include <io.h>
#define SET_BINARY_MODE(file) setmode(fileno(file), O_BINARY)
#else
#define SET_BINARY_MODE(file)
#endif

void tachiyomi_gzip_load(unsigned char **input_uncompressed,
                         const char *filename)
{
    FILE *fp = fopen(filename, "rb");
    if (fp == NULL)
    {
        __bread_panic("Error reading file %s\n", filename);
    }

    gzFile compressed_file = gzdopen(fileno(fp), "r");
    fseek(fp, 0, SEEK_END);
    size_t compressed_size = ftell(fp);
    fseek(fp, 0, SEEK_SET);

    /*const unsigned char *compressed_data =*/
    /*__bread_calloc(compressed_size + 1, sizeof(unsigned char));*/
    /*if (compressed_data == NULL)*/
    /*{*/
    /*gzclose(compressed_file);*/
    /*fclose(fp);*/
    /*__bread_panic(*/
    /*"Cannot allocate memory to store the tachiyomi backup data\n");*/
    /*}*/
    input_uncompressed[0] =
        __bread_calloc((compressed_size * 5) + 1, sizeof(unsigned char));
    if (input_uncompressed[0] == NULL)
    {
        __bread_panic(
            "Cannot allocate memory to store the tachiyomi backup data\n");
    }

    size_t uncompressed_size = (compressed_size * 5) * sizeof(unsigned char);

    if (gzwrite(compressed_file, input_uncompressed[0], uncompressed_size) == 0)
    {
        gzclose(compressed_file);
        fclose(fp);
        __bread_panic(
            "Wasn't able to get anything from the tachiyomi backup file\n");
    }

    gzclose(compressed_file);
    fclose(fp);

    /*int res = uncompress(input_uncompressed[0], &uncompressed_size,*/
    /*compressed_data, compressed_size);*/

    /*switch (res)*/
    /*{*/
    /*case Z_OK:*/
    /*printf("OK\n");*/
    /*break;*/
    /*case Z_MEM_ERROR:*/
    /*printf("Memory ERR\n");*/
    /*break;*/
    /*case Z_BUF_ERROR:*/
    /*printf("Buffer error");*/
    /*break;*/
    /*}*/
}
