#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// An [`open_channel2`] message to be sent by or received from the channel initiator.
///
/// Used in V2 channel establishment
///
/// [`open_channel2`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#the-open_channel2-message
public typealias OpenChannelV2 = Bindings.OpenChannelV2

extension Bindings {


	/// An [`open_channel2`] message to be sent by or received from the channel initiator.
	///
	/// Used in V2 channel establishment
	///
	/// [`open_channel2`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#the-open_channel2-message
	public class OpenChannelV2: NativeTypeWrapper {

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

		internal var cType: LDKOpenChannelV2?

		internal init(cType: LDKOpenChannelV2, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKOpenChannelV2, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKOpenChannelV2, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the OpenChannelV2, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = OpenChannelV2_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Common fields of `open_channel(2)`-like messages
		public func getCommonFields() -> CommonOpenChannelFields {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannelV2>) in
					OpenChannelV2_get_common_fields(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = CommonOpenChannelFields(
				cType: nativeCallResult, instantiationContext: "OpenChannelV2.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Common fields of `open_channel(2)`-like messages
		public func setCommonFields(val: CommonOpenChannelFields) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannelV2>) in
					OpenChannelV2_set_common_fields(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The feerate for the funding transaction set by the channel initiator
		public func getFundingFeerateSatPer1000Weight() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannelV2>) in
					OpenChannelV2_get_funding_feerate_sat_per_1000_weight(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The feerate for the funding transaction set by the channel initiator
		public func setFundingFeerateSatPer1000Weight(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannelV2>) in
					OpenChannelV2_set_funding_feerate_sat_per_1000_weight(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The locktime for the funding transaction
		public func getLocktime() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannelV2>) in
					OpenChannelV2_get_locktime(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The locktime for the funding transaction
		public func setLocktime(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannelV2>) in
					OpenChannelV2_set_locktime(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The second to-be-broadcast-by-channel-initiator transaction's per commitment point
		public func getSecondPerCommitmentPoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannelV2>) in
					OpenChannelV2_get_second_per_commitment_point(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "OpenChannelV2.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The second to-be-broadcast-by-channel-initiator transaction's per commitment point
		public func setSecondPerCommitmentPoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "OpenChannelV2.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannelV2>) in
					OpenChannelV2_set_second_per_commitment_point(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Optionally, a requirement that only confirmed inputs can be added
		public func getRequireConfirmedInputs() -> Option_NoneZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannelV2>) in
					OpenChannelV2_get_require_confirmed_inputs(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_NoneZ(value: nativeCallResult)


			return returnValue
		}

		/// Optionally, a requirement that only confirmed inputs can be added
		@available(
			*, deprecated,
			message: "This method passes the following non-cloneable, but freeable objects by value: `val`."
		)
		public func setRequireConfirmedInputs(val: Option_NoneZ) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannelV2>) in
					OpenChannelV2_set_require_confirmed_inputs(thisPtrPointer, val.getCValue())
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new OpenChannelV2 given each field
		@available(
			*, deprecated,
			message:
				"This method passes the following non-cloneable, but freeable objects by value: `requireConfirmedInputsArg`."
		)
		public init(
			commonFieldsArg: CommonOpenChannelFields, fundingFeerateSatPer1000WeightArg: UInt32, locktimeArg: UInt32,
			secondPerCommitmentPointArg: [UInt8], requireConfirmedInputsArg: Option_NoneZ
		) {
			// native call variable prep

			let secondPerCommitmentPointArgPrimitiveWrapper = PublicKey(
				value: secondPerCommitmentPointArg, instantiationContext: "OpenChannelV2.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = OpenChannelV2_new(
				commonFieldsArg.dynamicallyDangledClone().cType!, fundingFeerateSatPer1000WeightArg, locktimeArg,
				secondPerCommitmentPointArgPrimitiveWrapper.cType!, requireConfirmedInputsArg.getCValue())

			// cleanup

			// for elided types, we need this
			secondPerCommitmentPointArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = OpenChannelV2(cType: nativeCallResult, instantiationContext: "OpenChannelV2.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "OpenChannelV2.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the OpenChannelV2
		internal func clone() -> OpenChannelV2 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKOpenChannelV2>) in
					OpenChannelV2_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = OpenChannelV2(
				cType: nativeCallResult, instantiationContext: "OpenChannelV2.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the OpenChannelV2.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKOpenChannelV2>) in
					OpenChannelV2_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two OpenChannelV2s contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: OpenChannelV2, b: OpenChannelV2) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKOpenChannelV2>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKOpenChannelV2>) in
						OpenChannelV2_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the OpenChannelV2 object into a byte array which can be read by OpenChannelV2_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKOpenChannelV2>) in
					OpenChannelV2_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "OpenChannelV2.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a OpenChannelV2 from a byte array, created by OpenChannelV2_write
		public class func read(ser: [UInt8]) -> Result_OpenChannelV2DecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "OpenChannelV2.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = OpenChannelV2_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_OpenChannelV2DecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "OpenChannelV2.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> OpenChannelV2 {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> OpenChannelV2 {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> OpenChannelV2 {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> OpenChannelV2 {
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
						"Freeing OpenChannelV2 \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing OpenChannelV2 \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

