#include <stdbool.h>
#include <stdint.h>

#include <string.h>

#include "memtracker.h"
#include "protobuf_parser.h"

uint64_t __bytes_to_u32(uint8_t *start, uint32_t *out_buffer)
{
#ifdef ___CHIYO_TATSU_DEBUG
    printf("\nBytes to u32 called, bytes: [");
#endif

    for (uint32_t i = 0; i < BYTE_U32_SIZE; i += 1)
    {
        *out_buffer |= ((uint32_t)start[i] << (BYTE_U32_SIZE * i));

#ifdef ___CHIYO_TATSU_DEBUG
        printf("%02x, ", start[i]);
#endif
    }

#ifdef ___CHIYO_TATSU_DEBUG
    printf("]\n");
#endif

    return 0;
}

uint64_t __bytes_to_u64(uint8_t *start, uint64_t *out_buffer)
{
#ifdef ___CHIYO_TATSU_DEBUG
    printf("\nBytes to u64 called, bytes: [");
#endif

    for (uint64_t i = 0; i < BYTE_U64_SIZE; i += 1)
    {
        *out_buffer |= ((uint64_t)start[i] << (BYTE_U64_SIZE * i));

#ifdef ___CHIYO_TATSU_DEBUG
        printf("%02x, ", start[i]);
#endif
    }

#ifdef ___CHIYO_TATSU_DEBUG
    printf("]\n");
#endif

    return 0;
}

uint64_t __decode_varint(uint8_t *start, uint64_t *out_buffer)
{
    uint64_t index = 0;
    uint64_t shift = 0;

#ifdef ___CHIYO_TATSU_DEBUG
    printf("\nVarInt decode called, bytes: [");
#endif

    do
    {
        *out_buffer |= (uint64_t)(start[index] & 0x7F) << shift;

#ifdef ___CHIYO_TATSU_DEBUG
        printf("%02x, ", start[index]);
#endif

        shift += BYTE_U64_SIZE - 1;
        index += 1;
    } while (start[index - 1] & 0x80);

#ifdef ___CHIYO_TATSU_DEBUG
    printf("]\n");
#endif

    return index;
}

// This is not good yet tho
void __msb_byte_seq_2_fieldnum(uint8_t *bytes, uint64_t len,
                               uint64_t *out_buffer)
{
    uint64_t shift = BYTE_U64_SIZE - 1;
    for (uint64_t i = 0; i < len; i += 1)
    {
        // Get bytes other than msb
        uint8_t byte = bytes[i] & 0x7F;
        // Check if this is the last byte in the msb chain
        // if it is then it is 1 bit for msb, 4 bits for the last bits in
        // the field num, and the last 3 bits are for the wire type
        if ((bytes[i] & 0x80) == 0)
        {
            // Discard the lower 3 bits
            byte         = byte >> 3;
            byte         = byte << 3;
            *out_buffer |= (uint64_t)byte << (i * shift);
            break;
        }

        *out_buffer |= (uint64_t)byte << (i * shift);
        shift       += BYTE_U64_SIZE - 1;
    }

    *out_buffer = *out_buffer >> 3;
}

void set_output_buffer(PB_ProtoBuf_Struct **output_buffer, uint64_t *used,
                       uint64_t *size, uint64_t field_number)
{
    if ((*used + 1) >= *size)
    {
        PB_ProtoBuf_Struct *new_data = croi_realloc(
            *output_buffer, *size * 2 * sizeof(PB_ProtoBuf_Struct));
        if (new_data == NULL)
        {
            memtracker_panic(
                "Error in allocating memory when decoding the protobuf\n");
        }

        *size          *= 2;
        *output_buffer  = new_data;
    }

    (*output_buffer)[*used].field_number  = field_number;
    *used                                += 1;
}

void decode_unknown_protobuf(uint8_t *bytes, uint64_t bytes_size,
                             PB_ProtoBuf_Struct **out_buffer)
{
    *out_buffer                 = croi_calloc(10, sizeof(PB_ProtoBuf_Struct));
    uint64_t out_buffer_size    = 10;
    uint64_t out_buffer_used    = 0;

    bool was_msb_set            = false;
    uint64_t index_to_msb_start = 0;

    for (uint64_t i = 0; i < bytes_size; i += 1)
    {
        PB_Wire_types wt      = bytes[i] & PB_WIRE_MASK;
        uint64_t field_number = 0;
        uint64_t v_i          = 0;
        uint64_t u64          = 0;
        uint32_t u32          = 0;

        if ((bytes[i] & 0x80))
        {
            was_msb_set        = true;
            index_to_msb_start = i;
        }

        if (wt >= PB_VI && wt <= PB_32)
        {
            if (was_msb_set)
            {
                __msb_byte_seq_2_fieldnum(&bytes[index_to_msb_start],
                                          i - index_to_msb_start,
                                          &field_number);
                was_msb_set        = false;
                index_to_msb_start = 0;
            }
            else
            {
                field_number = bytes[i] >> 3;
            }
        }

        switch (wt)
        {
        case PB_VI:
        {
            i += __decode_varint(&bytes[i + 1], &v_i);
            set_output_buffer(out_buffer, &out_buffer_used, &out_buffer_size,
                              field_number);
            (*out_buffer)[out_buffer_used - 1].message   = &v_i;
            (*out_buffer)[out_buffer_used - 1].wire_type = PB_VI;
            break;
        }
        case PB_64:
        {
            (void)__bytes_to_u64(&bytes[i + 1], &u64);
            i += BYTE_U64_SIZE;
            set_output_buffer(out_buffer, &out_buffer_used, &out_buffer_size,
                              field_number);
            (*out_buffer)[out_buffer_used - 1].message   = &u64;
            (*out_buffer)[out_buffer_used - 1].wire_type = PB_64;
            break;
        }
        case PB_LN:
        {
            uint64_t len_of_LN = __decode_varint(&bytes[i + 1], &v_i);
            set_output_buffer(out_buffer, &out_buffer_used, &out_buffer_size,
                              field_number);
            (*out_buffer)[out_buffer_used - 1].wire_type = PB_LN;
            if (v_i + 1 < 16384)
            {
                (*out_buffer)[out_buffer_used - 1].message =
                    croi_calloc(v_i + 1, sizeof(uint8_t));

                if ((*out_buffer)[out_buffer_used - 1].message == NULL)
                {
                    memtracker_panic(
                        "Error in allocating memory for the message "
                        "inside the protobuf\n");
                }

                memcpy((*out_buffer)[out_buffer_used - 1].message,
                       &bytes[i + len_of_LN + 2], len_of_LN);
            }

            i += len_of_LN;
            break;
        }
        case PB_SG:
        {
            uint64_t group_len  = __decode_varint(&bytes[i + 1], &v_i);
            i                  += group_len;
            set_output_buffer(out_buffer, &out_buffer_used, &out_buffer_size,
                              field_number);
            break;
        }
        case PB_EG:
        {
            set_output_buffer(out_buffer, &out_buffer_used, &out_buffer_size,
                              field_number);
            break;
        }
        case PB_32:
        {
            (void)__bytes_to_u32(&bytes[i + 1], &u32);
            i += BYTE_U32_SIZE;
            set_output_buffer(out_buffer, &out_buffer_used, &out_buffer_size,
                              field_number);
            break;
        }
        }
    }
}
