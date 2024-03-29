// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// Handler for custom onion messages. If you are using [`SimpleArcOnionMessenger`],
/// [`SimpleRefOnionMessenger`], or prefer to ignore inbound custom onion messages,
/// [`IgnoringMessageHandler`] must be provided to [`OnionMessenger::new`]. Otherwise, a custom
/// implementation of this trait must be provided, with [`CustomMessage`] specifying the supported
/// message types.
///
/// See [`OnionMessenger`] for example usage.
///
/// [`IgnoringMessageHandler`]: crate::ln::peer_handler::IgnoringMessageHandler
/// [`CustomMessage`]: Self::CustomMessage
public typealias CustomOnionMessageHandler = Bindings.CustomOnionMessageHandler

extension Bindings {

	/// Handler for custom onion messages. If you are using [`SimpleArcOnionMessenger`],
	/// [`SimpleRefOnionMessenger`], or prefer to ignore inbound custom onion messages,
	/// [`IgnoringMessageHandler`] must be provided to [`OnionMessenger::new`]. Otherwise, a custom
	/// implementation of this trait must be provided, with [`CustomMessage`] specifying the supported
	/// message types.
	///
	/// See [`OnionMessenger`] for example usage.
	///
	/// [`IgnoringMessageHandler`]: crate::ln::peer_handler::IgnoringMessageHandler
	/// [`CustomMessage`]: Self::CustomMessage
	open class CustomOnionMessageHandler: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCustomOnionMessageHandler?

		internal init(cType: LDKCustomOnionMessageHandler, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKCustomOnionMessageHandler, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCustomOnionMessageHandler, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "CustomOnionMessageHandler.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func handleCustomMessageLambda(this_arg: UnsafeRawPointer?, msg: LDKOnionMessageContents)
				-> LDKCOption_OnionMessageContentsZ
			{
				let instance: CustomOnionMessageHandler = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "CustomOnionMessageHandler::handleCustomMessageLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.handleCustomMessage(
					msg: NativelyImplementedOnionMessageContents(
						cType: msg,
						instantiationContext: "CustomOnionMessageHandler.swift::init()::\(#function):\(#line)"))

				// cleanup


				// return value (do some wrapping)
				let returnValue = Option_OnionMessageContentsZ(
					some: swiftCallbackResult,
					instantiationContext: "CustomOnionMessageHandler.swift::init()::\(#function):\(#line)"
				)
				.danglingClone().cType!

				return returnValue
			}

			func readCustomMessageLambda(this_arg: UnsafeRawPointer?, message_type: UInt64, buffer: LDKu8slice)
				-> LDKCResult_COption_OnionMessageContentsZDecodeErrorZ
			{
				let instance: CustomOnionMessageHandler = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "CustomOnionMessageHandler::readCustomMessageLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.readCustomMessage(
					messageType: message_type,
					buffer: u8slice(
						cType: buffer,
						instantiationContext: "CustomOnionMessageHandler.swift::init()::\(#function):\(#line)"
					)
					.dangle().getValue())

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.danglingClone().cType!

				return returnValue
			}

			func releasePendingCustomMessagesLambda(this_arg: UnsafeRawPointer?)
				-> LDKCVec_C3Tuple_OnionMessageContentsDestinationBlindedPathZZ
			{
				let instance: CustomOnionMessageHandler = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "CustomOnionMessageHandler::releasePendingCustomMessagesLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.releasePendingCustomMessages()

				// cleanup


				// return value (do some wrapping)
				let returnValue = Vec_C3Tuple_OnionMessageContentsDestinationBlindedPathZZ(
					array: swiftCallbackResult,
					instantiationContext: "CustomOnionMessageHandler.swift::init()::\(#function):\(#line)"
				)
				.dangleRecursively().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: CustomOnionMessageHandler = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "CustomOnionMessageHandler::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKCustomOnionMessageHandler(
				this_arg: thisArg,
				handle_custom_message: handleCustomMessageLambda,
				read_custom_message: readCustomMessageLambda,
				release_pending_custom_messages: releasePendingCustomMessagesLambda,
				free: freeLambda
			)
		}


		/// Called with the custom message that was received, returning a response to send, if any.
		///
		/// The returned [`Self::CustomMessage`], if any, is enqueued to be sent by [`OnionMessenger`].
		open func handleCustomMessage(msg: OnionMessageContents) -> OnionMessageContents? {

			Bindings.print(
				"Error: CustomOnionMessageHandler::handleCustomMessage MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Read a custom message of type `message_type` from `buffer`, returning `Ok(None)` if the
		/// message type is unknown.
		open func readCustomMessage(messageType: UInt64, buffer: [UInt8])
			-> Result_COption_OnionMessageContentsZDecodeErrorZ
		{

			Bindings.print(
				"Error: CustomOnionMessageHandler::readCustomMessage MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Releases any [`Self::CustomMessage`]s that need to be sent.
		///
		/// Typically, this is used for messages initiating a message flow rather than in response to
		/// another message. The latter should use the return value of [`Self::handle_custom_message`].
		open func releasePendingCustomMessages() -> [(OnionMessageContents, Destination, BlindedPath)] {

			Bindings.print(
				"Error: CustomOnionMessageHandler::releasePendingCustomMessages MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return ()  // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: CustomOnionMessageHandler::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}


		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing CustomOnionMessageHandler \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing CustomOnionMessageHandler \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}
	}

	internal class NativelyImplementedCustomOnionMessageHandler: CustomOnionMessageHandler {

		/// Called with the custom message that was received, returning a response to send, if any.
		///
		/// The returned [`Self::CustomMessage`], if any, is enqueued to be sent by [`OnionMessenger`].
		public override func handleCustomMessage(msg: OnionMessageContents) -> OnionMessageContents? {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.handle_custom_message(self.cType!.this_arg, msg.activate().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_OnionMessageContentsZ(
				cType: nativeCallResult, instantiationContext: "CustomOnionMessageHandler.swift::\(#function):\(#line)"
			)
			.getValue()

			return returnValue
		}

		/// Read a custom message of type `message_type` from `buffer`, returning `Ok(None)` if the
		/// message type is unknown.
		public override func readCustomMessage(messageType: UInt64, buffer: [UInt8])
			-> Result_COption_OnionMessageContentsZDecodeErrorZ
		{
			// native call variable prep

			let bufferPrimitiveWrapper = u8slice(
				value: buffer, instantiationContext: "CustomOnionMessageHandler.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = self.cType!
				.read_custom_message(self.cType!.this_arg, messageType, bufferPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			bufferPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_COption_OnionMessageContentsZDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "CustomOnionMessageHandler.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Releases any [`Self::CustomMessage`]s that need to be sent.
		///
		/// Typically, this is used for messages initiating a message flow rather than in response to
		/// another message. The latter should use the return value of [`Self::handle_custom_message`].
		public override func releasePendingCustomMessages() -> [(OnionMessageContents, Destination, BlindedPath)] {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.release_pending_custom_messages(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_C3Tuple_OnionMessageContentsDestinationBlindedPathZZ(
				cType: nativeCallResult, instantiationContext: "CustomOnionMessageHandler.swift::\(#function):\(#line)"
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
