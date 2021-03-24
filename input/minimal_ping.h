#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

typedef struct MUST_USE_STRUCT LDKPing {
   /**
    * A pointer to the opaque Rust object.
    * Nearly everywhere, inner must be non-null, however in places where
    * the Rust equivalent takes an Option, it may be set to null to indicate None.
    */
   LDKnativePing *inner;
   /**
    * Indicates that this is the only struct which contains the same pointer.
    * Rust functions which take ownership of an object provided via an argument require
    * this to be true and invalidate the object pointed to by inner.
    */
   bool is_owned;
} LDKPing;

/**
 * Frees any resources used by the Ping, if is_owned is set and inner is non-NULL.
 */
void Ping_free(struct LDKPing this_obj);

/**
 * The desired response length
 */
uint16_t Ping_get_ponglen(const struct LDKPing *NONNULL_PTR this_ptr);

/**
 * The desired response length
 */
void Ping_set_ponglen(struct LDKPing *NONNULL_PTR this_ptr, uint16_t val);

/**
 * The ping packet size.
 * This field is not sent on the wire. byteslen zeros are sent.
 */
uint16_t Ping_get_byteslen(const struct LDKPing *NONNULL_PTR this_ptr);

/**
 * The ping packet size.
 * This field is not sent on the wire. byteslen zeros are sent.
 */
void Ping_set_byteslen(struct LDKPing *NONNULL_PTR this_ptr, uint16_t val);

/**
 * Constructs a new Ping given each field
 */
MUST_USE_RES struct LDKPing Ping_new(uint16_t ponglen_arg, uint16_t byteslen_arg);

/**
 * Creates a copy of the Ping
 */
struct LDKPing Ping_clone(const struct LDKPing *NONNULL_PTR orig);
