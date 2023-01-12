/**
 * Represents a valid secp256k1 public key serialized in "compressed form" as a 33 byte array.
 */
typedef struct LDKPublicKey {
   /**
    * The bytes of the public key
    */
   uint8_t compressed_form[33];
} LDKPublicKey;

/**
 * A dynamically-allocated array of crate::c_types::PublicKeys of arbitrary size.
 * This corresponds to std::vector in C++
 */
typedef struct LDKCVec_PublicKeyZ {
   /**
    * The elements in the array.
    * If datalen is non-0 this must be a valid, non-NULL pointer allocated by malloc().
    */
   struct LDKPublicKey *data;
   /**
    * The number of elements pointed to by `data`.
    */
   uintptr_t datalen;
} LDKCVec_PublicKeyZ;