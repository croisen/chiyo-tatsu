#include <protobuf-c/protobuf-c.h>

#include "bread_parser.h"
#include "tachiyomi.pb-c.h"
#include "tachiyomi_parse.h"

void *__modified_bread_malloc(void *ctx, uint64_t size)
{
    (void)ctx;
    return __bread_malloc(size);
}

void __modified_bread_free(void *ctx, void *ptr)
{
    (void)ctx;
    __bread_free(ptr);
}

ProtobufCAllocator __bread_alloc = {
    .alloc          = __modified_bread_malloc,
    .free           = __modified_bread_free,
    .allocator_data = NULL,
};

BackupManga *deserialize_protobuf(uint8_t *input_uncompressed, uint64_t size)
{
    return backup_manga__unpack(&__bread_alloc, size, input_uncompressed);
}
