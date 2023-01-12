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
 * The contents of CResult_NoneNoneZ
 */
typedef union LDKCResult_NoneNoneZPtr {
   /**
    * Note that this value is always NULL, as there are no contents in the OK variant
    */
   void *result;
   /**
    * Note that this value is always NULL, as there are no contents in the Err variant
    */
   void *err;
} LDKCResult_NoneNoneZPtr;

/**
 * A CResult_NoneNoneZ represents the result of a fallible operation,
 * containing a () on success and a () on failure.
 * `result_ok` indicates the overall state, and the contents are provided via `contents`.
 */
typedef struct LDKCResult_NoneNoneZ {
   /**
    * The contents of this CResult_NoneNoneZ, accessible via either
    * `err` or `result` depending on the state of `result_ok`.
    */
   union LDKCResult_NoneNoneZPtr contents;
   /**
    * Whether this CResult_NoneNoneZ represents a success state.
    */
   bool result_ok;
} LDKCResult_NoneNoneZ;

/**
 * A trait to sign lightning channel transactions as described in BOLT 3.
 */
typedef struct LDKBaseSign {
   struct LDKPublicKey (*lambda_name_foo)(const void *this_arg, const uint8_t (*argument_name_bar)[32], uint64_t idx);
   void (*set_pubkeys)(const struct LDKBaseSign*NONNULL_PTR );


   void *this_arg;

   struct LDKPublicKey (*get_per_commitment_point)(const void *this_arg, uint64_t idx);

   struct LDKCResult_NoneNoneZ (*validate_holder_commitment)(const void *this_arg, const struct LDKPublicKey *NONNULL_PTR holder_tx, struct LDKPublicKey preimages);

   struct LDKPublicKey pubkeys;



   struct LDKPublicKey (*channel_keys_id)(const void *this_arg);



   void (*free)(void *this_arg);
} LDKBaseSign;