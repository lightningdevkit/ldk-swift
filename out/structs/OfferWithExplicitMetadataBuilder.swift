#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Builds an [`Offer`] for the \"offer to be paid\" flow.
///
/// See [module-level documentation] for usage.
///
/// [module-level documentation]: self
public typealias OfferWithExplicitMetadataBuilder = Bindings.OfferWithExplicitMetadataBuilder

extension Bindings {


	/// Builds an [`Offer`] for the \"offer to be paid\" flow.
	///
	/// See [module-level documentation] for usage.
	///
	/// [module-level documentation]: self
	public class OfferWithExplicitMetadataBuilder: NativeTypeWrapper {

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

		internal var cType: LDKOfferWithExplicitMetadataBuilder?

		internal init(cType: LDKOfferWithExplicitMetadataBuilder, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKOfferWithExplicitMetadataBuilder, instantiationContext: String, anchor: NativeTypeWrapper
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
			cType: LDKOfferWithExplicitMetadataBuilder, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Frees any resources used by the OfferWithExplicitMetadataBuilder, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = OfferWithExplicitMetadataBuilder_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the OfferWithExplicitMetadataBuilder
		internal func clone() -> OfferWithExplicitMetadataBuilder {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(origPointer: UnsafePointer<LDKOfferWithExplicitMetadataBuilder>) in
					OfferWithExplicitMetadataBuilder_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = OfferWithExplicitMetadataBuilder(
				cType: nativeCallResult,
				instantiationContext: "OfferWithExplicitMetadataBuilder.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new builder for an offer using the `signing_pubkey` for signing invoices. The
		/// associated secret key must be remembered while the offer is valid.
		///
		/// Use a different pubkey per offer to avoid correlating offers.
		///
		/// # Note
		///
		/// If constructing an [`Offer`] for use with a [`ChannelManager`], use
		/// [`ChannelManager::create_offer_builder`] instead of [`OfferBuilder::new`].
		///
		/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
		/// [`ChannelManager::create_offer_builder`]: crate::ln::channelmanager::ChannelManager::create_offer_builder
		public init(signingPubkey: [UInt8]) {
			// native call variable prep

			let signingPubkeyPrimitiveWrapper = PublicKey(
				value: signingPubkey,
				instantiationContext: "OfferWithExplicitMetadataBuilder.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = OfferWithExplicitMetadataBuilder_new(signingPubkeyPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			signingPubkeyPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = OfferWithExplicitMetadataBuilder(cType: nativeCallResult, instantiationContext: "OfferWithExplicitMetadataBuilder.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "OfferWithExplicitMetadataBuilder.swift::\(#function):\(#line)")


		}

		/// Sets the [`Offer::metadata`] to the given bytes.
		///
		/// Successive calls to this method will override the previous setting.
		public func metadata(metadata: [UInt8]) -> Result_NoneBolt12SemanticErrorZ {
			// native call variable prep

			let metadataVector = Vec_u8Z(
				array: metadata, instantiationContext: "OfferWithExplicitMetadataBuilder.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = OfferWithExplicitMetadataBuilder_metadata(
				self.dynamicallyDangledClone().cType!, metadataVector.cType!)

			// cleanup

			// metadataVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneBolt12SemanticErrorZ(
				cType: nativeCallResult,
				instantiationContext: "OfferWithExplicitMetadataBuilder.swift::\(#function):\(#line)")


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
			let nativeCallResult = OfferWithExplicitMetadataBuilder_chain(
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
			let nativeCallResult = OfferWithExplicitMetadataBuilder_amount_msats(
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
			let nativeCallResult = OfferWithExplicitMetadataBuilder_absolute_expiry(
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
				value: description,
				instantiationContext: "OfferWithExplicitMetadataBuilder.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = OfferWithExplicitMetadataBuilder_description(
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
				value: issuer, instantiationContext: "OfferWithExplicitMetadataBuilder.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = OfferWithExplicitMetadataBuilder_issuer(
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
			let nativeCallResult = OfferWithExplicitMetadataBuilder_path(
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
			let nativeCallResult = OfferWithExplicitMetadataBuilder_supported_quantity(
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
			let nativeCallResult = OfferWithExplicitMetadataBuilder_build(self.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_OfferBolt12SemanticErrorZ(
				cType: nativeCallResult,
				instantiationContext: "OfferWithExplicitMetadataBuilder.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> OfferWithExplicitMetadataBuilder {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> OfferWithExplicitMetadataBuilder {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> OfferWithExplicitMetadataBuilder {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> OfferWithExplicitMetadataBuilder {
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
						"Freeing OfferWithExplicitMetadataBuilder \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing OfferWithExplicitMetadataBuilder \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

