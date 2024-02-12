#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A derived key built from a [`DelayedPaymentBasepoint`] and `per_commitment_point`.
///
/// The delayed payment key is used to pay the commitment state broadcaster their
/// non-HTLC-encumbered funds after a delay. This delay gives their counterparty a chance to
/// punish and claim all the channel funds if the state broadcasted was previously revoked.
///
/// [See the BOLT specs]
/// (https://github.com/lightning/bolts/blob/master/03-transactions.md#localpubkey-local_htlcpubkey-remote_htlcpubkey-local_delayedpubkey-and-remote_delayedpubkey-derivation)
/// for more information on key derivation details.
public typealias DelayedPaymentKey = Bindings.DelayedPaymentKey

extension Bindings {


	/// A derived key built from a [`DelayedPaymentBasepoint`] and `per_commitment_point`.
	///
	/// The delayed payment key is used to pay the commitment state broadcaster their
	/// non-HTLC-encumbered funds after a delay. This delay gives their counterparty a chance to
	/// punish and claim all the channel funds if the state broadcasted was previously revoked.
	///
	/// [See the BOLT specs]
	/// (https://github.com/lightning/bolts/blob/master/03-transactions.md#localpubkey-local_htlcpubkey-remote_htlcpubkey-local_delayedpubkey-and-remote_delayedpubkey-derivation)
	/// for more information on key derivation details.
	public class DelayedPaymentKey: NativeTypeWrapper {

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

		internal var cType: LDKDelayedPaymentKey?

		internal init(cType: LDKDelayedPaymentKey, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKDelayedPaymentKey, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKDelayedPaymentKey, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the DelayedPaymentKey, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = DelayedPaymentKey_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		///
		public func getA() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKDelayedPaymentKey>) in
					DelayedPaymentKey_get_a(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "DelayedPaymentKey.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		///
		public func setA(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "DelayedPaymentKey.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKDelayedPaymentKey>) in
					DelayedPaymentKey_set_a(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new DelayedPaymentKey given each field
		public class func initWith(aArg: [UInt8]) -> DelayedPaymentKey {
			// native call variable prep

			let aArgPrimitiveWrapper = PublicKey(
				value: aArg, instantiationContext: "DelayedPaymentKey.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = DelayedPaymentKey_new(aArgPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			aArgPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = DelayedPaymentKey(
				cType: nativeCallResult, instantiationContext: "DelayedPaymentKey.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two DelayedPaymentKeys contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: DelayedPaymentKey, b: DelayedPaymentKey) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKDelayedPaymentKey>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKDelayedPaymentKey>) in
						DelayedPaymentKey_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the DelayedPaymentKey
		internal func clone() -> DelayedPaymentKey {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKDelayedPaymentKey>) in
					DelayedPaymentKey_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = DelayedPaymentKey(
				cType: nativeCallResult, instantiationContext: "DelayedPaymentKey.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Derive a public delayedpubkey using one node\'s `per_commitment_point` and its countersignatory\'s `basepoint`
		public class func initWithBasepoint(
			countersignatoryBasepoint: DelayedPaymentBasepoint, perCommitmentPoint: [UInt8]
		) -> DelayedPaymentKey {
			// native call variable prep

			let perCommitmentPointPrimitiveWrapper = PublicKey(
				value: perCommitmentPoint, instantiationContext: "DelayedPaymentKey.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: countersignatoryBasepoint.cType!) {
					(countersignatoryBasepointPointer: UnsafePointer<LDKDelayedPaymentBasepoint>) in
					DelayedPaymentKey_from_basepoint(
						countersignatoryBasepointPointer, perCommitmentPointPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			perCommitmentPointPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = DelayedPaymentKey(
				cType: nativeCallResult, instantiationContext: "DelayedPaymentKey.swift::\(#function):\(#line)")


			try! returnValue.addAnchor(anchor: countersignatoryBasepoint)
			return returnValue
		}

		/// Build a delayedpubkey directly from an already-derived private key
		public class func initWithSecretKey(sk: [UInt8]) -> DelayedPaymentKey {
			// native call variable prep

			let tupledSk = Bindings.arrayToUInt8Tuple32(array: sk)


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: tupledSk) { (tupledSkPointer: UnsafePointer<UInt8Tuple32>) in
					DelayedPaymentKey_from_secret_key(tupledSkPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = DelayedPaymentKey(
				cType: nativeCallResult, instantiationContext: "DelayedPaymentKey.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Get inner Public Key
		public func toPublicKey() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKDelayedPaymentKey>) in
					DelayedPaymentKey_to_public_key(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "DelayedPaymentKey.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Serialize the DelayedPaymentKey object into a byte array which can be read by DelayedPaymentKey_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKDelayedPaymentKey>) in
					DelayedPaymentKey_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "DelayedPaymentKey.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a DelayedPaymentKey from a byte array, created by DelayedPaymentKey_write
		public class func read(ser: [UInt8]) -> Result_DelayedPaymentKeyDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "DelayedPaymentKey.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = DelayedPaymentKey_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_DelayedPaymentKeyDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "DelayedPaymentKey.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> DelayedPaymentKey {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> DelayedPaymentKey {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> DelayedPaymentKey {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> DelayedPaymentKey {
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
						"Freeing DelayedPaymentKey \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing DelayedPaymentKey \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

