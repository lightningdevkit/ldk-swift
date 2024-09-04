import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias MessageContext = Bindings.MessageContext

extension Bindings {

	/// Additional data included by the recipient in a [`BlindedMessagePath`].
	///
	/// This data is encrypted by the recipient and will be given to the corresponding message handler
	/// when handling a message sent over the [`BlindedMessagePath`]. The recipient can use this data to
	/// authenticate the message or for further processing if needed.
	public class MessageContext: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKMessageContext?

		internal init(cType: LDKMessageContext, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKMessageContext, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKMessageContext, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum MessageContextType {

			/// Context specific to an [`OffersMessage`].
			///
			/// [`OffersMessage`]: crate::onion_message::offers::OffersMessage
			case Offers

			/// Context specific to a [`CustomOnionMessageHandler::CustomMessage`].
			///
			/// [`CustomOnionMessageHandler::CustomMessage`]: crate::onion_message::messenger::CustomOnionMessageHandler::CustomMessage
			case Custom

		}

		public func getValueType() -> MessageContextType {
			switch self.cType!.tag {
				case LDKMessageContext_Offers:
					return .Offers

				case LDKMessageContext_Custom:
					return .Custom

				default:
					Bindings.print("Error: Invalid value type for MessageContext! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the MessageContext
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = MessageContext_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the MessageContext
		internal func clone() -> MessageContext {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKMessageContext>) in
					MessageContext_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = MessageContext(
				cType: nativeCallResult, instantiationContext: "MessageContext.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Offers-variant MessageContext
		public class func initWithOffers(a: OffersContext) -> MessageContext {
			// native call variable prep


			// native method call
			let nativeCallResult = MessageContext_offers(a.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = MessageContext(
				cType: nativeCallResult, instantiationContext: "MessageContext.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Custom-variant MessageContext
		public class func initWithCustom(a: [UInt8]) -> MessageContext {
			// native call variable prep

			let aVector = Vec_u8Z(array: a, instantiationContext: "MessageContext.swift::\(#function):\(#line)")
				.dangle()


			// native method call
			let nativeCallResult = MessageContext_custom(aVector.cType!)

			// cleanup

			// aVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = MessageContext(
				cType: nativeCallResult, instantiationContext: "MessageContext.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Serialize the MessageContext object into a byte array which can be read by MessageContext_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKMessageContext>) in
					MessageContext_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "MessageContext.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a MessageContext from a byte array, created by MessageContext_write
		public class func read(ser: [UInt8]) -> Result_MessageContextDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "MessageContext.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = MessageContext_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_MessageContextDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "MessageContext.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValueAsOffers() -> OffersContext? {
			if self.cType?.tag != LDKMessageContext_Offers {
				return nil
			}

			return OffersContext(
				cType: self.cType!.offers, instantiationContext: "MessageContext.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsCustom() -> [UInt8]? {
			if self.cType?.tag != LDKMessageContext_Custom {
				return nil
			}

			return Vec_u8Z(
				cType: self.cType!.custom, instantiationContext: "MessageContext.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()
		}


		internal func danglingClone() -> MessageContext {
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
					Bindings.print(
						"Freeing MessageContext \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing MessageContext \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
