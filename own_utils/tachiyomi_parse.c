#include <inttypes.h>

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "bread_parser.h"
#include "chiyotatsu_protobufs.h"
#include "tachiyomi_parse.h"

void tachiyomi_data_parse(unsigned char *input_data, T_Book_List *books,
                          uint64_t len)
{
    (void)books;
    int64_t iters = 0;
    for (uint64_t i = 0; i < len; i += 1)
    {
        uint64_t book_len = 0;
        if (input_data[i] == 0x0A)
        {
            VarInt_Ret length = decode_var_int(&input_data[i + 1], len);
            book_len          = (&length)->decoded;

            uint64_t id =
                bytes_to_uint64(&input_data[i + (&length)->byte_count]);
            uint64_t rev = reverse_bytes(id);
            printf("Index: %" PRIu64 " Length: %" PRIu64 " ID: %" PRIu64
                   " Reversed: %" PRIu64 "\n",
                   i, book_len, id, rev);
        }

        i     += book_len;
        iters += 1;

        if (iters > 100)
        {
            break;
        }
    }
}

void tachiyomi_books_print(T_Book_List *books)
{
    (void)books;
}
