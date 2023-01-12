/**
 * A Record, unit of logging output with Metadata to enable filtering
 * Module_path, file, line to inform on log's source
 */
typedef struct MUST_USE_STRUCT LDKRecord {
   /**
    * A pointer to the opaque Rust object.
    * Nearly everywhere, inner must be non-null, however in places where
    * the Rust equivalent takes an Option, it may be set to null to indicate None.
    */
   LDKnativeRecord *inner;
   /**
    * Indicates that this is the only struct which contains the same pointer.
    * Rust functions which take ownership of an object provided via an argument require
    * this to be true and invalidate the object pointed to by inner.
    */
   bool is_owned;
} LDKRecord;

/**
 * A trait encapsulating the operations required of a logger
 */
typedef struct LDKLogger {
   /**
    * An opaque pointer which is passed to your function implementations as an argument.
    * This has no meaning in the LDK, and can be NULL or any other value.
    */
   void *this_arg;
   /**
    * Logs the `Record`
    */
   void (*log)(const void *this_arg, const struct LDKRecord *NONNULL_PTR record);
   /**
    * Frees any resources associated with this object given its this_arg pointer.
    * Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
    */
   void (*free)(void *this_arg);
} LDKLogger;