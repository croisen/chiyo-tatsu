#ifndef CROI_APP_CHIYO_TATSU_PROTOBUFS
#define CROI_APP_CHIYO_TATSU_PROTOBUFS

#include <stdint.h>
#include <stdlib.h>

struct __varint_ret
{
    uint64_t byte_count;
    uint64_t decoded;
};

enum __wire_types
{
    CHIYO_VARINT,
    CHIYO_I64,
    CHIYO_LEN,
    CHIYO_SGROUP,
    CHIYO_EGROUP,
    CHIYO_I32,
};

typedef struct __varint_ret VarInt_Ret;
typedef enum __wire_types Chiyo_Wire_Types;

uint64_t reverse_bytes(uint64_t value);
uint64_t bytes_to_uint64(const unsigned char *input);
VarInt_Ret decode_var_int(const uint8_t *bytes, uint64_t length);

#endif
