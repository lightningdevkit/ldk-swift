/**
 * A Rust str object, ie a reference to a UTF8-valid string.
 * This is *not* null-terminated so cannot be used directly as a C string!
 */
typedef struct LDKStr {
   /**
    * A pointer to the string's bytes, in UTF8 encoding
    */
   const uint8_t *chars;
   /**
    * The number of bytes (not characters!) pointed to by `chars`
    */
   uintptr_t len;
   /**
    * Whether the data pointed to by `chars` should be freed or not.
    */
   bool chars_is_owned;
} LDKStr;

/**
 * Represents a scalar value between zero and the secp256k1 curve order, in big endian.
 */
typedef struct LDKBigEndianScalar {
   /**
    * The bytes of the scalar value.
    */
   uint8_t big_endian_bytes[32];
} LDKBigEndianScalar;

/**
 * Arbitrary 32 bytes, which could represent one of a few different things. You probably want to
 * look up the corresponding function in rust-lightning's docs.
 */
typedef struct LDKThirtyTwoBytes {
   /**
    * The thirty-two bytes
    */
   uint8_t data[32];
} LDKThirtyTwoBytes;

/**
 * Integer in the range `0..32`
 */
typedef struct LDKu5 {
   uint8_t _0;
} LDKu5;

/**
 * A serialized transaction, in (pointer, length) form.
 *
 * This type optionally owns its own memory, and thus the semantics around access change based on
 * the `data_is_owned` flag. If `data_is_owned` is set, you must call `Transaction_free` to free
 * the underlying buffer before the object goes out of scope. If `data_is_owned` is not set, any
 * access to the buffer after the scope in which the object was provided to you is invalid. eg,
 * access after you return from the call in which a `!data_is_owned` `Transaction` is provided to
 * you would be invalid.
 *
 * Note that, while it may change in the future, because transactions on the Rust side are stored
 * in a deserialized form, all `Transaction`s generated on the Rust side will have `data_is_owned`
 * set. Similarly, while it may change in the future, all `Transaction`s you pass to Rust may have
 * `data_is_owned` either set or unset at your discretion.
 */
typedef struct LDKTransaction {
   /**
    * The serialized transaction data.
    *
    * This is non-const for your convenience, an object passed to Rust is never written to.
    */
   uint8_t *data;
   /**
    * The length of the serialized transaction
    */
   uintptr_t datalen;
   /**
    * Whether the data pointed to by `data` should be freed or not.
    */
   bool data_is_owned;
} LDKTransaction;

/**
 * A "slice" referencing some byte array. This is simply a length-tagged pointer which does not
 * own the memory pointed to by data.
 */
typedef struct LDKu8slice {
   /**
    * A pointer to the byte buffer
    */
   const uint8_t *data;
   /**
    * The number of bytes pointed to by `data`.
    */
   uintptr_t datalen;
} LDKu8slice;

/**
 * Represents a secp256k1 signature serialized as two 32-byte numbers
 */
typedef struct LDKSignature {
   /**
    * The bytes of the signature in "compact" form
    */
   uint8_t compact_form[64];
} LDKSignature;

/**
 * Represents a valid secp256k1 secret key serialized as a 32 byte array.
 */
typedef struct LDKSecretKey {
   /**
    * The bytes of the secret key
    */
   uint8_t bytes[32];
} LDKSecretKey;

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
 * A 20-byte byte array.
 */
typedef struct LDKTwentyBytes {
   /**
    * The twenty bytes
    */
   uint8_t data[20];
} LDKTwentyBytes;

/**
 * Represents a secp256k1 signature serialized as two 32-byte numbers as well as a tag which
 * allows recovering the exact public key which created the signature given the message.
 */
typedef struct LDKRecoverableSignature {
   /**
    * The bytes of the signature in "compact" form plus a "Recovery ID" which allows for
    * recovery.
    */
   uint8_t serialized_form[68];
} LDKRecoverableSignature;

/**
 * Represents a scalar value between zero and the secp256k1 curve order, in big endian.
 */
typedef struct LDKBigEndianScalar {
   /**
    * The bytes of the scalar value.
    */
   uint8_t big_endian_bytes[32];
} LDKBigEndianScalar;

typedef struct LDKHTLCDestination_LDKUnknownNextHop_Body {
   /**
    * Short channel id we are requesting to forward an HTLC to.
    */
   uint64_t requested_forward_scid;
} LDKHTLCDestination_LDKUnknownNextHop_Body;

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

/**
 * Sub-errors which don't have specific information in them use this type.
 */
typedef struct LDKError {
   /**
    * Zero-Sized_types aren't consistent across Rust/C/C++, so we add some size here
    */
   uint8_t _dummy;
} LDKError;

/**
 * Integer in the range `0..=16`
 */
typedef struct LDKWitnessVersion {
   uint8_t _0;
} LDKWitnessVersion;
