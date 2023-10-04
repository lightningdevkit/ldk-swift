#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Parameters for relaying over a given [`BlindedHop`].
///
/// [`BlindedHop`]: crate::blinded_path::BlindedHop
public typealias PaymentRelay = Bindings.PaymentRelay

extension Bindings {


	/// Parameters for relaying over a given [`BlindedHop`].
	///
	/// [`BlindedHop`]: crate::blinded_path::BlindedHop
	public class PaymentRelay: NativeTypeWrapper {

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

		internal var cType: LDKPaymentRelay?

		internal init(cType: LDKPaymentRelay, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKPaymentRelay, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKPaymentRelay, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the PaymentRelay, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = PaymentRelay_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Number of blocks subtracted from an incoming HTLC's `cltv_expiry` for this [`BlindedHop`].
		public func getCltvExpiryDelta() -> UInt16 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPaymentRelay>) in
					PaymentRelay_get_cltv_expiry_delta(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Number of blocks subtracted from an incoming HTLC's `cltv_expiry` for this [`BlindedHop`].
		public func setCltvExpiryDelta(val: UInt16) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKPaymentRelay>) in
					PaymentRelay_set_cltv_expiry_delta(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Liquidity fee charged (in millionths of the amount transferred) for relaying a payment over
		/// this [`BlindedHop`], (i.e., 10,000 is 1%).
		public func getFeeProportionalMillionths() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPaymentRelay>) in
					PaymentRelay_get_fee_proportional_millionths(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Liquidity fee charged (in millionths of the amount transferred) for relaying a payment over
		/// this [`BlindedHop`], (i.e., 10,000 is 1%).
		public func setFeeProportionalMillionths(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKPaymentRelay>) in
					PaymentRelay_set_fee_proportional_millionths(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Base fee charged (in millisatoshi) for relaying a payment over this [`BlindedHop`].
		public func getFeeBaseMsat() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPaymentRelay>) in
					PaymentRelay_get_fee_base_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Base fee charged (in millisatoshi) for relaying a payment over this [`BlindedHop`].
		public func setFeeBaseMsat(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKPaymentRelay>) in
					PaymentRelay_set_fee_base_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new PaymentRelay given each field
		public init(cltvExpiryDeltaArg: UInt16, feeProportionalMillionthsArg: UInt32, feeBaseMsatArg: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult = PaymentRelay_new(cltvExpiryDeltaArg, feeProportionalMillionthsArg, feeBaseMsatArg)

			// cleanup

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = PaymentRelay(cType: nativeCallResult, instantiationContext: "PaymentRelay.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "PaymentRelay.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the PaymentRelay
		internal func clone() -> PaymentRelay {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKPaymentRelay>) in
					PaymentRelay_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PaymentRelay(
				cType: nativeCallResult, instantiationContext: "PaymentRelay.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Serialize the PaymentRelay object into a byte array which can be read by PaymentRelay_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKPaymentRelay>) in
					PaymentRelay_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "PaymentRelay.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a PaymentRelay from a byte array, created by PaymentRelay_write
		public class func read(ser: [UInt8]) -> Result_PaymentRelayDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "PaymentRelay.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = PaymentRelay_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_PaymentRelayDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "PaymentRelay.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> PaymentRelay {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> PaymentRelay {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> PaymentRelay {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> PaymentRelay {
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
						"Freeing PaymentRelay \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing PaymentRelay \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

