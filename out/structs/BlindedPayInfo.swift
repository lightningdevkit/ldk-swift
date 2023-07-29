#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Information needed to route a payment across a [`BlindedPath`].
public typealias BlindedPayInfo = Bindings.BlindedPayInfo

extension Bindings {


	/// Information needed to route a payment across a [`BlindedPath`].
	public class BlindedPayInfo: NativeTypeWrapper {

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

		internal var cType: LDKBlindedPayInfo?

		internal init(cType: LDKBlindedPayInfo, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKBlindedPayInfo, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKBlindedPayInfo, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the BlindedPayInfo, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = BlindedPayInfo_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Base fee charged (in millisatoshi) for the entire blinded path.
		public func getFeeBaseMsat() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBlindedPayInfo>) in
					BlindedPayInfo_get_fee_base_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Base fee charged (in millisatoshi) for the entire blinded path.
		public func setFeeBaseMsat(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKBlindedPayInfo>) in
					BlindedPayInfo_set_fee_base_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Liquidity fee charged (in millionths of the amount transferred) for the entire blinded path
		/// (i.e., 10,000 is 1%).
		public func getFeeProportionalMillionths() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBlindedPayInfo>) in
					BlindedPayInfo_get_fee_proportional_millionths(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Liquidity fee charged (in millionths of the amount transferred) for the entire blinded path
		/// (i.e., 10,000 is 1%).
		public func setFeeProportionalMillionths(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKBlindedPayInfo>) in
					BlindedPayInfo_set_fee_proportional_millionths(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Number of blocks subtracted from an incoming HTLC's `cltv_expiry` for the entire blinded
		/// path.
		public func getCltvExpiryDelta() -> UInt16 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBlindedPayInfo>) in
					BlindedPayInfo_get_cltv_expiry_delta(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Number of blocks subtracted from an incoming HTLC's `cltv_expiry` for the entire blinded
		/// path.
		public func setCltvExpiryDelta(val: UInt16) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKBlindedPayInfo>) in
					BlindedPayInfo_set_cltv_expiry_delta(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The minimum HTLC value (in millisatoshi) that is acceptable to all channel peers on the
		/// blinded path from the introduction node to the recipient, accounting for any fees, i.e., as
		/// seen by the recipient.
		public func getHtlcMinimumMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBlindedPayInfo>) in
					BlindedPayInfo_get_htlc_minimum_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The minimum HTLC value (in millisatoshi) that is acceptable to all channel peers on the
		/// blinded path from the introduction node to the recipient, accounting for any fees, i.e., as
		/// seen by the recipient.
		public func setHtlcMinimumMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKBlindedPayInfo>) in
					BlindedPayInfo_set_htlc_minimum_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum HTLC value (in millisatoshi) that is acceptable to all channel peers on the
		/// blinded path from the introduction node to the recipient, accounting for any fees, i.e., as
		/// seen by the recipient.
		public func getHtlcMaximumMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBlindedPayInfo>) in
					BlindedPayInfo_get_htlc_maximum_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum HTLC value (in millisatoshi) that is acceptable to all channel peers on the
		/// blinded path from the introduction node to the recipient, accounting for any fees, i.e., as
		/// seen by the recipient.
		public func setHtlcMaximumMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKBlindedPayInfo>) in
					BlindedPayInfo_set_htlc_maximum_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Features set in `encrypted_data_tlv` for the `encrypted_recipient_data` TLV record in an
		/// onion payload.
		public func getFeatures() -> BlindedHopFeatures {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBlindedPayInfo>) in
					BlindedPayInfo_get_features(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = BlindedHopFeatures(
				cType: nativeCallResult, instantiationContext: "BlindedPayInfo.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Features set in `encrypted_data_tlv` for the `encrypted_recipient_data` TLV record in an
		/// onion payload.
		public func setFeatures(val: BlindedHopFeatures) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKBlindedPayInfo>) in
					BlindedPayInfo_set_features(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new BlindedPayInfo given each field
		public init(
			feeBaseMsatArg: UInt32, feeProportionalMillionthsArg: UInt32, cltvExpiryDeltaArg: UInt16,
			htlcMinimumMsatArg: UInt64, htlcMaximumMsatArg: UInt64, featuresArg: BlindedHopFeatures
		) {
			// native call variable prep


			// native method call
			let nativeCallResult = BlindedPayInfo_new(
				feeBaseMsatArg, feeProportionalMillionthsArg, cltvExpiryDeltaArg, htlcMinimumMsatArg,
				htlcMaximumMsatArg, featuresArg.dynamicallyDangledClone().cType!)

			// cleanup

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = BlindedPayInfo(cType: nativeCallResult, instantiationContext: "BlindedPayInfo.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "BlindedPayInfo.swift::\(#function):\(#line)"
				)


		}

		/// Creates a copy of the BlindedPayInfo
		internal func clone() -> BlindedPayInfo {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBlindedPayInfo>) in
					BlindedPayInfo_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = BlindedPayInfo(
				cType: nativeCallResult, instantiationContext: "BlindedPayInfo.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the BlindedPayInfo.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKBlindedPayInfo>) in
					BlindedPayInfo_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two BlindedPayInfos contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: BlindedPayInfo, b: BlindedPayInfo) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKBlindedPayInfo>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKBlindedPayInfo>) in
						BlindedPayInfo_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the BlindedPayInfo object into a byte array which can be read by BlindedPayInfo_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKBlindedPayInfo>) in
					BlindedPayInfo_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "BlindedPayInfo.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a BlindedPayInfo from a byte array, created by BlindedPayInfo_write
		public class func read(ser: [UInt8]) -> Result_BlindedPayInfoDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "BlindedPayInfo.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = BlindedPayInfo_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_BlindedPayInfoDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "BlindedPayInfo.swift::\(#function):\(#line)")


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


		internal func dangle(_ shouldDangle: Bool = true) -> BlindedPayInfo {
			self.dangling = shouldDangle
			return self
		}


		internal func danglingClone() -> BlindedPayInfo {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> BlindedPayInfo {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> BlindedPayInfo {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> BlindedPayInfo {
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
						"Freeing BlindedPayInfo \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing BlindedPayInfo \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

