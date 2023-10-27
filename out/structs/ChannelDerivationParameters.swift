#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// The parameters required to derive a channel signer via [`SignerProvider`].
public typealias ChannelDerivationParameters = Bindings.ChannelDerivationParameters

extension Bindings {


	/// The parameters required to derive a channel signer via [`SignerProvider`].
	public class ChannelDerivationParameters: NativeTypeWrapper {

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

		internal var cType: LDKChannelDerivationParameters?

		internal init(cType: LDKChannelDerivationParameters, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKChannelDerivationParameters, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKChannelDerivationParameters, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Frees any resources used by the ChannelDerivationParameters, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ChannelDerivationParameters_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The value in satoshis of the channel we're attempting to spend the anchor output of.
		public func getValueSatoshis() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDerivationParameters>) in
					ChannelDerivationParameters_get_value_satoshis(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The value in satoshis of the channel we're attempting to spend the anchor output of.
		public func setValueSatoshis(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKChannelDerivationParameters>) in
					ChannelDerivationParameters_set_value_satoshis(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The unique identifier to re-derive the signer for the associated channel.
		public func getKeysId() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDerivationParameters>) in
					ChannelDerivationParameters_get_keys_id(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// The unique identifier to re-derive the signer for the associated channel.
		public func setKeysId(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ThirtyTwoBytes(
				value: val, instantiationContext: "ChannelDerivationParameters.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKChannelDerivationParameters>) in
					ChannelDerivationParameters_set_keys_id(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The necessary channel parameters that need to be provided to the re-derived signer through
		/// [`ChannelSigner::provide_channel_parameters`].
		public func getTransactionParameters() -> ChannelTransactionParameters {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDerivationParameters>) in
					ChannelDerivationParameters_get_transaction_parameters(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelTransactionParameters(
				cType: nativeCallResult,
				instantiationContext: "ChannelDerivationParameters.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The necessary channel parameters that need to be provided to the re-derived signer through
		/// [`ChannelSigner::provide_channel_parameters`].
		public func setTransactionParameters(val: ChannelTransactionParameters) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKChannelDerivationParameters>) in
					ChannelDerivationParameters_set_transaction_parameters(
						thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new ChannelDerivationParameters given each field
		public init(
			valueSatoshisArg: UInt64, keysIdArg: [UInt8], transactionParametersArg: ChannelTransactionParameters
		) {
			// native call variable prep

			let keysIdArgPrimitiveWrapper = ThirtyTwoBytes(
				value: keysIdArg, instantiationContext: "ChannelDerivationParameters.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = ChannelDerivationParameters_new(
				valueSatoshisArg, keysIdArgPrimitiveWrapper.cType!,
				transactionParametersArg.dynamicallyDangledClone().cType!)

			// cleanup

			// for elided types, we need this
			keysIdArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = ChannelDerivationParameters(cType: nativeCallResult, instantiationContext: "ChannelDerivationParameters.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "ChannelDerivationParameters.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the ChannelDerivationParameters
		internal func clone() -> ChannelDerivationParameters {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKChannelDerivationParameters>) in
					ChannelDerivationParameters_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelDerivationParameters(
				cType: nativeCallResult,
				instantiationContext: "ChannelDerivationParameters.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two ChannelDerivationParameterss contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: ChannelDerivationParameters, b: ChannelDerivationParameters) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKChannelDerivationParameters>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKChannelDerivationParameters>) in
						ChannelDerivationParameters_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the ChannelDerivationParameters object into a byte array which can be read by ChannelDerivationParameters_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKChannelDerivationParameters>) in
					ChannelDerivationParameters_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult,
				instantiationContext: "ChannelDerivationParameters.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a ChannelDerivationParameters from a byte array, created by ChannelDerivationParameters_write
		public class func read(ser: [UInt8]) -> Result_ChannelDerivationParametersDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "ChannelDerivationParameters.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = ChannelDerivationParameters_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_ChannelDerivationParametersDecodeErrorZ(
				cType: nativeCallResult,
				instantiationContext: "ChannelDerivationParameters.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> ChannelDerivationParameters {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> ChannelDerivationParameters {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> ChannelDerivationParameters {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> ChannelDerivationParameters {
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
						"Freeing ChannelDerivationParameters \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ChannelDerivationParameters \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

