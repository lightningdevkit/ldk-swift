// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// A handler provided to [`PeerManager`] for reading and handling custom messages.
///
/// [BOLT 1] specifies a custom message type range for use with experimental or application-specific
/// messages. `CustomMessageHandler` allows for user-defined handling of such types. See the
/// [`lightning_custom_message`] crate for tools useful in composing more than one custom handler.
///
/// [BOLT 1]: https://github.com/lightning/bolts/blob/master/01-messaging.md
/// [`lightning_custom_message`]: https://docs.rs/lightning_custom_message/latest/lightning_custom_message
public typealias CustomMessageHandler = Bindings.CustomMessageHandler

extension Bindings {

	/// A handler provided to [`PeerManager`] for reading and handling custom messages.
	///
	/// [BOLT 1] specifies a custom message type range for use with experimental or application-specific
	/// messages. `CustomMessageHandler` allows for user-defined handling of such types. See the
	/// [`lightning_custom_message`] crate for tools useful in composing more than one custom handler.
	///
	/// [BOLT 1]: https://github.com/lightning/bolts/blob/master/01-messaging.md
	/// [`lightning_custom_message`]: https://docs.rs/lightning_custom_message/latest/lightning_custom_message
	open class CustomMessageHandler: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCustomMessageHandler?

		internal init(cType: LDKCustomMessageHandler, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKCustomMessageHandler, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCustomMessageHandler, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public init(customMessageReader: CustomMessageReader) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "CustomMessageHandler.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func handleCustomMessageLambda(this_arg: UnsafeRawPointer?, msg: LDKType, sender_node_id: LDKPublicKey)
				-> LDKCResult_NoneLightningErrorZ
			{
				let instance: CustomMessageHandler = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "CustomMessageHandler::handleCustomMessageLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.handleCustomMessage(
					msg: NativelyImplementedBindingsType(
						cType: msg, instantiationContext: "CustomMessageHandler.swift::init()::\(#function):\(#line)"),
					senderNodeId: PublicKey(
						cType: sender_node_id,
						instantiationContext: "CustomMessageHandler.swift::init()::\(#function):\(#line)"
					)
					.getValue())

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.danglingClone().cType!

				return returnValue
			}

			func getAndClearPendingMsgLambda(this_arg: UnsafeRawPointer?) -> LDKCVec_C2Tuple_PublicKeyTypeZZ {
				let instance: CustomMessageHandler = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "CustomMessageHandler::getAndClearPendingMsgLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.getAndClearPendingMsg()

				// cleanup


				// return value (do some wrapping)
				let returnValue = Vec_C2Tuple_PublicKeyTypeZZ(
					array: swiftCallbackResult,
					instantiationContext: "CustomMessageHandler.swift::init()::\(#function):\(#line)"
				)
				.dangleRecursively().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: CustomMessageHandler = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "CustomMessageHandler::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKCustomMessageHandler(
				this_arg: thisArg,
				handle_custom_message: handleCustomMessageLambda,
				get_and_clear_pending_msg: getAndClearPendingMsgLambda,
				CustomMessageReader: customMessageReader.activate().cType!,
				free: freeLambda
			)
		}


		/// Handles the given message sent from `sender_node_id`, possibly producing messages for
		/// [`CustomMessageHandler::get_and_clear_pending_msg`] to return and thus for [`PeerManager`]
		/// to send.
		open func handleCustomMessage(msg: BindingsType, senderNodeId: [UInt8]) -> Result_NoneLightningErrorZ {

			Bindings.print(
				"Error: CustomMessageHandler::handleCustomMessage MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Returns the list of pending messages that were generated by the handler, clearing the list
		/// in the process. Each message is paired with the node id of the intended recipient. If no
		/// connection to the node exists, then the message is simply not sent.
		open func getAndClearPendingMsg() -> [([UInt8], BindingsType)] {

			Bindings.print(
				"Error: CustomMessageHandler::getAndClearPendingMsg MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return  // the semicolon is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: CustomMessageHandler::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}


		/// Implementation of CustomMessageReader for this object.
		public func getCustomMessageReader() -> CustomMessageReader {
			// return value (do some wrapping)
			let returnValue = NativelyImplementedCustomMessageReader(
				cType: self.cType!.CustomMessageReader,
				instantiationContext: "CustomMessageHandler.swift::\(#function):\(#line)", anchor: self)

			return returnValue
		}


		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing CustomMessageHandler \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing CustomMessageHandler \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}
	}

	internal class NativelyImplementedCustomMessageHandler: CustomMessageHandler {

		/// Handles the given message sent from `sender_node_id`, possibly producing messages for
		/// [`CustomMessageHandler::get_and_clear_pending_msg`] to return and thus for [`PeerManager`]
		/// to send.
		public override func handleCustomMessage(msg: BindingsType, senderNodeId: [UInt8]) -> Result_NoneLightningErrorZ
		{
			// native call variable prep

			let senderNodeIdPrimitiveWrapper = PublicKey(
				value: senderNodeId, instantiationContext: "CustomMessageHandler.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = self.cType!
				.handle_custom_message(self.cType!.this_arg, msg.activate().cType!, senderNodeIdPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			senderNodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneLightningErrorZ(
				cType: nativeCallResult, instantiationContext: "CustomMessageHandler.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Returns the list of pending messages that were generated by the handler, clearing the list
		/// in the process. Each message is paired with the node id of the intended recipient. If no
		/// connection to the node exists, then the message is simply not sent.
		public override func getAndClearPendingMsg() -> [([UInt8], BindingsType)] {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.get_and_clear_pending_msg(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_C2Tuple_PublicKeyTypeZZ(
				cType: nativeCallResult, instantiationContext: "CustomMessageHandler.swift::\(#function):\(#line)"
			)
			.getValue()

			return returnValue
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		public override func free() {
			// native call variable prep


			// natively wrapped traits may not necessarily be properly initialized
			// for now just don't free these things
			// self.cType?.free(self.cType?.this_arg)
			return


			// native method call
			let nativeCallResult = self.cType!.free(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult

			return returnValue
		}

	}

}
