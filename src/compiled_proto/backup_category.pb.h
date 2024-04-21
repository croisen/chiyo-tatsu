// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: backup_category.proto
// Protobuf C++ Version: 4.25.3

#ifndef GOOGLE_PROTOBUF_INCLUDED_backup_5fcategory_2eproto_2epb_2eh
#define GOOGLE_PROTOBUF_INCLUDED_backup_5fcategory_2eproto_2epb_2eh

#include <limits>
#include <string>
#include <type_traits>
#include <utility>

#include "google/protobuf/port_def.inc"
#if PROTOBUF_VERSION < 4025000
#error "This file was generated by a newer version of protoc which is"
#error "incompatible with your Protocol Buffer headers. Please update"
#error "your headers."
#endif  // PROTOBUF_VERSION

#if 4025003 < PROTOBUF_MIN_PROTOC_VERSION
#error "This file was generated by an older version of protoc which is"
#error "incompatible with your Protocol Buffer headers. Please"
#error "regenerate this file with a newer version of protoc."
#endif  // PROTOBUF_MIN_PROTOC_VERSION
#include "google/protobuf/port_undef.inc"
#include "google/protobuf/io/coded_stream.h"
#include "google/protobuf/arena.h"
#include "google/protobuf/arenastring.h"
#include "google/protobuf/generated_message_tctable_decl.h"
#include "google/protobuf/generated_message_util.h"
#include "google/protobuf/metadata_lite.h"
#include "google/protobuf/generated_message_reflection.h"
#include "google/protobuf/message.h"
#include "google/protobuf/repeated_field.h"  // IWYU pragma: export
#include "google/protobuf/extension_set.h"  // IWYU pragma: export
#include "google/protobuf/unknown_field_set.h"
// @@protoc_insertion_point(includes)

// Must be included last.
#include "google/protobuf/port_def.inc"

#define PROTOBUF_INTERNAL_EXPORT_backup_5fcategory_2eproto

namespace google {
namespace protobuf {
namespace internal {
class AnyMetadata;
}  // namespace internal
}  // namespace protobuf
}  // namespace google

// Internal implementation detail -- do not use these members.
struct TableStruct_backup_5fcategory_2eproto {
  static const ::uint32_t offsets[];
};
extern const ::google::protobuf::internal::DescriptorTable
    descriptor_table_backup_5fcategory_2eproto;
class BackupCategory;
struct BackupCategoryDefaultTypeInternal;
extern BackupCategoryDefaultTypeInternal _BackupCategory_default_instance_;
namespace google {
namespace protobuf {
}  // namespace protobuf
}  // namespace google


// ===================================================================


// -------------------------------------------------------------------

class BackupCategory final :
    public ::google::protobuf::Message /* @@protoc_insertion_point(class_definition:BackupCategory) */ {
 public:
  inline BackupCategory() : BackupCategory(nullptr) {}
  ~BackupCategory() override;
  template<typename = void>
  explicit PROTOBUF_CONSTEXPR BackupCategory(::google::protobuf::internal::ConstantInitialized);

  inline BackupCategory(const BackupCategory& from)
      : BackupCategory(nullptr, from) {}
  BackupCategory(BackupCategory&& from) noexcept
    : BackupCategory() {
    *this = ::std::move(from);
  }

  inline BackupCategory& operator=(const BackupCategory& from) {
    CopyFrom(from);
    return *this;
  }
  inline BackupCategory& operator=(BackupCategory&& from) noexcept {
    if (this == &from) return *this;
    if (GetArena() == from.GetArena()
  #ifdef PROTOBUF_FORCE_COPY_IN_MOVE
        && GetArena() != nullptr
  #endif  // !PROTOBUF_FORCE_COPY_IN_MOVE
    ) {
      InternalSwap(&from);
    } else {
      CopyFrom(from);
    }
    return *this;
  }

  inline const ::google::protobuf::UnknownFieldSet& unknown_fields() const
      ABSL_ATTRIBUTE_LIFETIME_BOUND {
    return _internal_metadata_.unknown_fields<::google::protobuf::UnknownFieldSet>(::google::protobuf::UnknownFieldSet::default_instance);
  }
  inline ::google::protobuf::UnknownFieldSet* mutable_unknown_fields()
      ABSL_ATTRIBUTE_LIFETIME_BOUND {
    return _internal_metadata_.mutable_unknown_fields<::google::protobuf::UnknownFieldSet>();
  }

  static const ::google::protobuf::Descriptor* descriptor() {
    return GetDescriptor();
  }
  static const ::google::protobuf::Descriptor* GetDescriptor() {
    return default_instance().GetMetadata().descriptor;
  }
  static const ::google::protobuf::Reflection* GetReflection() {
    return default_instance().GetMetadata().reflection;
  }
  static const BackupCategory& default_instance() {
    return *internal_default_instance();
  }
  static inline const BackupCategory* internal_default_instance() {
    return reinterpret_cast<const BackupCategory*>(
               &_BackupCategory_default_instance_);
  }
  static constexpr int kIndexInFileMessages =
    0;

  friend void swap(BackupCategory& a, BackupCategory& b) {
    a.Swap(&b);
  }
  inline void Swap(BackupCategory* other) {
    if (other == this) return;
  #ifdef PROTOBUF_FORCE_COPY_IN_SWAP
    if (GetArena() != nullptr &&
        GetArena() == other->GetArena()) {
   #else  // PROTOBUF_FORCE_COPY_IN_SWAP
    if (GetArena() == other->GetArena()) {
  #endif  // !PROTOBUF_FORCE_COPY_IN_SWAP
      InternalSwap(other);
    } else {
      ::google::protobuf::internal::GenericSwap(this, other);
    }
  }
  void UnsafeArenaSwap(BackupCategory* other) {
    if (other == this) return;
    ABSL_DCHECK(GetArena() == other->GetArena());
    InternalSwap(other);
  }

  // implements Message ----------------------------------------------

  BackupCategory* New(::google::protobuf::Arena* arena = nullptr) const final {
    return CreateMaybeMessage<BackupCategory>(arena);
  }
  using ::google::protobuf::Message::CopyFrom;
  void CopyFrom(const BackupCategory& from);
  using ::google::protobuf::Message::MergeFrom;
  void MergeFrom( const BackupCategory& from) {
    BackupCategory::MergeImpl(*this, from);
  }
  private:
  static void MergeImpl(::google::protobuf::Message& to_msg, const ::google::protobuf::Message& from_msg);
  public:
  PROTOBUF_ATTRIBUTE_REINITIALIZES void Clear() final;
  bool IsInitialized() const final;

  ::size_t ByteSizeLong() const final;
  const char* _InternalParse(const char* ptr, ::google::protobuf::internal::ParseContext* ctx) final;
  ::uint8_t* _InternalSerialize(
      ::uint8_t* target, ::google::protobuf::io::EpsCopyOutputStream* stream) const final;
  int GetCachedSize() const { return _impl_._cached_size_.Get(); }

  private:
  ::google::protobuf::internal::CachedSize* AccessCachedSize() const final;
  void SharedCtor(::google::protobuf::Arena* arena);
  void SharedDtor();
  void InternalSwap(BackupCategory* other);

  private:
  friend class ::google::protobuf::internal::AnyMetadata;
  static ::absl::string_view FullMessageName() {
    return "BackupCategory";
  }
  protected:
  explicit BackupCategory(::google::protobuf::Arena* arena);
  BackupCategory(::google::protobuf::Arena* arena, const BackupCategory& from);
  public:

  static const ClassData _class_data_;
  const ::google::protobuf::Message::ClassData*GetClassData() const final;

  ::google::protobuf::Metadata GetMetadata() const final;

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  enum : int {
    kNameFieldNumber = 1,
    kOrderFieldNumber = 2,
    kUpdateIntervalFieldNumber = 3,
    kFlagsFieldNumber = 100,
  };
  // string name = 1;
  void clear_name() ;
  const std::string& name() const;
  template <typename Arg_ = const std::string&, typename... Args_>
  void set_name(Arg_&& arg, Args_... args);
  std::string* mutable_name();
  PROTOBUF_NODISCARD std::string* release_name();
  void set_allocated_name(std::string* value);

  private:
  const std::string& _internal_name() const;
  inline PROTOBUF_ALWAYS_INLINE void _internal_set_name(
      const std::string& value);
  std::string* _internal_mutable_name();

  public:
  // int32 order = 2;
  void clear_order() ;
  ::int32_t order() const;
  void set_order(::int32_t value);

  private:
  ::int32_t _internal_order() const;
  void _internal_set_order(::int32_t value);

  public:
  // optional int32 updateInterval = 3;
  bool has_updateinterval() const;
  void clear_updateinterval() ;
  ::int32_t updateinterval() const;
  void set_updateinterval(::int32_t value);

  private:
  ::int32_t _internal_updateinterval() const;
  void _internal_set_updateinterval(::int32_t value);

  public:
  // int32 flags = 100;
  void clear_flags() ;
  ::int32_t flags() const;
  void set_flags(::int32_t value);

  private:
  ::int32_t _internal_flags() const;
  void _internal_set_flags(::int32_t value);

  public:
  // @@protoc_insertion_point(class_scope:BackupCategory)
 private:
  class _Internal;

  friend class ::google::protobuf::internal::TcParser;
  static const ::google::protobuf::internal::TcParseTable<
      2, 4, 0,
      27, 7>
      _table_;
  friend class ::google::protobuf::MessageLite;
  friend class ::google::protobuf::Arena;
  template <typename T>
  friend class ::google::protobuf::Arena::InternalHelper;
  using InternalArenaConstructable_ = void;
  using DestructorSkippable_ = void;
  struct Impl_ {

        inline explicit constexpr Impl_(
            ::google::protobuf::internal::ConstantInitialized) noexcept;
        inline explicit Impl_(::google::protobuf::internal::InternalVisibility visibility,
                              ::google::protobuf::Arena* arena);
        inline explicit Impl_(::google::protobuf::internal::InternalVisibility visibility,
                              ::google::protobuf::Arena* arena, const Impl_& from);
    ::google::protobuf::internal::HasBits<1> _has_bits_;
    mutable ::google::protobuf::internal::CachedSize _cached_size_;
    ::google::protobuf::internal::ArenaStringPtr name_;
    ::int32_t order_;
    ::int32_t updateinterval_;
    ::int32_t flags_;
    PROTOBUF_TSAN_DECLARE_MEMBER
  };
  union { Impl_ _impl_; };
  friend struct ::TableStruct_backup_5fcategory_2eproto;
};

// ===================================================================




// ===================================================================


#ifdef __GNUC__
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wstrict-aliasing"
#endif  // __GNUC__
// -------------------------------------------------------------------

// BackupCategory

// string name = 1;
inline void BackupCategory::clear_name() {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  _impl_.name_.ClearToEmpty();
}
inline const std::string& BackupCategory::name() const
    ABSL_ATTRIBUTE_LIFETIME_BOUND {
  // @@protoc_insertion_point(field_get:BackupCategory.name)
  return _internal_name();
}
template <typename Arg_, typename... Args_>
inline PROTOBUF_ALWAYS_INLINE void BackupCategory::set_name(Arg_&& arg,
                                                     Args_... args) {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  ;
  _impl_.name_.Set(static_cast<Arg_&&>(arg), args..., GetArena());
  // @@protoc_insertion_point(field_set:BackupCategory.name)
}
inline std::string* BackupCategory::mutable_name() ABSL_ATTRIBUTE_LIFETIME_BOUND {
  std::string* _s = _internal_mutable_name();
  // @@protoc_insertion_point(field_mutable:BackupCategory.name)
  return _s;
}
inline const std::string& BackupCategory::_internal_name() const {
  PROTOBUF_TSAN_READ(&_impl_._tsan_detect_race);
  return _impl_.name_.Get();
}
inline void BackupCategory::_internal_set_name(const std::string& value) {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  ;
  _impl_.name_.Set(value, GetArena());
}
inline std::string* BackupCategory::_internal_mutable_name() {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  ;
  return _impl_.name_.Mutable( GetArena());
}
inline std::string* BackupCategory::release_name() {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  // @@protoc_insertion_point(field_release:BackupCategory.name)
  return _impl_.name_.Release();
}
inline void BackupCategory::set_allocated_name(std::string* value) {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  _impl_.name_.SetAllocated(value, GetArena());
  #ifdef PROTOBUF_FORCE_COPY_DEFAULT_STRING
        if (_impl_.name_.IsDefault()) {
          _impl_.name_.Set("", GetArena());
        }
  #endif  // PROTOBUF_FORCE_COPY_DEFAULT_STRING
  // @@protoc_insertion_point(field_set_allocated:BackupCategory.name)
}

// int32 order = 2;
inline void BackupCategory::clear_order() {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  _impl_.order_ = 0;
}
inline ::int32_t BackupCategory::order() const {
  // @@protoc_insertion_point(field_get:BackupCategory.order)
  return _internal_order();
}
inline void BackupCategory::set_order(::int32_t value) {
  _internal_set_order(value);
  // @@protoc_insertion_point(field_set:BackupCategory.order)
}
inline ::int32_t BackupCategory::_internal_order() const {
  PROTOBUF_TSAN_READ(&_impl_._tsan_detect_race);
  return _impl_.order_;
}
inline void BackupCategory::_internal_set_order(::int32_t value) {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  ;
  _impl_.order_ = value;
}

// optional int32 updateInterval = 3;
inline bool BackupCategory::has_updateinterval() const {
  bool value = (_impl_._has_bits_[0] & 0x00000001u) != 0;
  return value;
}
inline void BackupCategory::clear_updateinterval() {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  _impl_.updateinterval_ = 0;
  _impl_._has_bits_[0] &= ~0x00000001u;
}
inline ::int32_t BackupCategory::updateinterval() const {
  // @@protoc_insertion_point(field_get:BackupCategory.updateInterval)
  return _internal_updateinterval();
}
inline void BackupCategory::set_updateinterval(::int32_t value) {
  _internal_set_updateinterval(value);
  // @@protoc_insertion_point(field_set:BackupCategory.updateInterval)
}
inline ::int32_t BackupCategory::_internal_updateinterval() const {
  PROTOBUF_TSAN_READ(&_impl_._tsan_detect_race);
  return _impl_.updateinterval_;
}
inline void BackupCategory::_internal_set_updateinterval(::int32_t value) {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  _impl_._has_bits_[0] |= 0x00000001u;
  _impl_.updateinterval_ = value;
}

// int32 flags = 100;
inline void BackupCategory::clear_flags() {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  _impl_.flags_ = 0;
}
inline ::int32_t BackupCategory::flags() const {
  // @@protoc_insertion_point(field_get:BackupCategory.flags)
  return _internal_flags();
}
inline void BackupCategory::set_flags(::int32_t value) {
  _internal_set_flags(value);
  // @@protoc_insertion_point(field_set:BackupCategory.flags)
}
inline ::int32_t BackupCategory::_internal_flags() const {
  PROTOBUF_TSAN_READ(&_impl_._tsan_detect_race);
  return _impl_.flags_;
}
inline void BackupCategory::_internal_set_flags(::int32_t value) {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  ;
  _impl_.flags_ = value;
}

#ifdef __GNUC__
#pragma GCC diagnostic pop
#endif  // __GNUC__

// @@protoc_insertion_point(namespace_scope)


// @@protoc_insertion_point(global_scope)

#include "google/protobuf/port_undef.inc"

#endif  // GOOGLE_PROTOBUF_INCLUDED_backup_5fcategory_2eproto_2epb_2eh
