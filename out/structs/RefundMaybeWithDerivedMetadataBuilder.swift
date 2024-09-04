#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Builds a [`Refund`] for the \"offer for money\" flow.
///
/// See [module-level documentation] for usage.
///
/// [module-level documentation]: self
public typealias RefundMaybeWithDerivedMetadataBuilder = Bindings.RefundMaybeWithDerivedMetadataBuilder

extension Bindings {


	/// Builds a [`Refund`] for the \"offer for money\" flow.
	///
	/// See [module-level documentation] for usage.
	///
	/// [module-level documentation]: self
	public class RefundMaybeWithDerivedMetadataBuilder: NativeTypeWrapper {

		let initialCFreeability: Bool


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKRefundMaybeWithDerivedMetadataBuilder?

		internal init(cType: LDKRefundMaybeWithDerivedMetadataBuilder, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKRefundMaybeWithDerivedMetadataBuilder, instantiationContext: String, anchor: NativeTypeWrapper
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKRefundMaybeWithDerivedMetadataBuilder, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the RefundMaybeWithDerivedMetadataBuilder, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = RefundMaybeWithDerivedMetadataBuilder_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the RefundMaybeWithDerivedMetadataBuilder
		internal func clone() -> RefundMaybeWithDerivedMetadataBuilder {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(origPointer: UnsafePointer<LDKRefundMaybeWithDerivedMetadataBuilder>) in
					RefundMaybeWithDerivedMetadataBuilder_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = RefundMaybeWithDerivedMetadataBuilder(
				cType: nativeCallResult,
				instantiationContext: "RefundMaybeWithDerivedMetadataBuilder.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new builder for a refund using the [`Refund::payer_id`] for the public node id to
		/// send to if no [`Refund::paths`] are set. Otherwise, it may be a transient pubkey.
		///
		/// Additionally, sets the required (empty) [`Refund::description`], [`Refund::payer_metadata`],
		/// and [`Refund::amount_msats`].
		///
		/// # Note
		///
		/// If constructing a [`Refund`] for use with a [`ChannelManager`], use
		/// [`ChannelManager::create_refund_builder`] instead of [`RefundBuilder::new`].
		///
		/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
		/// [`ChannelManager::create_refund_builder`]: crate::ln::channelmanager::ChannelManager::create_refund_builder
		public class func new(metadata: [UInt8], payerId: [UInt8], amountMsats: UInt64)
			-> Result_RefundMaybeWithDerivedMetadataBuilderBolt12SemanticErrorZ
		{
			// native call variable prep

			let metadataVector = Vec_u8Z(
				array: metadata,
				instantiationContext: "RefundMaybeWithDerivedMetadataBuilder.swift::\(#function):\(#line)"
			)
			.dangle()

			let payerIdPrimitiveWrapper = PublicKey(
				value: payerId,
				instantiationContext: "RefundMaybeWithDerivedMetadataBuilder.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = RefundMaybeWithDerivedMetadataBuilder_new(
				metadataVector.cType!, payerIdPrimitiveWrapper.cType!, amountMsats)

			// cleanup

			// metadataVector.noOpRetain()

			// for elided types, we need this
			payerIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_RefundMaybeWithDerivedMetadataBuilderBolt12SemanticErrorZ(
				cType: nativeCallResult,
				instantiationContext: "RefundMaybeWithDerivedMetadataBuilder.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Similar to [`RefundBuilder::new`] except, if [`RefundBuilder::path`] is called, the payer id
		/// is derived from the given [`ExpandedKey`] and nonce. This provides sender privacy by using a
		/// different payer id for each refund, assuming a different nonce is used.  Otherwise, the
		/// provided `node_id` is used for the payer id.
		///
		/// Also, sets the metadata when [`RefundBuilder::build`] is called such that it can be used by
		/// [`Bolt12Invoice::verify_using_metadata`] to determine if the invoice was produced for the
		/// refund given an [`ExpandedKey`]. However, if [`RefundBuilder::path`] is called, then the
		/// metadata must be included in each [`BlindedMessagePath`] instead. In this case, use
		/// [`Bolt12Invoice::verify_using_payer_data`].
		///
		/// The `payment_id` is encrypted in the metadata and should be unique. This ensures that only
		/// one invoice will be paid for the refund and that payments can be uniquely identified.
		///
		/// [`Bolt12Invoice::verify_using_metadata`]: crate::offers::invoice::Bolt12Invoice::verify_using_metadata
		/// [`Bolt12Invoice::verify_using_payer_data`]: crate::offers::invoice::Bolt12Invoice::verify_using_payer_data
		/// [`ExpandedKey`]: crate::ln::inbound_payment::ExpandedKey
		public class func derivingPayerId(
			nodeId: [UInt8], expandedKey: ExpandedKey, nonce: Nonce, amountMsats: UInt64, paymentId: [UInt8]
		) -> Result_RefundMaybeWithDerivedMetadataBuilderBolt12SemanticErrorZ {
			// native call variable prep

			let nodeIdPrimitiveWrapper = PublicKey(
				value: nodeId,
				instantiationContext: "RefundMaybeWithDerivedMetadataBuilder.swift::\(#function):\(#line)")

			let paymentIdPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentId,
				instantiationContext: "RefundMaybeWithDerivedMetadataBuilder.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: expandedKey.cType!) { (expandedKeyPointer: UnsafePointer<LDKExpandedKey>) in
					RefundMaybeWithDerivedMetadataBuilder_deriving_payer_id(
						nodeIdPrimitiveWrapper.cType!, expandedKeyPointer, nonce.dynamicallyDangledClone().cType!,
						amountMsats, paymentIdPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			nodeIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			paymentIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_RefundMaybeWithDerivedMetadataBuilderBolt12SemanticErrorZ(
				cType: nativeCallResult,
				instantiationContext: "RefundMaybeWithDerivedMetadataBuilder.swift::\(#function):\(#line)")


			try! returnValue.addAnchor(anchor: expandedKey)
			return returnValue
		}

		/// Sets the [`Refund::description`].
		///
		/// Successive calls to this method will override the previous setting.
		public func description(description: String) {
			// native call variable prep

			let descriptionPrimitiveWrapper = Str(
				value: description,
				instantiationContext: "RefundMaybeWithDerivedMetadataBuilder.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = RefundMaybeWithDerivedMetadataBuilder_description(
				self.dynamicallyDangledClone().cType!, descriptionPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			descriptionPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Sets the [`Refund::absolute_expiry`] as seconds since the Unix epoch. Any expiry that has
		/// already passed is valid and can be checked for using [`Refund::is_expired`].
		///
		/// Successive calls to this method will override the previous setting.
		public func absoluteExpiry(absoluteExpiry: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult = RefundMaybeWithDerivedMetadataBuilder_absolute_expiry(
				self.dynamicallyDangledClone().cType!, absoluteExpiry)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Sets the [`Refund::issuer`].
		///
		/// Successive calls to this method will override the previous setting.
		public func issuer(issuer: String) {
			// native call variable prep

			let issuerPrimitiveWrapper = Str(
				value: issuer,
				instantiationContext: "RefundMaybeWithDerivedMetadataBuilder.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = RefundMaybeWithDerivedMetadataBuilder_issuer(
				self.dynamicallyDangledClone().cType!, issuerPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			issuerPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Adds a blinded path to [`Refund::paths`]. Must include at least one path if only connected
		/// by private channels or if [`Refund::payer_id`] is not a public node id.
		///
		/// Successive calls to this method will add another blinded path. Caller is responsible for not
		/// adding duplicate paths.
		public func path(path: BlindedMessagePath) {
			// native call variable prep


			// native method call
			let nativeCallResult = RefundMaybeWithDerivedMetadataBuilder_path(
				self.dynamicallyDangledClone().cType!, path.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Sets the [`Refund::chain`] of the given [`Network`] for paying an invoice. If not
		/// called, [`Network::Bitcoin`] is assumed.
		///
		/// Successive calls to this method will override the previous setting.
		public func chain(network: Network) {
			// native call variable prep


			// native method call
			let nativeCallResult = RefundMaybeWithDerivedMetadataBuilder_chain(
				self.dynamicallyDangledClone().cType!, network.getCValue())

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Sets [`Refund::quantity`] of items. This is purely for informational purposes. It is useful
		/// when the refund pertains to a [`Bolt12Invoice`] that paid for more than one item from an
		/// [`Offer`] as specified by [`InvoiceRequest::quantity`].
		///
		/// Successive calls to this method will override the previous setting.
		///
		/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
		/// [`InvoiceRequest::quantity`]: crate::offers::invoice_request::InvoiceRequest::quantity
		/// [`Offer`]: crate::offers::offer::Offer
		public func quantity(quantity: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult = RefundMaybeWithDerivedMetadataBuilder_quantity(
				self.dynamicallyDangledClone().cType!, quantity)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Sets the [`Refund::payer_note`].
		///
		/// Successive calls to this method will override the previous setting.
		public func payerNote(payerNote: String) {
			// native call variable prep

			let payerNotePrimitiveWrapper = Str(
				value: payerNote,
				instantiationContext: "RefundMaybeWithDerivedMetadataBuilder.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = RefundMaybeWithDerivedMetadataBuilder_payer_note(
				self.dynamicallyDangledClone().cType!, payerNotePrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			payerNotePrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Builds a [`Refund`] after checking for valid semantics.
		public func build() -> Result_RefundBolt12SemanticErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = RefundMaybeWithDerivedMetadataBuilder_build(self.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_RefundBolt12SemanticErrorZ(
				cType: nativeCallResult,
				instantiationContext: "RefundMaybeWithDerivedMetadataBuilder.swift::\(#function):\(#line)")


			return returnValue
		}


		/// Indicates that this is the only struct which contains the same pointer.
		/// Rust functions which take ownership of an object provided via an argument require
		/// this to be true and invalidate the object pointed to by inner.
		public func isOwned() -> Bool {
			// return value (do some wrapping)
			let returnValue = self.cType!.is_owned

			return returnValue
		}


		internal func danglingClone() -> RefundMaybeWithDerivedMetadataBuilder {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> RefundMaybeWithDerivedMetadataBuilder {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> RefundMaybeWithDerivedMetadataBuilder {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> RefundMaybeWithDerivedMetadataBuilder {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing RefundMaybeWithDerivedMetadataBuilder \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing RefundMaybeWithDerivedMetadataBuilder \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

