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

struct __some_pb
{
    char *message_name;
    uint64_t field_number;
    enum __wire_types wire_type;
    void *message;
    struct __some_pb *repeated_pb;
};

typedef enum __wire_types PB_Wire_types;
typedef struct __some_pb PB_ProtoBuf_Struct;

void decode_unknown_protobuf(uint8_t *bytes, uint64_t bytes_size,
                             PB_ProtoBuf_Struct **out_buffer);

#endif
