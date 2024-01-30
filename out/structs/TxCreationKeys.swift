#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// The set of public keys which are used in the creation of one commitment transaction.
/// These are derived from the channel base keys and per-commitment data.
///
/// A broadcaster key is provided from potential broadcaster of the computed transaction.
/// A countersignatory key is coming from a protocol participant unable to broadcast the
/// transaction.
///
/// These keys are assumed to be good, either because the code derived them from
/// channel basepoints via the new function, or they were obtained via
/// CommitmentTransaction.trust().keys() because we trusted the source of the
/// pre-calculated keys.
public typealias TxCreationKeys = Bindings.TxCreationKeys

extension Bindings {


	/// The set of public keys which are used in the creation of one commitment transaction.
	/// These are derived from the channel base keys and per-commitment data.
	///
	/// A broadcaster key is provided from potential broadcaster of the computed transaction.
	/// A countersignatory key is coming from a protocol participant unable to broadcast the
	/// transaction.
	///
	/// These keys are assumed to be good, either because the code derived them from
	/// channel basepoints via the new function, or they were obtained via
	/// CommitmentTransaction.trust().keys() because we trusted the source of the
	/// pre-calculated keys.
	public class TxCreationKeys: NativeTypeWrapper {

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

		internal var cType: LDKTxCreationKeys?

		internal init(cType: LDKTxCreationKeys, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKTxCreationKeys, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKTxCreationKeys, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the TxCreationKeys, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = TxCreationKeys_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The broadcaster's per-commitment public key which was used to derive the other keys.
		public func getPerCommitmentPoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKTxCreationKeys>) in
					TxCreationKeys_get_per_commitment_point(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "TxCreationKeys.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The broadcaster's per-commitment public key which was used to derive the other keys.
		public func setPerCommitmentPoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "TxCreationKeys.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKTxCreationKeys>) in
					TxCreationKeys_set_per_commitment_point(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The revocation key which is used to allow the broadcaster of the commitment
		/// transaction to provide their counterparty the ability to punish them if they broadcast
		/// an old state.
		public func getRevocationKey() -> RevocationKey {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKTxCreationKeys>) in
					TxCreationKeys_get_revocation_key(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = RevocationKey(
				cType: nativeCallResult, instantiationContext: "TxCreationKeys.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The revocation key which is used to allow the broadcaster of the commitment
		/// transaction to provide their counterparty the ability to punish them if they broadcast
		/// an old state.
		public func setRevocationKey(val: RevocationKey) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKTxCreationKeys>) in
					TxCreationKeys_set_revocation_key(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Broadcaster's HTLC Key
		public func getBroadcasterHtlcKey() -> HtlcKey {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKTxCreationKeys>) in
					TxCreationKeys_get_broadcaster_htlc_key(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = HtlcKey(
				cType: nativeCallResult, instantiationContext: "TxCreationKeys.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Broadcaster's HTLC Key
		public func setBroadcasterHtlcKey(val: HtlcKey) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKTxCreationKeys>) in
					TxCreationKeys_set_broadcaster_htlc_key(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Countersignatory's HTLC Key
		public func getCountersignatoryHtlcKey() -> HtlcKey {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKTxCreationKeys>) in
					TxCreationKeys_get_countersignatory_htlc_key(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = HtlcKey(
				cType: nativeCallResult, instantiationContext: "TxCreationKeys.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Countersignatory's HTLC Key
		public func setCountersignatoryHtlcKey(val: HtlcKey) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKTxCreationKeys>) in
					TxCreationKeys_set_countersignatory_htlc_key(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Broadcaster's Payment Key (which isn't allowed to be spent from for some delay)
		public func getBroadcasterDelayedPaymentKey() -> DelayedPaymentKey {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKTxCreationKeys>) in
					TxCreationKeys_get_broadcaster_delayed_payment_key(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = DelayedPaymentKey(
				cType: nativeCallResult, instantiationContext: "TxCreationKeys.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Broadcaster's Payment Key (which isn't allowed to be spent from for some delay)
		public func setBroadcasterDelayedPaymentKey(val: DelayedPaymentKey) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKTxCreationKeys>) in
					TxCreationKeys_set_broadcaster_delayed_payment_key(
						thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new TxCreationKeys given each field
		public init(
			perCommitmentPointArg: [UInt8], revocationKeyArg: RevocationKey, broadcasterHtlcKeyArg: HtlcKey,
			countersignatoryHtlcKeyArg: HtlcKey, broadcasterDelayedPaymentKeyArg: DelayedPaymentKey
		) {
			// native call variable prep

			let perCommitmentPointArgPrimitiveWrapper = PublicKey(
				value: perCommitmentPointArg, instantiationContext: "TxCreationKeys.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = TxCreationKeys_new(
				perCommitmentPointArgPrimitiveWrapper.cType!, revocationKeyArg.dynamicallyDangledClone().cType!,
				broadcasterHtlcKeyArg.dynamicallyDangledClone().cType!,
				countersignatoryHtlcKeyArg.dynamicallyDangledClone().cType!,
				broadcasterDelayedPaymentKeyArg.dynamicallyDangledClone().cType!)

			// cleanup

			// for elided types, we need this
			perCommitmentPointArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = TxCreationKeys(cType: nativeCallResult, instantiationContext: "TxCreationKeys.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "TxCreationKeys.swift::\(#function):\(#line)"
				)


		}

		/// Checks if two TxCreationKeyss contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: TxCreationKeys, b: TxCreationKeys) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKTxCreationKeys>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKTxCreationKeys>) in
						TxCreationKeys_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the TxCreationKeys
		internal func clone() -> TxCreationKeys {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKTxCreationKeys>) in
					TxCreationKeys_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = TxCreationKeys(
				cType: nativeCallResult, instantiationContext: "TxCreationKeys.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Serialize the TxCreationKeys object into a byte array which can be read by TxCreationKeys_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKTxCreationKeys>) in
					TxCreationKeys_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "TxCreationKeys.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a TxCreationKeys from a byte array, created by TxCreationKeys_write
		public class func read(ser: [UInt8]) -> Result_TxCreationKeysDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "TxCreationKeys.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = TxCreationKeys_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_TxCreationKeysDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "TxCreationKeys.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Create per-state keys from channel base points and the per-commitment point.
		/// Key set is asymmetric and can't be used as part of counter-signatory set of transactions.
		public class func initWithDeriveNew(
			perCommitmentPoint: [UInt8], broadcasterDelayedPaymentBase: DelayedPaymentBasepoint,
			broadcasterHtlcBase: HtlcBasepoint, countersignatoryRevocationBase: RevocationBasepoint,
			countersignatoryHtlcBase: HtlcBasepoint
		) -> TxCreationKeys {
			// native call variable prep

			let perCommitmentPointPrimitiveWrapper = PublicKey(
				value: perCommitmentPoint, instantiationContext: "TxCreationKeys.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: broadcasterDelayedPaymentBase.cType!) {
					(broadcasterDelayedPaymentBasePointer: UnsafePointer<LDKDelayedPaymentBasepoint>) in

					withUnsafePointer(to: broadcasterHtlcBase.cType!) {
						(broadcasterHtlcBasePointer: UnsafePointer<LDKHtlcBasepoint>) in

						withUnsafePointer(to: countersignatoryRevocationBase.cType!) {
							(countersignatoryRevocationBasePointer: UnsafePointer<LDKRevocationBasepoint>) in

							withUnsafePointer(to: countersignatoryHtlcBase.cType!) {
								(countersignatoryHtlcBasePointer: UnsafePointer<LDKHtlcBasepoint>) in
								TxCreationKeys_derive_new(
									perCommitmentPointPrimitiveWrapper.cType!, broadcasterDelayedPaymentBasePointer,
									broadcasterHtlcBasePointer, countersignatoryRevocationBasePointer,
									countersignatoryHtlcBasePointer)
							}

						}

					}

				}


			// cleanup

			// for elided types, we need this
			perCommitmentPointPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = TxCreationKeys(
				cType: nativeCallResult, instantiationContext: "TxCreationKeys.swift::\(#function):\(#line)")


			try! returnValue.addAnchor(anchor: broadcasterDelayedPaymentBase)
			try! returnValue.addAnchor(anchor: broadcasterHtlcBase)
			try! returnValue.addAnchor(anchor: countersignatoryRevocationBase)
			try! returnValue.addAnchor(anchor: countersignatoryHtlcBase)
			return returnValue
		}

		/// Generate per-state keys from channel static keys.
		/// Key set is asymmetric and can't be used as part of counter-signatory set of transactions.
		public class func initWithChannelStaticKeys(
			perCommitmentPoint: [UInt8], broadcasterKeys: ChannelPublicKeys, countersignatoryKeys: ChannelPublicKeys
		) -> TxCreationKeys {
			// native call variable prep

			let perCommitmentPointPrimitiveWrapper = PublicKey(
				value: perCommitmentPoint, instantiationContext: "TxCreationKeys.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: broadcasterKeys.cType!) {
					(broadcasterKeysPointer: UnsafePointer<LDKChannelPublicKeys>) in

					withUnsafePointer(to: countersignatoryKeys.cType!) {
						(countersignatoryKeysPointer: UnsafePointer<LDKChannelPublicKeys>) in
						TxCreationKeys_from_channel_static_keys(
							perCommitmentPointPrimitiveWrapper.cType!, broadcasterKeysPointer,
							countersignatoryKeysPointer)
					}

				}


			// cleanup

			// for elided types, we need this
			perCommitmentPointPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = TxCreationKeys(
				cType: nativeCallResult, instantiationContext: "TxCreationKeys.swift::\(#function):\(#line)")


			try! returnValue.addAnchor(anchor: broadcasterKeys)
			try! returnValue.addAnchor(anchor: countersignatoryKeys)
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


		internal func danglingClone() -> TxCreationKeys {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> TxCreationKeys {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> TxCreationKeys {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> TxCreationKeys {
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
						"Freeing TxCreationKeys \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing TxCreationKeys \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

