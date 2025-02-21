#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A stateful resolver which maps BIP 353 Human Readable Names to URIs and BOLT12 [`Offer`]s.
///
/// It does not directly implement [`DNSResolverMessageHandler`] but implements all the core logic
/// which is required in a client which intends to.
///
/// It relies on being made aware of the passage of time with regular calls to
/// [`Self::new_best_block`] in order to time out existing queries. Queries time out after two
/// blocks.
public typealias OMNameResolver = Bindings.OMNameResolver

extension Bindings {


	/// A stateful resolver which maps BIP 353 Human Readable Names to URIs and BOLT12 [`Offer`]s.
	///
	/// It does not directly implement [`DNSResolverMessageHandler`] but implements all the core logic
	/// which is required in a client which intends to.
	///
	/// It relies on being made aware of the passage of time with regular calls to
	/// [`Self::new_best_block`] in order to time out existing queries. Queries time out after two
	/// blocks.
	public class OMNameResolver: NativeTypeWrapper {

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

		internal var cType: LDKOMNameResolver?

		internal init(cType: LDKOMNameResolver, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKOMNameResolver, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKOMNameResolver, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the OMNameResolver, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = OMNameResolver_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Builds a new [`OMNameResolver`].
		public init(latestBlockTime: UInt32, latestBlockHeight: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult = OMNameResolver_new(latestBlockTime, latestBlockHeight)

			// cleanup

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = OMNameResolver(cType: nativeCallResult, instantiationContext: "OMNameResolver.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "OMNameResolver.swift::\(#function):\(#line)"
				)


		}

		/// Informs the [`OMNameResolver`] of the passage of time in the form of a new best Bitcoin
		/// block.
		///
		/// This will call back to resolve some pending queries which have timed out.
		public func newBestBlock(height: UInt32, time: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOMNameResolver>) in
					OMNameResolver_new_best_block(thisArgPointer, height, time)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Begins the process of resolving a BIP 353 Human Readable Name.
		///
		/// Returns a [`DNSSECQuery`] onion message and a [`DNSResolverContext`] which should be sent
		/// to a resolver (with the context used to generate the blinded response path) on success.
		public func resolveName(paymentId: [UInt8], name: HumanReadableName, entropySource: EntropySource)
			-> Result_C2Tuple_DNSSECQueryDNSResolverContextZNoneZ
		{
			// native call variable prep

			let paymentIdPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentId, instantiationContext: "OMNameResolver.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOMNameResolver>) in

					withUnsafePointer(to: entropySource.activate().cType!) {
						(entropySourcePointer: UnsafePointer<LDKEntropySource>) in
						OMNameResolver_resolve_name(
							thisArgPointer, paymentIdPrimitiveWrapper.cType!, name.dynamicallyDangledClone().cType!,
							entropySourcePointer)
					}

				}


			// cleanup

			// for elided types, we need this
			paymentIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_C2Tuple_DNSSECQueryDNSResolverContextZNoneZ(
				cType: nativeCallResult, instantiationContext: "OMNameResolver.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Handles a [`DNSSECProof`] message, attempting to verify it and match it against a pending
		/// query.
		///
		/// If verification succeeds, the resulting bitcoin: URI is parsed to find a contained
		/// [`Offer`].
		///
		/// Note that a single proof for a wildcard DNS entry may complete several requests for
		/// different [`HumanReadableName`]s.
		///
		/// If an [`Offer`] is found, it, as well as the [`PaymentId`] and original `name` passed to
		/// [`Self::resolve_name`] are returned.
		public func handleDnssecProofForOffer(msg: DNSSECProof, context: DNSResolverContext) -> (
			[(HumanReadableName, [UInt8])], Offer
		)? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOMNameResolver>) in
					OMNameResolver_handle_dnssec_proof_for_offer(
						thisArgPointer, msg.dynamicallyDangledClone().cType!, context.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_C2Tuple_CVec_C2Tuple_HumanReadableNameThirtyTwoBytesZZOfferZZ(
				cType: nativeCallResult, instantiationContext: "OMNameResolver.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// Handles a [`DNSSECProof`] message, attempting to verify it and match it against any pending
		/// queries.
		///
		/// If verification succeeds, all matching [`PaymentId`] and [`HumanReadableName`]s passed to
		/// [`Self::resolve_name`], as well as the resolved bitcoin: URI are returned.
		///
		/// Note that a single proof for a wildcard DNS entry may complete several requests for
		/// different [`HumanReadableName`]s.
		///
		/// This method is useful for those who handle bitcoin: URIs already, handling more than just
		/// BOLT12 [`Offer`]s.
		public func handleDnssecProofForUri(msg: DNSSECProof, context: DNSResolverContext) -> (
			[(HumanReadableName, [UInt8])], String
		)? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOMNameResolver>) in
					OMNameResolver_handle_dnssec_proof_for_uri(
						thisArgPointer, msg.dynamicallyDangledClone().cType!, context.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_C2Tuple_CVec_C2Tuple_HumanReadableNameThirtyTwoBytesZZStrZZ(
				cType: nativeCallResult, instantiationContext: "OMNameResolver.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


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


		internal func setCFreeability(freeable: Bool) -> OMNameResolver {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> OMNameResolver {
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
						"Freeing OMNameResolver \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing OMNameResolver \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

