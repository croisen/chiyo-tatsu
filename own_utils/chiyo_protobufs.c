#include <inttypes.h>

#include <stdbool.h>
#include <stdint.h>

#include "chiyotatsu_protobufs.h"

bool is_little_endian()
{
    uint16_t test = 0x4269;
    return (*(uint8_t *)&test == 0x69) ? true : false;
}

uint64_t decode_var_int(const uint8_t *bytes, size_t length)
{
    uint64_t res   = 0;
    uint64_t shift = 0;

    for (uint64_t i = 0; i < length; i += 1)
    {
        res   |= (uint64_t)(bytes[i] & 0x7F) << shift;
        shift += 7;

        if ((bytes[i] & 0x80) == 0)
        {
            break;
        }
    }

    return res;
}
