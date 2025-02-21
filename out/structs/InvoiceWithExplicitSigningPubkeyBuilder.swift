#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Builds a [`Bolt12Invoice`] from either:
/// - an [`InvoiceRequest`] for the \"offer to be paid\" flow or
/// - a [`Refund`] for the \"offer for money\" flow.
///
/// See [module-level documentation] for usage.
///
/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
/// [`Refund`]: crate::offers::refund::Refund
/// [module-level documentation]: self
public typealias InvoiceWithExplicitSigningPubkeyBuilder = Bindings.InvoiceWithExplicitSigningPubkeyBuilder

extension Bindings {


	/// Builds a [`Bolt12Invoice`] from either:
	/// - an [`InvoiceRequest`] for the \"offer to be paid\" flow or
	/// - a [`Refund`] for the \"offer for money\" flow.
	///
	/// See [module-level documentation] for usage.
	///
	/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
	/// [`Refund`]: crate::offers::refund::Refund
	/// [module-level documentation]: self
	public class InvoiceWithExplicitSigningPubkeyBuilder: NativeTypeWrapper {

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

		internal var cType: LDKInvoiceWithExplicitSigningPubkeyBuilder?

		internal init(cType: LDKInvoiceWithExplicitSigningPubkeyBuilder, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKInvoiceWithExplicitSigningPubkeyBuilder, instantiationContext: String, anchor: NativeTypeWrapper
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
			cType: LDKInvoiceWithExplicitSigningPubkeyBuilder, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Frees any resources used by the InvoiceWithExplicitSigningPubkeyBuilder, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = InvoiceWithExplicitSigningPubkeyBuilder_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Builds an unsigned [`Bolt12Invoice`] after checking for valid semantics.
		@available(
			*, deprecated,
			message: "This method passes the following non-cloneable, but freeable objects by value: self."
		)
		public func build() -> Result_UnsignedBolt12InvoiceBolt12SemanticErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = InvoiceWithExplicitSigningPubkeyBuilder_build(self.dangle().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_UnsignedBolt12InvoiceBolt12SemanticErrorZ(
				cType: nativeCallResult,
				instantiationContext: "InvoiceWithExplicitSigningPubkeyBuilder.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Sets the [`Bolt12Invoice::relative_expiry`]
		/// as seconds since [`Bolt12Invoice::created_at`].
		/// Any expiry that has already passed is valid and can be checked for using
		/// [`Bolt12Invoice::is_expired`].
		///
		/// Successive calls to this method will override the previous setting.
		@available(
			*, deprecated,
			message: "This method passes the following non-cloneable, but freeable objects by value: self."
		)
		public func relativeExpiry(relativeExpirySecs: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult = InvoiceWithExplicitSigningPubkeyBuilder_relative_expiry(
				self.dangle().cType!, relativeExpirySecs)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Adds a P2WSH address to [`Bolt12Invoice::fallbacks`].
		///
		/// Successive calls to this method will add another address. Caller is responsible for not
		/// adding duplicate addresses and only calling if capable of receiving to P2WSH addresses.
		@available(
			*, deprecated,
			message: "This method passes the following non-cloneable, but freeable objects by value: self."
		)
		public func fallbackV0P2wsh(scriptHash: [UInt8]) {
			// native call variable prep

			let tupledScriptHash = Bindings.arrayToUInt8Tuple32(array: scriptHash)


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: tupledScriptHash) { (tupledScriptHashPointer: UnsafePointer<UInt8Tuple32>) in
					InvoiceWithExplicitSigningPubkeyBuilder_fallback_v0_p2wsh(
						self.dangle().cType!, tupledScriptHashPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Adds a P2WPKH address to [`Bolt12Invoice::fallbacks`].
		///
		/// Successive calls to this method will add another address. Caller is responsible for not
		/// adding duplicate addresses and only calling if capable of receiving to P2WPKH addresses.
		@available(
			*, deprecated,
			message: "This method passes the following non-cloneable, but freeable objects by value: self."
		)
		public func fallbackV0P2wpkh(pubkeyHash: [UInt8]) {
			// native call variable prep

			let tupledPubkeyHash = Bindings.arrayToUInt8Tuple20(array: pubkeyHash)


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: tupledPubkeyHash) { (tupledPubkeyHashPointer: UnsafePointer<UInt8Tuple20>) in
					InvoiceWithExplicitSigningPubkeyBuilder_fallback_v0_p2wpkh(
						self.dangle().cType!, tupledPubkeyHashPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Adds a P2TR address to [`Bolt12Invoice::fallbacks`].
		///
		/// Successive calls to this method will add another address. Caller is responsible for not
		/// adding duplicate addresses and only calling if capable of receiving to P2TR addresses.
		@available(
			*, deprecated,
			message: "This method passes the following non-cloneable, but freeable objects by value: self."
		)
		public func fallbackV1P2trTweaked(outputKey: [UInt8]) {
			// native call variable prep

			let outputKeyPrimitiveWrapper = TweakedPublicKey(
				value: outputKey,
				instantiationContext: "InvoiceWithExplicitSigningPubkeyBuilder.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = InvoiceWithExplicitSigningPubkeyBuilder_fallback_v1_p2tr_tweaked(
				self.dangle().cType!, outputKeyPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			outputKeyPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Sets [`Bolt12Invoice::invoice_features`]
		/// to indicate MPP may be used. Otherwise, MPP is disallowed.
		@available(
			*, deprecated,
			message: "This method passes the following non-cloneable, but freeable objects by value: self."
		)
		public func allowMpp() {
			// native call variable prep


			// native method call
			let nativeCallResult = InvoiceWithExplicitSigningPubkeyBuilder_allow_mpp(self.dangle().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


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


		internal func setCFreeability(freeable: Bool) -> InvoiceWithExplicitSigningPubkeyBuilder {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> InvoiceWithExplicitSigningPubkeyBuilder {
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
						"Freeing InvoiceWithExplicitSigningPubkeyBuilder \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing InvoiceWithExplicitSigningPubkeyBuilder \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

