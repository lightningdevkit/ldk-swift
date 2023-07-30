import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias DecodeError = Bindings.DecodeError

extension Bindings {

	/// An error in decoding a message or struct.
	public class DecodeError: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKDecodeError?

		internal init(cType: LDKDecodeError, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKDecodeError, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKDecodeError, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum DecodeErrorType {

			/// A version byte specified something we don't know how to handle.
			///
			/// Includes unknown realm byte in an onion hop data packet.
			case UnknownVersion

			/// Unknown feature mandating we fail to parse message (e.g., TLV with an even, unknown type)
			case UnknownRequiredFeature

			/// Value was invalid.
			///
			/// For example, a byte which was supposed to be a bool was something other than a 0
			/// or 1, a public key/private key/signature was invalid, text wasn't UTF-8, TLV was
			/// syntactically incorrect, etc.
			case InvalidValue

			/// The buffer to be read was too short.
			case ShortRead

			/// A length descriptor in the packet didn't describe the later data correctly.
			case BadLengthDescriptor

			/// Error from [`std::io`].
			case Io

			/// The message included zlib-compressed values, which we don't support.
			case UnsupportedCompression

		}

		public func getValueType() -> DecodeErrorType {
			switch self.cType!.tag {
				case LDKDecodeError_UnknownVersion:
					return .UnknownVersion

				case LDKDecodeError_UnknownRequiredFeature:
					return .UnknownRequiredFeature

				case LDKDecodeError_InvalidValue:
					return .InvalidValue

				case LDKDecodeError_ShortRead:
					return .ShortRead

				case LDKDecodeError_BadLengthDescriptor:
					return .BadLengthDescriptor

				case LDKDecodeError_Io:
					return .Io

				case LDKDecodeError_UnsupportedCompression:
					return .UnsupportedCompression

				default:
					Bindings.print("Error: Invalid value type for DecodeError! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the DecodeError
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = DecodeError_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the DecodeError
		internal func clone() -> DecodeError {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKDecodeError>) in
					DecodeError_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = DecodeError(
				cType: nativeCallResult, instantiationContext: "DecodeError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new UnknownVersion-variant DecodeError
		public class func initWithUnknownVersion() -> DecodeError {
			// native call variable prep


			// native method call
			let nativeCallResult = DecodeError_unknown_version()

			// cleanup


			// return value (do some wrapping)
			let returnValue = DecodeError(
				cType: nativeCallResult, instantiationContext: "DecodeError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new UnknownRequiredFeature-variant DecodeError
		public class func initWithUnknownRequiredFeature() -> DecodeError {
			// native call variable prep


			// native method call
			let nativeCallResult = DecodeError_unknown_required_feature()

			// cleanup


			// return value (do some wrapping)
			let returnValue = DecodeError(
				cType: nativeCallResult, instantiationContext: "DecodeError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new InvalidValue-variant DecodeError
		public class func initWithInvalidValue() -> DecodeError {
			// native call variable prep


			// native method call
			let nativeCallResult = DecodeError_invalid_value()

			// cleanup


			// return value (do some wrapping)
			let returnValue = DecodeError(
				cType: nativeCallResult, instantiationContext: "DecodeError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new ShortRead-variant DecodeError
		public class func initWithShortRead() -> DecodeError {
			// native call variable prep


			// native method call
			let nativeCallResult = DecodeError_short_read()

			// cleanup


			// return value (do some wrapping)
			let returnValue = DecodeError(
				cType: nativeCallResult, instantiationContext: "DecodeError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new BadLengthDescriptor-variant DecodeError
		public class func initWithBadLengthDescriptor() -> DecodeError {
			// native call variable prep


			// native method call
			let nativeCallResult = DecodeError_bad_length_descriptor()

			// cleanup


			// return value (do some wrapping)
			let returnValue = DecodeError(
				cType: nativeCallResult, instantiationContext: "DecodeError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Io-variant DecodeError
		public class func initWithIo(a: IOError) -> DecodeError {
			// native call variable prep


			// native method call
			let nativeCallResult = DecodeError_io(a.getCValue())

			// cleanup


			// return value (do some wrapping)
			let returnValue = DecodeError(
				cType: nativeCallResult, instantiationContext: "DecodeError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new UnsupportedCompression-variant DecodeError
		public class func initWithUnsupportedCompression() -> DecodeError {
			// native call variable prep


			// native method call
			let nativeCallResult = DecodeError_unsupported_compression()

			// cleanup


			// return value (do some wrapping)
			let returnValue = DecodeError(
				cType: nativeCallResult, instantiationContext: "DecodeError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two DecodeErrors contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: DecodeError, b: DecodeError) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKDecodeError>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKDecodeError>) in
						DecodeError_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func getValueAsIo() -> IOError? {
			if self.cType?.tag != LDKDecodeError_Io {
				return nil
			}

			return IOError(value: self.cType!.io)
		}


		internal func dangle(_ shouldDangle: Bool = true) -> DecodeError {
			self.dangling = shouldDangle
			return self
		}

		internal func dangleRecursively() -> DecodeError {
			self.dangling = true
			for currentAnchor in self.anchors {
				currentAnchor.dangleRecursively()
			}
			return self
		}


		internal func danglingClone() -> DecodeError {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing DecodeError \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing DecodeError \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
