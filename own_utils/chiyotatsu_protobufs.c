#include <inttypes.h>

#include <stdbool.h>
#include <stdint.h>

#include "chiyotatsu_protobufs.h"

bool is_little_endian()
{
    uint16_t test = 0x4269;
    return (*(uint8_t *)&test == 0x69) ? true : false;
}

uint64_t reverse_bytes(uint64_t value)
{
    return ((value & 0xFF00000000000000UL) >> 56) |
           ((value & 0x00FF000000000000UL) >> 40) |
           ((value & 0x0000FF0000000000UL) >> 24) |
           ((value & 0x000000FF00000000UL) >> 8) |
           ((value & 0x00000000FF000000UL) << 8) |
           ((value & 0x0000000000FF0000UL) << 24) |
           ((value & 0x000000000000FF00UL) << 40) |
           ((value & 0x00000000000000FFUL) << 56);
}

uint64_t bytes_to_uint64(const unsigned char *input)
{
    uint64_t res = 0;
    for (uint64_t i = 0; i < 8; i += 1)
    {
        res |= ((uint64_t)input[i] << (8 * i));
    }

    return res;
}

VarInt_Ret decode_var_int(const unsigned char *bytes, uint64_t length)
{
    VarInt_Ret res = {0};
    uint64_t shift = 0;

    for (uint64_t i = 0; i < length; i += 1)
    {
        (&res)->decoded    |= (uint64_t)(bytes[i] & 0x7F) << shift;
        (&res)->byte_count += 1;
        shift              += 7;

        if ((bytes[i] & 0x80) == 0)
        {
            break;
        }
    }

    return res;
}
