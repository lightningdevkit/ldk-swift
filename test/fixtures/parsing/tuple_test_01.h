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
 * A tuple of 2 elements. See the individual fields for the types contained.
 */
typedef struct LDKC2Tuple_usizeTransactionZ {
   /**
    * The element at position 0
    */
   uintptr_t a;
   /**
    * The element at position 1
    */
   struct LDKTransaction b;
} LDKC2Tuple_usizeTransactionZ;