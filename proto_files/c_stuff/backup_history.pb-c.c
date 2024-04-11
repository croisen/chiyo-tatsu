/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: backup_history.proto */

/* Do not generate deprecated warnings for self */
#ifndef PROTOBUF_C__NO_DEPRECATED
#define PROTOBUF_C__NO_DEPRECATED
#endif

#include "backup_history.pb-c.h"
void   broken_backup_history__init
                     (BrokenBackupHistory         *message)
{
  static const BrokenBackupHistory init_value = BROKEN_BACKUP_HISTORY__INIT;
  *message = init_value;
}
size_t broken_backup_history__get_packed_size
                     (const BrokenBackupHistory *message)
{
  assert(message->base.descriptor == &broken_backup_history__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t broken_backup_history__pack
                     (const BrokenBackupHistory *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &broken_backup_history__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t broken_backup_history__pack_to_buffer
                     (const BrokenBackupHistory *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &broken_backup_history__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
BrokenBackupHistory *
       broken_backup_history__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (BrokenBackupHistory *)
     protobuf_c_message_unpack (&broken_backup_history__descriptor,
                                allocator, len, data);
}
void   broken_backup_history__free_unpacked
                     (BrokenBackupHistory *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &broken_backup_history__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
void   backup_history__init
                     (BackupHistory         *message)
{
  static const BackupHistory init_value = BACKUP_HISTORY__INIT;
  *message = init_value;
}
size_t backup_history__get_packed_size
                     (const BackupHistory *message)
{
  assert(message->base.descriptor == &backup_history__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t backup_history__pack
                     (const BackupHistory *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &backup_history__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t backup_history__pack_to_buffer
                     (const BackupHistory *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &backup_history__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
BackupHistory *
       backup_history__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (BackupHistory *)
     protobuf_c_message_unpack (&backup_history__descriptor,
                                allocator, len, data);
}
void   backup_history__free_unpacked
                     (BackupHistory *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &backup_history__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
static const ProtobufCFieldDescriptor broken_backup_history__field_descriptors[3] =
{
  {
    "url",
    1,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(BrokenBackupHistory, url),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "lastRead",
    2,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_INT64,
    0,   /* quantifier_offset */
    offsetof(BrokenBackupHistory, lastread),
    NULL,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "readDuration",
    3,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_INT64,
    0,   /* quantifier_offset */
    offsetof(BrokenBackupHistory, readduration),
    NULL,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned broken_backup_history__field_indices_by_name[] = {
  1,   /* field[1] = lastRead */
  2,   /* field[2] = readDuration */
  0,   /* field[0] = url */
};
static const ProtobufCIntRange broken_backup_history__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 3 }
};
const ProtobufCMessageDescriptor broken_backup_history__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "BrokenBackupHistory",
  "BrokenBackupHistory",
  "BrokenBackupHistory",
  "",
  sizeof(BrokenBackupHistory),
  3,
  broken_backup_history__field_descriptors,
  broken_backup_history__field_indices_by_name,
  1,  broken_backup_history__number_ranges,
  (ProtobufCMessageInit) broken_backup_history__init,
  NULL,NULL,NULL    /* reserved[123] */
};
static const ProtobufCFieldDescriptor backup_history__field_descriptors[3] =
{
  {
    "url",
    1,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(BackupHistory, url),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "lastRead",
    2,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_INT64,
    0,   /* quantifier_offset */
    offsetof(BackupHistory, lastread),
    NULL,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "readDuration",
    3,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_INT64,
    0,   /* quantifier_offset */
    offsetof(BackupHistory, readduration),
    NULL,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned backup_history__field_indices_by_name[] = {
  1,   /* field[1] = lastRead */
  2,   /* field[2] = readDuration */
  0,   /* field[0] = url */
};
static const ProtobufCIntRange backup_history__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 3 }
};
const ProtobufCMessageDescriptor backup_history__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "BackupHistory",
  "BackupHistory",
  "BackupHistory",
  "",
  sizeof(BackupHistory),
  3,
  backup_history__field_descriptors,
  backup_history__field_indices_by_name,
  1,  backup_history__number_ranges,
  (ProtobufCMessageInit) backup_history__init,
  NULL,NULL,NULL    /* reserved[123] */
};