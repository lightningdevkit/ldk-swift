/**
 * Onion messages can be sent and received to blinded routes, which serve to hide the identity of
 * the recipient.
 */
typedef struct MUST_USE_STRUCT LDKBlindedRoute {
   /**
    * A pointer to the opaque Rust object.
    * Nearly everywhere, inner must be non-null, however in places where
    * the Rust equivalent takes an Option, it may be set to null to indicate None.
    */
   LDKnativeBlindedRoute *inner;
   /**
    * Indicates that this is the only struct which contains the same pointer.
    * Rust functions which take ownership of an object provided via an argument require
    * this to be true and invalidate the object pointed to by inner.
    */
   bool is_owned;
} LDKBlindedRoute;

/**
 * The contents of CResult_BlindedRouteNoneZ
 */
typedef union LDKCResult_BlindedRouteNoneZPtr {
   /**
    * A pointer to the contents in the success state.
    * Reading from this pointer when `result_ok` is not set is undefined.
    */
   struct LDKBlindedRoute *result;
   /**
    * Note that this value is always NULL, as there are no contents in the Err variant
    */
   void *err;
} LDKCResult_BlindedRouteNoneZPtr;

/**
 * A CResult_BlindedRouteNoneZ represents the result of a fallible operation,
 * containing a crate::lightning::onion_message::blinded_route::BlindedRoute on success and a () on failure.
 * `result_ok` indicates the overall state, and the contents are provided via `contents`.
 */
typedef struct LDKCResult_BlindedRouteNoneZ {
   /**
    * The contents of this CResult_BlindedRouteNoneZ, accessible via either
    * `err` or `result` depending on the state of `result_ok`.
    */
   union LDKCResult_BlindedRouteNoneZPtr contents;
   /**
    * Whether this CResult_BlindedRouteNoneZ represents a success state.
    */
   bool result_ok;
} LDKCResult_BlindedRouteNoneZ;