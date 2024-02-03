#include <inttypes.h>

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

#include "protobuf_parser.h"

#define BYTE_U32_SIZE 4
#define BYTE_U64_SIZE 8

uint32_t __bytes_to_u32(uint8_t *start)
{
    uint32_t res = 0;

#ifdef __CCROI_CHIYO_TATSU_DEBUG
    printf("\nBytes to u32 called, bytes: [");
#endif

    for (uint32_t i = 0; i < BYTE_U32_SIZE; i += 1)
    {
        res |= ((uint32_t)start[i] << (BYTE_U32_SIZE * i));

#ifdef __CCROI_CHIYO_TATSU_DEBUG
        printf("%02x, ", start[i]);
#endif
    }

#ifdef __CCROI_CHIYO_TATSU_DEBUG
    printf("]\n");
#endif

    return res;
}

uint64_t __bytes_to_u64(uint8_t *start)
{
    uint64_t res = 0;

#ifdef __CCROI_CHIYO_TATSU_DEBUG
    printf("\nBytes to u64 called, bytes: [");
#endif

    for (uint64_t i = 0; i < BYTE_U64_SIZE; i += 1)
    {
        res |= ((uint64_t)start[i] << (BYTE_U64_SIZE * i));

#ifdef __CCROI_CHIYO_TATSU_DEBUG
        printf("%02x, ", start[i]);
#endif
    }

#ifdef __CCROI_CHIYO_TATSU_DEBUG
    printf("]\n");
#endif

    return res;
}

uint64_t __decode_varint(uint8_t *start, uint64_t *out_buffer)
{
    uint64_t index = 0;
    uint64_t shift = 0;

#ifdef __CCROI_CHIYO_TATSU_DEBUG
    printf("\nVarInt decode called, bytes: [");
#endif

    do
    {
        *out_buffer |= (uint64_t)(start[index] & 0x7F) << shift;

#ifdef __CCROI_CHIYO_TATSU_DEBUG
        printf("%02x, ", start[index]);
#endif

        shift += 7;
        index += 1;
    } while (start[index - 1] & 0x80);

#ifdef __CCROI_CHIYO_TATSU_DEBUG
    printf("]\n");
#endif

    return index;
}

void decode_unknown_protobuf(uint8_t *bytes, uint64_t bytes_size,
                             PB_ProtoBuf_Struct **out_buffer)
{
    (void)out_buffer;

    for (uint64_t i = 0; i < bytes_size; i += 1)
    {
        PB_Wire_types wt     = bytes[i] & PB_WIRE_MASK;
        bool ln_flag         = false;
        uint64_t v_i         = 0;
        uint64_t u64         = 0;
        uint32_t u32         = 0;
        uint8_t field_number = bytes[i] >> 3;

        switch (wt)
        {
        case PB_VI:
        {
            i += __decode_varint(&bytes[i + 1], &v_i);
            printf("Field Number: %3" PRIu8 " VI: %20" PRIu64 " U64: %20" PRIu64
                   " U32: %20" PRIu32 " LN Flag: %s\n",
                   field_number, v_i, u64, u32, (ln_flag) ? "true " : "false");
            break;
        }
        case PB_64:
        {
            u64  = __bytes_to_u64(&bytes[i + 1]);
            i   += BYTE_U64_SIZE;
            printf("Field Number: %3" PRIu8 " VI: %20" PRIu64 " U64: %20" PRIu64
                   " U32: %20" PRIu32 " LN Flag: %s\n",
                   field_number, v_i, u64, u32, (ln_flag) ? "true " : "false");
            break;
        }
        case PB_LN:
        {
            ln_flag  = true;
            i       += __decode_varint(&bytes[i + 1], &v_i);
            printf("Field Number: %3" PRIu8 " VI: %20" PRIu64 " U64: %20" PRIu64
                   " U32: %20" PRIu32 " LN Flag: %s\n",
                   field_number, v_i, u64, u32, (ln_flag) ? "true " : "false");
            break;
        }
        case PB_SG:
        {
            printf("Field Number: %3" PRIu8 " VI: %20" PRIu64 " U64: %20" PRIu64
                   " U32: %20" PRIu32 " LN Flag: %s\n",
                   field_number, v_i, u64, u32, (ln_flag) ? "true " : "false");
            break;
        }
        case PB_EG:
        {
            printf("Field Number: %3" PRIu8 " VI: %20" PRIu64 " U64: %20" PRIu64
                   " U32: %20" PRIu32 " LN Flag: %s\n",
                   field_number, v_i, u64, u32, (ln_flag) ? "true " : "false");
            break;
        }
        case PB_32:
        {
            u32  = __bytes_to_u32(&bytes[i + 1]);
            i   += BYTE_U32_SIZE;
            printf("Field Number: %3" PRIu8 " VI: %20" PRIu64 " U64: %20" PRIu64
                   " U32: %20" PRIu32 " LN Flag: %s\n",
                   field_number, v_i, u64, u32, (ln_flag) ? "true " : "false");
            break;
        }
        }
    }
}
