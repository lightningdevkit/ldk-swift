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
 * Some information provided on receipt of payment depends on whether the payment received is a
 * spontaneous payment or a \"conventional\" lightning payment that's paying an invoice.
 */
typedef enum LDKPaymentPurpose_Tag {
   /**
    * Information for receiving a payment that we generated an invoice for.
    */
   LDKPaymentPurpose_InvoicePayment,
   /**
    * Because this is a spontaneous payment, the payer generated their own preimage rather than us
    * (the payee) providing a preimage.
    */
   LDKPaymentPurpose_SpontaneousPayment,
   /**
    * Must be last for serialization purposes
    */
   LDKPaymentPurpose_Sentinel,
} LDKPaymentPurpose_Tag;

typedef struct LDKPaymentPurpose_LDKInvoicePayment_Body {
   /**
    * The preimage to the payment_hash, if the payment hash (and secret) were fetched via
    * [`ChannelManager::create_inbound_payment`]. If provided, this can be handed directly to
    * [`ChannelManager::claim_funds`].
    *
    * [`ChannelManager::create_inbound_payment`]: crate::ln::channelmanager::ChannelManager::create_inbound_payment
    * [`ChannelManager::claim_funds`]: crate::ln::channelmanager::ChannelManager::claim_funds
    *
    * Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
    */
   struct LDKThirtyTwoBytes payment_preimage;
   /**
    * The \"payment secret\". This authenticates the sender to the recipient, preventing a
    * number of deanonymization attacks during the routing process.
    * It is provided here for your reference, however its accuracy is enforced directly by
    * [`ChannelManager`] using the values you previously provided to
    * [`ChannelManager::create_inbound_payment`] or
    * [`ChannelManager::create_inbound_payment_for_hash`].
    *
    * [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
    * [`ChannelManager::create_inbound_payment`]: crate::ln::channelmanager::ChannelManager::create_inbound_payment
    * [`ChannelManager::create_inbound_payment_for_hash`]: crate::ln::channelmanager::ChannelManager::create_inbound_payment_for_hash
    */
   struct LDKThirtyTwoBytes payment_secret;
} LDKPaymentPurpose_LDKInvoicePayment_Body;

typedef struct MUST_USE_STRUCT LDKPaymentPurpose {
   LDKPaymentPurpose_Tag tag;
   union {
      LDKPaymentPurpose_LDKInvoicePayment_Body invoice_payment;
      struct {
         struct LDKThirtyTwoBytes spontaneous_payment;
      };
   };
} LDKPaymentPurpose;