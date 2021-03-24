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

typedef struct LDKCVec_u8Z {
   uint8_t *data;
   uintptr_t datalen;
} LDKCVec_u8Z;

typedef struct LDKC2Tuple_u32ScriptZ {
   uint32_t a;
   struct LDKCVec_u8Z b;
} LDKC2Tuple_u32ScriptZ;

void CVec_u8Z_free(struct LDKCVec_u8Z _res);
