#ifndef SOME_PROTOBUF_PARSER
#define SOME_PROTOBUF_PARSER

#include <stdint.h>

#define PB_WIRE_MASK 7

enum __wire_types
{
    PB_VI = 0,
    PB_64 = 1,
    PB_LN = 2,
    PB_SG = 3,
    PB_EG = 4,
    PB_32 = 5,
};

void decode_unknown_protobuf(uint8_t *bytes, uint64_t bytes_size,
                             uint8_t **out_buffer);

#endif
