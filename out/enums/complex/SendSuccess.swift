import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias SendSuccess = Bindings.SendSuccess

extension Bindings {

	/// Result of successfully [sending an onion message].
	///
	/// [sending an onion message]: OnionMessenger::send_onion_message
	public class SendSuccess: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKSendSuccess?

		internal init(cType: LDKSendSuccess, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKSendSuccess, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKSendSuccess, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum SendSuccessType {

			/// The message was buffered and will be sent once it is processed by
			/// [`OnionMessageHandler::next_onion_message_for_peer`].
			case Buffered

			/// The message was buffered and will be sent once the node is connected as a peer and it is
			/// processed by [`OnionMessageHandler::next_onion_message_for_peer`].
			case BufferedAwaitingConnection

		}

		public func getValueType() -> SendSuccessType {
			switch self.cType!.tag {
				case LDKSendSuccess_Buffered:
					return .Buffered

				case LDKSendSuccess_BufferedAwaitingConnection:
					return .BufferedAwaitingConnection

				default:
					Bindings.print("Error: Invalid value type for SendSuccess! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the SendSuccess
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = SendSuccess_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the SendSuccess
		internal func clone() -> SendSuccess {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKSendSuccess>) in
					SendSuccess_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = SendSuccess(
				cType: nativeCallResult, instantiationContext: "SendSuccess.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Buffered-variant SendSuccess
		public class func initWithBuffered() -> SendSuccess {
			// native call variable prep


			// native method call
			let nativeCallResult = SendSuccess_buffered()

			// cleanup


			// return value (do some wrapping)
			let returnValue = SendSuccess(
				cType: nativeCallResult, instantiationContext: "SendSuccess.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new BufferedAwaitingConnection-variant SendSuccess
		public class func initWithBufferedAwaitingConnection(a: [UInt8]) -> SendSuccess {
			// native call variable prep

			let aPrimitiveWrapper = PublicKey(
				value: a, instantiationContext: "SendSuccess.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = SendSuccess_buffered_awaiting_connection(aPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			aPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = SendSuccess(
				cType: nativeCallResult, instantiationContext: "SendSuccess.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two SendSuccesss contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: SendSuccess, b: SendSuccess) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKSendSuccess>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKSendSuccess>) in
						SendSuccess_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func getValueAsBufferedAwaitingConnection() -> [UInt8]? {
			if self.cType?.tag != LDKSendSuccess_BufferedAwaitingConnection {
				return nil
			}

			return PublicKey(
				cType: self.cType!.buffered_awaiting_connection,
				instantiationContext: "SendSuccess.swift::\(#function):\(#line)", anchor: self
			)
			.getValue()
		}


		internal func danglingClone() -> SendSuccess {
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
					Bindings.print("Freeing SendSuccess \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing SendSuccess \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
