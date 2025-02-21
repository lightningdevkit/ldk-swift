#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// An [`accept_channel2`] message to be sent by or received from the channel accepter.
///
/// Used in V2 channel establishment
///
/// [`accept_channel2`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#the-accept_channel2-message
public typealias AcceptChannelV2 = Bindings.AcceptChannelV2

extension Bindings {


	/// An [`accept_channel2`] message to be sent by or received from the channel accepter.
	///
	/// Used in V2 channel establishment
	///
	/// [`accept_channel2`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#the-accept_channel2-message
	public class AcceptChannelV2: NativeTypeWrapper {

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

		internal var cType: LDKAcceptChannelV2?

		internal init(cType: LDKAcceptChannelV2, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKAcceptChannelV2, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKAcceptChannelV2, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the AcceptChannelV2, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = AcceptChannelV2_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Common fields of `accept_channel(2)`-like messages
		public func getCommonFields() -> CommonAcceptChannelFields {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_common_fields(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = CommonAcceptChannelFields(
				cType: nativeCallResult, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Common fields of `accept_channel(2)`-like messages
		public func setCommonFields(val: CommonAcceptChannelFields) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_common_fields(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Part of the channel value contributed by the channel acceptor
		public func getFundingSatoshis() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_funding_satoshis(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Part of the channel value contributed by the channel acceptor
		public func setFundingSatoshis(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_funding_satoshis(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The second to-be-broadcast-by-channel-acceptor transaction's per commitment point
		public func getSecondPerCommitmentPoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_second_per_commitment_point(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The second to-be-broadcast-by-channel-acceptor transaction's per commitment point
		public func setSecondPerCommitmentPoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_second_per_commitment_point(thisPtrPointer, valPrimitiveWrapper.cType!)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_require_confirmed_inputs(thisPtrPointer)
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
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_require_confirmed_inputs(thisPtrPointer, val.getCValue())
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new AcceptChannelV2 given each field
		@available(
			*, deprecated,
			message:
				"This method passes the following non-cloneable, but freeable objects by value: `requireConfirmedInputsArg`."
		)
		public init(
			commonFieldsArg: CommonAcceptChannelFields, fundingSatoshisArg: UInt64,
			secondPerCommitmentPointArg: [UInt8], requireConfirmedInputsArg: Option_NoneZ
		) {
			// native call variable prep

			let secondPerCommitmentPointArgPrimitiveWrapper = PublicKey(
				value: secondPerCommitmentPointArg, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)"
			)


			// native method call
			let nativeCallResult = AcceptChannelV2_new(
				commonFieldsArg.dynamicallyDangledClone().cType!, fundingSatoshisArg,
				secondPerCommitmentPointArgPrimitiveWrapper.cType!, requireConfirmedInputsArg.getCValue())

			// cleanup

			// for elided types, we need this
			secondPerCommitmentPointArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = AcceptChannelV2(cType: nativeCallResult, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the AcceptChannelV2
		internal func clone() -> AcceptChannelV2 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = AcceptChannelV2(
				cType: nativeCallResult, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the AcceptChannelV2.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two AcceptChannelV2s contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: AcceptChannelV2, b: AcceptChannelV2) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKAcceptChannelV2>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKAcceptChannelV2>) in
						AcceptChannelV2_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the AcceptChannelV2 object into a byte array which can be read by AcceptChannelV2_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a AcceptChannelV2 from a byte array, created by AcceptChannelV2_write
		public class func read(ser: [UInt8]) -> Result_AcceptChannelV2DecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = AcceptChannelV2_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_AcceptChannelV2DecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> AcceptChannelV2 {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> AcceptChannelV2 {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> AcceptChannelV2 {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> AcceptChannelV2 {
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
						"Freeing AcceptChannelV2 \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing AcceptChannelV2 \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

