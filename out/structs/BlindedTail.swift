#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// The blinded portion of a [`Path`], if we're routing to a recipient who provided blinded paths in
/// their BOLT12 [`Invoice`].
///
/// [`Invoice`]: crate::offers::invoice::Invoice
public typealias BlindedTail = Bindings.BlindedTail

extension Bindings {


	/// The blinded portion of a [`Path`], if we're routing to a recipient who provided blinded paths in
	/// their BOLT12 [`Invoice`].
	///
	/// [`Invoice`]: crate::offers::invoice::Invoice
	public class BlindedTail: NativeTypeWrapper {

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

		internal var cType: LDKBlindedTail?

		internal init(cType: LDKBlindedTail, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKBlindedTail, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKBlindedTail, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the BlindedTail, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = BlindedTail_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The hops of the [`BlindedPath`] provided by the recipient.
		///
		/// [`BlindedPath`]: crate::blinded_path::BlindedPath
		public func getHops() -> [BlindedHop] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBlindedTail>) in
					BlindedTail_get_hops(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_BlindedHopZ(
				cType: nativeCallResult, instantiationContext: "BlindedTail.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The hops of the [`BlindedPath`] provided by the recipient.
		///
		/// [`BlindedPath`]: crate::blinded_path::BlindedPath
		public func setHops(val: [BlindedHop]) {
			// native call variable prep

			let valVector = Vec_BlindedHopZ(
				array: val, instantiationContext: "BlindedTail.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKBlindedTail>) in
					BlindedTail_set_hops(thisPtrPointer, valVector.cType!)
				}


			// cleanup

			// valVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The blinding point of the [`BlindedPath`] provided by the recipient.
		///
		/// [`BlindedPath`]: crate::blinded_path::BlindedPath
		public func getBlindingPoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBlindedTail>) in
					BlindedTail_get_blinding_point(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "BlindedTail.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The blinding point of the [`BlindedPath`] provided by the recipient.
		///
		/// [`BlindedPath`]: crate::blinded_path::BlindedPath
		public func setBlindingPoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "BlindedTail.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKBlindedTail>) in
					BlindedTail_set_blinding_point(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Excess CLTV delta added to the recipient's CLTV expiry to deter intermediate nodes from
		/// inferring the destination. May be 0.
		public func getExcessFinalCltvExpiryDelta() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBlindedTail>) in
					BlindedTail_get_excess_final_cltv_expiry_delta(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Excess CLTV delta added to the recipient's CLTV expiry to deter intermediate nodes from
		/// inferring the destination. May be 0.
		public func setExcessFinalCltvExpiryDelta(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKBlindedTail>) in
					BlindedTail_set_excess_final_cltv_expiry_delta(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The total amount paid on this [`Path`], excluding the fees.
		public func getFinalValueMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBlindedTail>) in
					BlindedTail_get_final_value_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The total amount paid on this [`Path`], excluding the fees.
		public func setFinalValueMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKBlindedTail>) in
					BlindedTail_set_final_value_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new BlindedTail given each field
		public init(
			hopsArg: [BlindedHop], blindingPointArg: [UInt8], excessFinalCltvExpiryDeltaArg: UInt32,
			finalValueMsatArg: UInt64
		) {
			// native call variable prep

			let hopsArgVector = Vec_BlindedHopZ(
				array: hopsArg, instantiationContext: "BlindedTail.swift::\(#function):\(#line)"
			)
			.dangle()

			let blindingPointArgPrimitiveWrapper = PublicKey(
				value: blindingPointArg, instantiationContext: "BlindedTail.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = BlindedTail_new(
				hopsArgVector.cType!, blindingPointArgPrimitiveWrapper.cType!, excessFinalCltvExpiryDeltaArg,
				finalValueMsatArg)

			// cleanup

			// hopsArgVector.noOpRetain()

			// for elided types, we need this
			blindingPointArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = BlindedTail(cType: nativeCallResult, instantiationContext: "BlindedTail.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(conflictAvoidingVariableName: 0, instantiationContext: "BlindedTail.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the BlindedTail
		internal func clone() -> BlindedTail {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBlindedTail>) in
					BlindedTail_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = BlindedTail(
				cType: nativeCallResult, instantiationContext: "BlindedTail.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the BlindedTail.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKBlindedTail>) in
					BlindedTail_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two BlindedTails contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: BlindedTail, b: BlindedTail) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKBlindedTail>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKBlindedTail>) in
						BlindedTail_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the BlindedTail object into a byte array which can be read by BlindedTail_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKBlindedTail>) in
					BlindedTail_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "BlindedTail.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a BlindedTail from a byte array, created by BlindedTail_write
		public class func read(ser: [UInt8]) -> Result_BlindedTailDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "BlindedTail.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = BlindedTail_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_BlindedTailDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "BlindedTail.swift::\(#function):\(#line)")


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


		internal func dangle(_ shouldDangle: Bool = true) -> BlindedTail {
			self.dangling = shouldDangle
			return self
		}

		internal func dangleRecursively() -> BlindedTail {
			self.dangling = true
			for currentAnchor in self.anchors {
				currentAnchor.dangleRecursively()
			}
			return self
		}


		internal func danglingClone() -> BlindedTail {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> BlindedTail {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> BlindedTail {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> BlindedTail {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing BlindedTail \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing BlindedTail \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

