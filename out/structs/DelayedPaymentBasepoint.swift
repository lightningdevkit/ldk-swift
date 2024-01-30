#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Base key used in conjunction with a `per_commitment_point` to generate a [`DelayedPaymentKey`].
///
/// The delayed payment key is used to pay the commitment state broadcaster their
/// non-HTLC-encumbered funds after a delay to give their counterparty a chance to punish if the
/// state broadcasted was previously revoked.
public typealias DelayedPaymentBasepoint = Bindings.DelayedPaymentBasepoint

extension Bindings {


	/// Base key used in conjunction with a `per_commitment_point` to generate a [`DelayedPaymentKey`].
	///
	/// The delayed payment key is used to pay the commitment state broadcaster their
	/// non-HTLC-encumbered funds after a delay to give their counterparty a chance to punish if the
	/// state broadcasted was previously revoked.
	public class DelayedPaymentBasepoint: NativeTypeWrapper {

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

		internal var cType: LDKDelayedPaymentBasepoint?

		internal init(cType: LDKDelayedPaymentBasepoint, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKDelayedPaymentBasepoint, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKDelayedPaymentBasepoint, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Frees any resources used by the DelayedPaymentBasepoint, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = DelayedPaymentBasepoint_free(self.cType!)

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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKDelayedPaymentBasepoint>) in
					DelayedPaymentBasepoint_get_a(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "DelayedPaymentBasepoint.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		///
		public func setA(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "DelayedPaymentBasepoint.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKDelayedPaymentBasepoint>) in
					DelayedPaymentBasepoint_set_a(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new DelayedPaymentBasepoint given each field
		public init(aArg: [UInt8]) {
			// native call variable prep

			let aArgPrimitiveWrapper = PublicKey(
				value: aArg, instantiationContext: "DelayedPaymentBasepoint.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = DelayedPaymentBasepoint_new(aArgPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			aArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = DelayedPaymentBasepoint(cType: nativeCallResult, instantiationContext: "DelayedPaymentBasepoint.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "DelayedPaymentBasepoint.swift::\(#function):\(#line)")


		}

		/// Checks if two DelayedPaymentBasepoints contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: DelayedPaymentBasepoint, b: DelayedPaymentBasepoint) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKDelayedPaymentBasepoint>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKDelayedPaymentBasepoint>) in
						DelayedPaymentBasepoint_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the DelayedPaymentBasepoint
		internal func clone() -> DelayedPaymentBasepoint {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKDelayedPaymentBasepoint>) in
					DelayedPaymentBasepoint_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = DelayedPaymentBasepoint(
				cType: nativeCallResult, instantiationContext: "DelayedPaymentBasepoint.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the DelayedPaymentBasepoint.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKDelayedPaymentBasepoint>) in
					DelayedPaymentBasepoint_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Get inner Public Key
		public func toPublicKey() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKDelayedPaymentBasepoint>) in
					DelayedPaymentBasepoint_to_public_key(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "DelayedPaymentBasepoint.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Serialize the DelayedPaymentBasepoint object into a byte array which can be read by DelayedPaymentBasepoint_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKDelayedPaymentBasepoint>) in
					DelayedPaymentBasepoint_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "DelayedPaymentBasepoint.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a DelayedPaymentBasepoint from a byte array, created by DelayedPaymentBasepoint_write
		public class func read(ser: [UInt8]) -> Result_DelayedPaymentBasepointDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "DelayedPaymentBasepoint.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = DelayedPaymentBasepoint_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_DelayedPaymentBasepointDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "DelayedPaymentBasepoint.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> DelayedPaymentBasepoint {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> DelayedPaymentBasepoint {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> DelayedPaymentBasepoint {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> DelayedPaymentBasepoint {
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
						"Freeing DelayedPaymentBasepoint \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing DelayedPaymentBasepoint \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

