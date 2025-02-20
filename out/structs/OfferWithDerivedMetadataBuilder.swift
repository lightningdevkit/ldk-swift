#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Builds an [`Offer`] for the \"offer to be paid\" flow.
///
/// See [module-level documentation] for usage.
///
/// [module-level documentation]: self
public typealias OfferWithDerivedMetadataBuilder = Bindings.OfferWithDerivedMetadataBuilder

extension Bindings {


	/// Builds an [`Offer`] for the \"offer to be paid\" flow.
	///
	/// See [module-level documentation] for usage.
	///
	/// [module-level documentation]: self
	public class OfferWithDerivedMetadataBuilder: NativeTypeWrapper {

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

		internal var cType: LDKOfferWithDerivedMetadataBuilder?

		internal init(cType: LDKOfferWithDerivedMetadataBuilder, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKOfferWithDerivedMetadataBuilder, instantiationContext: String, anchor: NativeTypeWrapper
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
			cType: LDKOfferWithDerivedMetadataBuilder, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Frees any resources used by the OfferWithDerivedMetadataBuilder, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = OfferWithDerivedMetadataBuilder_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the OfferWithDerivedMetadataBuilder
		internal func clone() -> OfferWithDerivedMetadataBuilder {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKOfferWithDerivedMetadataBuilder>) in
					OfferWithDerivedMetadataBuilder_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = OfferWithDerivedMetadataBuilder(
				cType: nativeCallResult,
				instantiationContext: "OfferWithDerivedMetadataBuilder.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Similar to [`OfferBuilder::new`] except, if [`OfferBuilder::path`] is called, the signing
		/// pubkey is derived from the given [`ExpandedKey`] and [`Nonce`]. This provides recipient
		/// privacy by using a different signing pubkey for each offer. Otherwise, the provided
		/// `node_id` is used for [`Offer::issuer_signing_pubkey`].
		///
		/// Also, sets the metadata when [`OfferBuilder::build`] is called such that it can be used by
		/// [`InvoiceRequest::verify_using_metadata`] to determine if the request was produced for the
		/// offer given an [`ExpandedKey`]. However, if [`OfferBuilder::path`] is called, then the
		/// metadata will not be set and must be included in each [`BlindedMessagePath`] instead. In this case,
		/// use [`InvoiceRequest::verify_using_recipient_data`].
		///
		/// [`InvoiceRequest::verify_using_metadata`]: crate::offers::invoice_request::InvoiceRequest::verify_using_metadata
		/// [`InvoiceRequest::verify_using_recipient_data`]: crate::offers::invoice_request::InvoiceRequest::verify_using_recipient_data
		/// [`ExpandedKey`]: crate::ln::inbound_payment::ExpandedKey
		public class func initWithDerivingSigningPubkey(nodeId: [UInt8], expandedKey: ExpandedKey, nonce: Nonce)
			-> OfferWithDerivedMetadataBuilder
		{
			// native call variable prep

			let nodeIdPrimitiveWrapper = PublicKey(
				value: nodeId, instantiationContext: "OfferWithDerivedMetadataBuilder.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: expandedKey.cType!) { (expandedKeyPointer: UnsafePointer<LDKExpandedKey>) in
					OfferWithDerivedMetadataBuilder_deriving_signing_pubkey(
						nodeIdPrimitiveWrapper.cType!, expandedKeyPointer, nonce.dynamicallyDangledClone().cType!)
				}


			// cleanup

			// for elided types, we need this
			nodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = OfferWithDerivedMetadataBuilder(
				cType: nativeCallResult,
				instantiationContext: "OfferWithDerivedMetadataBuilder.swift::\(#function):\(#line)")


			try! returnValue.addAnchor(anchor: expandedKey)
			return returnValue
		}

		/// Adds the chain hash of the given [`Network`] to [`Offer::chains`]. If not called,
		/// the chain hash of [`Network::Bitcoin`] is assumed to be the only one supported.
		///
		/// See [`Offer::chains`] on how this relates to the payment currency.
		///
		/// Successive calls to this method will add another chain hash.
		public func chain(network: Network) {
			// native call variable prep


			// native method call
			let nativeCallResult = OfferWithDerivedMetadataBuilder_chain(
				self.dynamicallyDangledClone().cType!, network.getCValue())

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Sets the [`Offer::amount`] as an [`Amount::Bitcoin`].
		///
		/// Successive calls to this method will override the previous setting.
		public func amountMsats(amountMsats: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult = OfferWithDerivedMetadataBuilder_amount_msats(
				self.dynamicallyDangledClone().cType!, amountMsats)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Sets the [`Offer::absolute_expiry`] as seconds since the Unix epoch.
		/// Any expiry that has already passed is valid and can be checked for using [`Offer::is_expired`].
		///
		/// Successive calls to this method will override the previous setting.
		public func absoluteExpiry(absoluteExpiry: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult = OfferWithDerivedMetadataBuilder_absolute_expiry(
				self.dynamicallyDangledClone().cType!, absoluteExpiry)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Sets the [`Offer::description`].
		///
		/// Successive calls to this method will override the previous setting.
		public func description(description: String) {
			// native call variable prep

			let descriptionPrimitiveWrapper = Str(
				value: description, instantiationContext: "OfferWithDerivedMetadataBuilder.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = OfferWithDerivedMetadataBuilder_description(
				self.dynamicallyDangledClone().cType!, descriptionPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			descriptionPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Sets the [`Offer::issuer`].
		///
		/// Successive calls to this method will override the previous setting.
		public func issuer(issuer: String) {
			// native call variable prep

			let issuerPrimitiveWrapper = Str(
				value: issuer, instantiationContext: "OfferWithDerivedMetadataBuilder.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = OfferWithDerivedMetadataBuilder_issuer(
				self.dynamicallyDangledClone().cType!, issuerPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			issuerPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Adds a blinded path to [`Offer::paths`]. Must include at least one path if only connected by
		/// private channels or if [`Offer::issuer_signing_pubkey`] is not a public node id.
		///
		/// Successive calls to this method will add another blinded path. Caller is responsible for not
		/// adding duplicate paths.
		public func path(path: BlindedMessagePath) {
			// native call variable prep


			// native method call
			let nativeCallResult = OfferWithDerivedMetadataBuilder_path(
				self.dynamicallyDangledClone().cType!, path.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Sets the quantity of items for [`Offer::supported_quantity`]. If not called, defaults to
		/// [`Quantity::One`].
		///
		/// Successive calls to this method will override the previous setting.
		public func supportedQuantity(quantity: Quantity) {
			// native call variable prep


			// native method call
			let nativeCallResult = OfferWithDerivedMetadataBuilder_supported_quantity(
				self.dynamicallyDangledClone().cType!, quantity.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Builds an [`Offer`] from the builder's settings.
		public func build() -> Result_OfferBolt12SemanticErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = OfferWithDerivedMetadataBuilder_build(self.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_OfferBolt12SemanticErrorZ(
				cType: nativeCallResult,
				instantiationContext: "OfferWithDerivedMetadataBuilder.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> OfferWithDerivedMetadataBuilder {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> OfferWithDerivedMetadataBuilder {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> OfferWithDerivedMetadataBuilder {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> OfferWithDerivedMetadataBuilder {
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
						"Freeing OfferWithDerivedMetadataBuilder \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing OfferWithDerivedMetadataBuilder \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

