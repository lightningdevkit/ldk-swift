//typedef struct LDKThirtyTwoBytes {
//    uint8_t data[32];
//} LDKThirtyTwoBytes;
//
//typedef struct LDKC2Tuple_u64u64Z {
//   uint64_t a;
//   uint64_t b;
//} LDKC2Tuple_u64u64Z;
//
//struct LDKC2Tuple_u64u64Z C2Tuple_u64u64Z_clone(const struct LDKC2Tuple_u64u64Z *NONNULL_PTR orig);
//
//void C2Tuple_u64u64Z_free(struct LDKC2Tuple_u64u64Z _res);
//
//struct LDKC2Tuple_u64u64Z C2Tuple_u64u64Z_new(uint64_t a, uint64_t b);

typedef struct LDKThirtyTwoBytes {
   uint8_t data[32];
} LDKThirtyTwoBytes;

typedef struct MUST_USE_STRUCT LDKChannelMonitor {
   /**
    * A pointer to the opaque Rust object.
    * Nearly everywhere, inner must be non-null, however in places where
    * the Rust equivalent takes an Option, it may be set to null to indicate None.
    */
   LDKnativeChannelMonitor *inner;
   /**
    * Indicates that this is the only struct which contains the same pointer.
    * Rust functions which take ownership of an object provided via an argument require
    * this to be true and invalidate the object pointed to by inner.
    */
   bool is_owned;
} LDKChannelMonitor;

typedef struct LDKCVec_u8Z {
   uint8_t *data;
   uintptr_t datalen;
} LDKCVec_u8Z;

typedef struct LDKC2Tuple_u32ScriptZ {
   uint32_t a;
   struct LDKCVec_u8Z b;
} LDKC2Tuple_u32ScriptZ;

typedef struct LDKCVec_C2Tuple_u32ScriptZZ {
   struct LDKC2Tuple_u32ScriptZ *data;
   uintptr_t datalen;
} LDKCVec_C2Tuple_u32ScriptZZ;

typedef struct LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ {
   struct LDKThirtyTwoBytes a;
   struct LDKCVec_C2Tuple_u32ScriptZZ b;
} LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ;

typedef struct LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ {
   struct LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ *data;
   uintptr_t datalen;
} LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ;

void CVec_u8Z_free(struct LDKCVec_u8Z _res);

struct LDKC2Tuple_u32ScriptZ C2Tuple_u32ScriptZ_clone(const struct LDKC2Tuple_u32ScriptZ *NONNULL_PTR orig);

struct LDKC2Tuple_u32ScriptZ C2Tuple_u32ScriptZ_new(uint32_t a, struct LDKCVec_u8Z b);

void C2Tuple_u32ScriptZ_free(struct LDKC2Tuple_u32ScriptZ _res);

MUST_USE_RES struct LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ ChannelMonitor_get_outputs_to_watch(const struct LDKChannelMonitor *NONNULL_PTR this_arg);
