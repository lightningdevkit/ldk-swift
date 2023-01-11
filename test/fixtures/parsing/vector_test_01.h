/**
 * A dynamically-allocated array of u8s of arbitrary size.
 * This corresponds to std::vector in C++
 */
typedef struct LDKCVec_u8Z {
   /**
    * The elements in the array.
    * If datalen is non-0 this must be a valid, non-NULL pointer allocated by malloc().
    */
   uint8_t *data;
   /**
    * The number of elements pointed to by `data`.
    */
   uintptr_t datalen;
} LDKCVec_u8Z;