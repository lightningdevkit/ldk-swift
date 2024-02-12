#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// The revocation key is used to allow a channel party to revoke their state - giving their
/// counterparty the required material to claim all of their funds if they broadcast that state.
///
/// Each commitment transaction has a revocation key based on the basepoint and
/// per_commitment_point which is used in both commitment and HTLC transactions.
///
/// See [the BOLT spec for derivation details]
/// (https://github.com/lightning/bolts/blob/master/03-transactions.md#revocationpubkey-derivation)
public typealias RevocationKey = Bindings.RevocationKey

extension Bindings {


	/// The revocation key is used to allow a channel party to revoke their state - giving their
	/// counterparty the required material to claim all of their funds if they broadcast that state.
	///
	/// Each commitment transaction has a revocation key based on the basepoint and
	/// per_commitment_point which is used in both commitment and HTLC transactions.
	///
	/// See [the BOLT spec for derivation details]
	/// (https://github.com/lightning/bolts/blob/master/03-transactions.md#revocationpubkey-derivation)
	public class RevocationKey: NativeTypeWrapper {

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

		internal var cType: LDKRevocationKey?

		internal init(cType: LDKRevocationKey, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKRevocationKey, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKRevocationKey, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the RevocationKey, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = RevocationKey_free(self.cType!)

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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRevocationKey>) in
					RevocationKey_get_a(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "RevocationKey.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		///
		public func setA(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "RevocationKey.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRevocationKey>) in
					RevocationKey_set_a(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new RevocationKey given each field
		public init(aArg: [UInt8]) {
			// native call variable prep

			let aArgPrimitiveWrapper = PublicKey(
				value: aArg, instantiationContext: "RevocationKey.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = RevocationKey_new(aArgPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			aArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = RevocationKey(cType: nativeCallResult, instantiationContext: "RevocationKey.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "RevocationKey.swift::\(#function):\(#line)")


		}

		/// Checks if two RevocationKeys contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: RevocationKey, b: RevocationKey) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKRevocationKey>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKRevocationKey>) in
						RevocationKey_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the RevocationKey
		internal func clone() -> RevocationKey {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKRevocationKey>) in
					RevocationKey_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = RevocationKey(
				cType: nativeCallResult, instantiationContext: "RevocationKey.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the RevocationKey.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKRevocationKey>) in
					RevocationKey_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Derives a per-commitment-transaction revocation public key from one party's per-commitment
		/// point and the other party's [`RevocationBasepoint`]. This is the public equivalent of
		/// [`chan_utils::derive_private_revocation_key`] - using only public keys to derive a public
		/// key instead of private keys.
		///
		/// Note that this is infallible iff we trust that at least one of the two input keys are randomly
		/// generated (ie our own).
		///
		/// [`chan_utils::derive_private_revocation_key`]: crate::ln::chan_utils::derive_private_revocation_key
		public class func initWithBasepoint(countersignatoryBasepoint: RevocationBasepoint, perCommitmentPoint: [UInt8])
			-> RevocationKey
		{
			// native call variable prep

			let perCommitmentPointPrimitiveWrapper = PublicKey(
				value: perCommitmentPoint, instantiationContext: "RevocationKey.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: countersignatoryBasepoint.cType!) {
					(countersignatoryBasepointPointer: UnsafePointer<LDKRevocationBasepoint>) in
					RevocationKey_from_basepoint(
						countersignatoryBasepointPointer, perCommitmentPointPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			perCommitmentPointPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = RevocationKey(
				cType: nativeCallResult, instantiationContext: "RevocationKey.swift::\(#function):\(#line)")


			try! returnValue.addAnchor(anchor: countersignatoryBasepoint)
			return returnValue
		}

		/// Get inner Public Key
		public func toPublicKey() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRevocationKey>) in
					RevocationKey_to_public_key(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "RevocationKey.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Serialize the RevocationKey object into a byte array which can be read by RevocationKey_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKRevocationKey>) in
					RevocationKey_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "RevocationKey.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a RevocationKey from a byte array, created by RevocationKey_write
		public class func read(ser: [UInt8]) -> Result_RevocationKeyDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "RevocationKey.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = RevocationKey_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_RevocationKeyDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "RevocationKey.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> RevocationKey {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> RevocationKey {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> RevocationKey {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> RevocationKey {
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
						"Freeing RevocationKey \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing RevocationKey \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

