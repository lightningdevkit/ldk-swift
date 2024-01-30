#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A tx_add_output message for adding an output during interactive transaction construction.
public typealias TxAddOutput = Bindings.TxAddOutput

extension Bindings {


	/// A tx_add_output message for adding an output during interactive transaction construction.
	public class TxAddOutput: NativeTypeWrapper {

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

		internal var cType: LDKTxAddOutput?

		internal init(cType: LDKTxAddOutput, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKTxAddOutput, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKTxAddOutput, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the TxAddOutput, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = TxAddOutput_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The channel ID
		public func getChannelId() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKTxAddOutput>) in
					TxAddOutput_get_channel_id(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// The channel ID
		public func setChannelId(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ThirtyTwoBytes(
				value: val, instantiationContext: "TxAddOutput.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKTxAddOutput>) in
					TxAddOutput_set_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A randomly chosen unique identifier for this output, which is even for initiators and odd for
		/// non-initiators.
		public func getSerialId() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKTxAddOutput>) in
					TxAddOutput_get_serial_id(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A randomly chosen unique identifier for this output, which is even for initiators and odd for
		/// non-initiators.
		public func setSerialId(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKTxAddOutput>) in
					TxAddOutput_set_serial_id(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The satoshi value of the output
		public func getSats() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKTxAddOutput>) in
					TxAddOutput_get_sats(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The satoshi value of the output
		public func setSats(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKTxAddOutput>) in
					TxAddOutput_set_sats(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The scriptPubKey for the output
		public func getScript() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKTxAddOutput>) in
					TxAddOutput_get_script(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "TxAddOutput.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The scriptPubKey for the output
		public func setScript(val: [UInt8]) {
			// native call variable prep

			let valVector = Vec_u8Z(array: val, instantiationContext: "TxAddOutput.swift::\(#function):\(#line)")
				.dangle()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKTxAddOutput>) in
					TxAddOutput_set_script(thisPtrPointer, valVector.cType!)
				}


			// cleanup

			// valVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new TxAddOutput given each field
		public init(channelIdArg: [UInt8], serialIdArg: UInt64, satsArg: UInt64, scriptArg: [UInt8]) {
			// native call variable prep

			let channelIdArgPrimitiveWrapper = ThirtyTwoBytes(
				value: channelIdArg, instantiationContext: "TxAddOutput.swift::\(#function):\(#line)")

			let scriptArgVector = Vec_u8Z(
				array: scriptArg, instantiationContext: "TxAddOutput.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = TxAddOutput_new(
				channelIdArgPrimitiveWrapper.cType!, serialIdArg, satsArg, scriptArgVector.cType!)

			// cleanup

			// for elided types, we need this
			channelIdArgPrimitiveWrapper.noOpRetain()

			// scriptArgVector.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = TxAddOutput(cType: nativeCallResult, instantiationContext: "TxAddOutput.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(conflictAvoidingVariableName: 0, instantiationContext: "TxAddOutput.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the TxAddOutput
		internal func clone() -> TxAddOutput {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKTxAddOutput>) in
					TxAddOutput_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = TxAddOutput(
				cType: nativeCallResult, instantiationContext: "TxAddOutput.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the TxAddOutput.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKTxAddOutput>) in
					TxAddOutput_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two TxAddOutputs contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: TxAddOutput, b: TxAddOutput) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKTxAddOutput>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKTxAddOutput>) in
						TxAddOutput_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the TxAddOutput object into a byte array which can be read by TxAddOutput_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKTxAddOutput>) in
					TxAddOutput_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "TxAddOutput.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a TxAddOutput from a byte array, created by TxAddOutput_write
		public class func read(ser: [UInt8]) -> Result_TxAddOutputDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "TxAddOutput.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = TxAddOutput_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_TxAddOutputDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "TxAddOutput.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> TxAddOutput {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> TxAddOutput {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> TxAddOutput {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> TxAddOutput {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing TxAddOutput \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing TxAddOutput \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

