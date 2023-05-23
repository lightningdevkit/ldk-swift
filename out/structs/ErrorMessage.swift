#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// An [`error`] message to be sent to or received from a peer.
///
/// [`error`]: https://github.com/lightning/bolts/blob/master/01-messaging.md#the-error-and-warning-messages
public typealias ErrorMessage = Bindings.ErrorMessage

extension Bindings {


	/// An [`error`] message to be sent to or received from a peer.
	///
	/// [`error`]: https://github.com/lightning/bolts/blob/master/01-messaging.md#the-error-and-warning-messages
	public class ErrorMessage: NativeTypeWrapper {

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

		internal var cType: LDKErrorMessage?

		internal init(cType: LDKErrorMessage, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKErrorMessage, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKErrorMessage, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the ErrorMessage, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ErrorMessage_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The channel ID involved in the error.
		///
		/// All-0s indicates a general error unrelated to a specific channel, after which all channels
		/// with the sending peer should be closed.
		public func getChannelId() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKErrorMessage>) in
					ErrorMessage_get_channel_id(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// The channel ID involved in the error.
		///
		/// All-0s indicates a general error unrelated to a specific channel, after which all channels
		/// with the sending peer should be closed.
		public func setChannelId(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ThirtyTwoBytes(
				value: val, instantiationContext: "ErrorMessage.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKErrorMessage>) in
					ErrorMessage_set_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A possibly human-readable error description.
		///
		/// The string should be sanitized before it is used (e.g., emitted to logs or printed to
		/// `stdout`). Otherwise, a well crafted error message may trigger a security vulnerability in
		/// the terminal emulator or the logging subsystem.
		public func getData() -> String {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKErrorMessage>) in
					ErrorMessage_get_data(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Str(
				cType: nativeCallResult, instantiationContext: "ErrorMessage.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// A possibly human-readable error description.
		///
		/// The string should be sanitized before it is used (e.g., emitted to logs or printed to
		/// `stdout`). Otherwise, a well crafted error message may trigger a security vulnerability in
		/// the terminal emulator or the logging subsystem.
		public func setData(val: String) {
			// native call variable prep

			let valPrimitiveWrapper = Str(value: val, instantiationContext: "ErrorMessage.swift::\(#function):\(#line)")
				.dangle()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKErrorMessage>) in
					ErrorMessage_set_data(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new ErrorMessage given each field
		public init(channelIdArg: [UInt8], dataArg: String) {
			// native call variable prep

			let channelIdArgPrimitiveWrapper = ThirtyTwoBytes(
				value: channelIdArg, instantiationContext: "ErrorMessage.swift::\(#function):\(#line)")

			let dataArgPrimitiveWrapper = Str(
				value: dataArg, instantiationContext: "ErrorMessage.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = ErrorMessage_new(channelIdArgPrimitiveWrapper.cType!, dataArgPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			channelIdArgPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			dataArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = ErrorMessage(cType: nativeCallResult, instantiationContext: "ErrorMessage.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "ErrorMessage.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the ErrorMessage
		internal func clone() -> ErrorMessage {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKErrorMessage>) in
					ErrorMessage_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ErrorMessage(
				cType: nativeCallResult, instantiationContext: "ErrorMessage.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two ErrorMessages contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: ErrorMessage, b: ErrorMessage) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKErrorMessage>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKErrorMessage>) in
						ErrorMessage_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the ErrorMessage object into a byte array which can be read by ErrorMessage_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKErrorMessage>) in
					ErrorMessage_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "ErrorMessage.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a ErrorMessage from a byte array, created by ErrorMessage_write
		public class func read(ser: [UInt8]) -> Result_ErrorMessageDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "ErrorMessage.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = ErrorMessage_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_ErrorMessageDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "ErrorMessage.swift::\(#function):\(#line)")


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


		internal func dangle(_ shouldDangle: Bool = true) -> ErrorMessage {
			self.dangling = shouldDangle
			return self
		}


		internal func danglingClone() -> ErrorMessage {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> ErrorMessage {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> ErrorMessage {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> ErrorMessage {
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
						"Freeing ErrorMessage \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ErrorMessage \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

