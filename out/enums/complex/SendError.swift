import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias SendError = Bindings.SendError

extension Bindings {

	/// Errors that may occur when [sending an onion message].
	///
	/// [sending an onion message]: OnionMessenger::send_onion_message
	public class SendError: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKSendError?

		internal init(cType: LDKSendError, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKSendError, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKSendError, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum SendErrorType {

			/// Errored computing onion message packet keys.
			case Secp256k1

			/// Because implementations such as Eclair will drop onion messages where the message packet
			/// exceeds 32834 bytes, we refuse to send messages where the packet exceeds this size.
			case TooBigPacket

			/// The provided [`Destination`] was an invalid [`BlindedPath`] due to not having any blinded
			/// hops.
			case TooFewBlindedHops

			/// The first hop is not a peer and doesn't have a known [`SocketAddress`].
			case InvalidFirstHop

			/// A path from the sender to the destination could not be found by the [`MessageRouter`].
			case PathNotFound

			/// Onion message contents must have a TLV type >= 64.
			case InvalidMessage

			/// Our next-hop peer's buffer was full or our total outbound buffer was full.
			case BufferFull

			/// Failed to retrieve our node id from the provided [`NodeSigner`].
			///
			/// [`NodeSigner`]: crate::sign::NodeSigner
			case GetNodeIdFailed

			/// We attempted to send to a blinded path where we are the introduction node, and failed to
			/// advance the blinded path to make the second hop the new introduction node. Either
			/// [`NodeSigner::ecdh`] failed, we failed to tweak the current blinding point to get the
			/// new blinding point, or we were attempting to send to ourselves.
			case BlindedPathAdvanceFailed

		}

		public func getValueType() -> SendErrorType {
			switch self.cType!.tag {
				case LDKSendError_Secp256k1:
					return .Secp256k1

				case LDKSendError_TooBigPacket:
					return .TooBigPacket

				case LDKSendError_TooFewBlindedHops:
					return .TooFewBlindedHops

				case LDKSendError_InvalidFirstHop:
					return .InvalidFirstHop

				case LDKSendError_PathNotFound:
					return .PathNotFound

				case LDKSendError_InvalidMessage:
					return .InvalidMessage

				case LDKSendError_BufferFull:
					return .BufferFull

				case LDKSendError_GetNodeIdFailed:
					return .GetNodeIdFailed

				case LDKSendError_BlindedPathAdvanceFailed:
					return .BlindedPathAdvanceFailed

				default:
					Bindings.print("Error: Invalid value type for SendError! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the SendError
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = SendError_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the SendError
		internal func clone() -> SendError {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKSendError>) in
					SendError_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = SendError(
				cType: nativeCallResult, instantiationContext: "SendError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Secp256k1-variant SendError
		public class func initWithSecp256k1(a: Secp256k1Error) -> SendError {
			// native call variable prep


			// native method call
			let nativeCallResult = SendError_secp256k1(a.getCValue())

			// cleanup


			// return value (do some wrapping)
			let returnValue = SendError(
				cType: nativeCallResult, instantiationContext: "SendError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new TooBigPacket-variant SendError
		public class func initWithTooBigPacket() -> SendError {
			// native call variable prep


			// native method call
			let nativeCallResult = SendError_too_big_packet()

			// cleanup


			// return value (do some wrapping)
			let returnValue = SendError(
				cType: nativeCallResult, instantiationContext: "SendError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new TooFewBlindedHops-variant SendError
		public class func initWithTooFewBlindedHops() -> SendError {
			// native call variable prep


			// native method call
			let nativeCallResult = SendError_too_few_blinded_hops()

			// cleanup


			// return value (do some wrapping)
			let returnValue = SendError(
				cType: nativeCallResult, instantiationContext: "SendError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new InvalidFirstHop-variant SendError
		public class func initWithInvalidFirstHop(a: [UInt8]) -> SendError {
			// native call variable prep

			let aPrimitiveWrapper = PublicKey(value: a, instantiationContext: "SendError.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = SendError_invalid_first_hop(aPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			aPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = SendError(
				cType: nativeCallResult, instantiationContext: "SendError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new PathNotFound-variant SendError
		public class func initWithPathNotFound() -> SendError {
			// native call variable prep


			// native method call
			let nativeCallResult = SendError_path_not_found()

			// cleanup


			// return value (do some wrapping)
			let returnValue = SendError(
				cType: nativeCallResult, instantiationContext: "SendError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new InvalidMessage-variant SendError
		public class func initWithInvalidMessage() -> SendError {
			// native call variable prep


			// native method call
			let nativeCallResult = SendError_invalid_message()

			// cleanup


			// return value (do some wrapping)
			let returnValue = SendError(
				cType: nativeCallResult, instantiationContext: "SendError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new BufferFull-variant SendError
		public class func initWithBufferFull() -> SendError {
			// native call variable prep


			// native method call
			let nativeCallResult = SendError_buffer_full()

			// cleanup


			// return value (do some wrapping)
			let returnValue = SendError(
				cType: nativeCallResult, instantiationContext: "SendError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new GetNodeIdFailed-variant SendError
		public class func initWithGetNodeIdFailed() -> SendError {
			// native call variable prep


			// native method call
			let nativeCallResult = SendError_get_node_id_failed()

			// cleanup


			// return value (do some wrapping)
			let returnValue = SendError(
				cType: nativeCallResult, instantiationContext: "SendError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new BlindedPathAdvanceFailed-variant SendError
		public class func initWithBlindedPathAdvanceFailed() -> SendError {
			// native call variable prep


			// native method call
			let nativeCallResult = SendError_blinded_path_advance_failed()

			// cleanup


			// return value (do some wrapping)
			let returnValue = SendError(
				cType: nativeCallResult, instantiationContext: "SendError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two SendErrors contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: SendError, b: SendError) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKSendError>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKSendError>) in
						SendError_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func getValueAsSecp256k1() -> Secp256k1Error? {
			if self.cType?.tag != LDKSendError_Secp256k1 {
				return nil
			}

			return Secp256k1Error(value: self.cType!.secp256k1)
		}

		public func getValueAsInvalidFirstHop() -> [UInt8]? {
			if self.cType?.tag != LDKSendError_InvalidFirstHop {
				return nil
			}

			return PublicKey(
				cType: self.cType!.invalid_first_hop, instantiationContext: "SendError.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()
		}


		internal func danglingClone() -> SendError {
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
					Bindings.print("Freeing SendError \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing SendError \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
