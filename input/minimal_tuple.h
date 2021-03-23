typedef struct LDKThirtyTwoBytes {
    uint8_t data[32];
} LDKThirtyTwoBytes;

typedef struct LDKC2Tuple_u64u64Z {
   uint64_t a;
   uint64_t b;
} LDKC2Tuple_u64u64Z;

struct LDKC2Tuple_u64u64Z C2Tuple_u64u64Z_clone(const struct LDKC2Tuple_u64u64Z *NONNULL_PTR orig);

void C2Tuple_u64u64Z_free(struct LDKC2Tuple_u64u64Z _res);

struct LDKC2Tuple_u64u64Z C2Tuple_u64u64Z_new(uint64_t a, uint64_t b);
