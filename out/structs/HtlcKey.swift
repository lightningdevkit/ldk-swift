#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A derived key built from a [`HtlcBasepoint`] and `per_commitment_point`.
///
/// HTLC keys are used to ensure only the recipient of an HTLC can claim it on-chain with the HTLC
/// preimage and that only the sender of an HTLC can claim it on-chain after it has timed out.
/// Thus, both channel counterparties' HTLC keys will appears in each HTLC output's script.
///
/// [See the BOLT specs]
/// (https://github.com/lightning/bolts/blob/master/03-transactions.md#localpubkey-local_htlcpubkey-remote_htlcpubkey-local_delayedpubkey-and-remote_delayedpubkey-derivation)
/// for more information on key derivation details.
public typealias HtlcKey = Bindings.HtlcKey

extension Bindings {


	/// A derived key built from a [`HtlcBasepoint`] and `per_commitment_point`.
	///
	/// HTLC keys are used to ensure only the recipient of an HTLC can claim it on-chain with the HTLC
	/// preimage and that only the sender of an HTLC can claim it on-chain after it has timed out.
	/// Thus, both channel counterparties' HTLC keys will appears in each HTLC output's script.
	///
	/// [See the BOLT specs]
	/// (https://github.com/lightning/bolts/blob/master/03-transactions.md#localpubkey-local_htlcpubkey-remote_htlcpubkey-local_delayedpubkey-and-remote_delayedpubkey-derivation)
	/// for more information on key derivation details.
	public class HtlcKey: NativeTypeWrapper {

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

		internal var cType: LDKHtlcKey?

		internal init(cType: LDKHtlcKey, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKHtlcKey, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(cType: LDKHtlcKey, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false)
		{
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the HtlcKey, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = HtlcKey_free(self.cType!)

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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKHtlcKey>) in
					HtlcKey_get_a(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "HtlcKey.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		///
		public func setA(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "HtlcKey.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKHtlcKey>) in
					HtlcKey_set_a(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new HtlcKey given each field
		public class func initWith(aArg: [UInt8]) -> HtlcKey {
			// native call variable prep

			let aArgPrimitiveWrapper = PublicKey(
				value: aArg, instantiationContext: "HtlcKey.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = HtlcKey_new(aArgPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			aArgPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = HtlcKey(
				cType: nativeCallResult, instantiationContext: "HtlcKey.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two HtlcKeys contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: HtlcKey, b: HtlcKey) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKHtlcKey>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKHtlcKey>) in
						HtlcKey_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the HtlcKey
		internal func clone() -> HtlcKey {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKHtlcKey>) in
					HtlcKey_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = HtlcKey(
				cType: nativeCallResult, instantiationContext: "HtlcKey.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Derive a public htlcpubkey using one node\'s `per_commitment_point` and its countersignatory\'s `basepoint`
		public class func initWithBasepoint(countersignatoryBasepoint: HtlcBasepoint, perCommitmentPoint: [UInt8])
			-> HtlcKey
		{
			// native call variable prep

			let perCommitmentPointPrimitiveWrapper = PublicKey(
				value: perCommitmentPoint, instantiationContext: "HtlcKey.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: countersignatoryBasepoint.cType!) {
					(countersignatoryBasepointPointer: UnsafePointer<LDKHtlcBasepoint>) in
					HtlcKey_from_basepoint(countersignatoryBasepointPointer, perCommitmentPointPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			perCommitmentPointPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = HtlcKey(
				cType: nativeCallResult, instantiationContext: "HtlcKey.swift::\(#function):\(#line)")


			try! returnValue.addAnchor(anchor: countersignatoryBasepoint)
			return returnValue
		}

		/// Build a htlcpubkey directly from an already-derived private key
		public class func initWithSecretKey(sk: [UInt8]) -> HtlcKey {
			// native call variable prep

			let tupledSk = Bindings.arrayToUInt8Tuple32(array: sk)


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: tupledSk) { (tupledSkPointer: UnsafePointer<UInt8Tuple32>) in
					HtlcKey_from_secret_key(tupledSkPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = HtlcKey(
				cType: nativeCallResult, instantiationContext: "HtlcKey.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Get inner Public Key
		public func toPublicKey() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKHtlcKey>) in
					HtlcKey_to_public_key(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "HtlcKey.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Serialize the HtlcKey object into a byte array which can be read by HtlcKey_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKHtlcKey>) in
					HtlcKey_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "HtlcKey.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a HtlcKey from a byte array, created by HtlcKey_write
		public class func read(ser: [UInt8]) -> Result_HtlcKeyDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "HtlcKey.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = HtlcKey_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_HtlcKeyDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "HtlcKey.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> HtlcKey {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> HtlcKey {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> HtlcKey {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> HtlcKey {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing HtlcKey \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing HtlcKey \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
			}
		}


	}


}

