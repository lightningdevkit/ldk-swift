// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// A handler for an [`OnionMessage`] containing a BOLT 12 Offers message as its payload.
///
/// [`OnionMessage`]: crate::ln::msgs::OnionMessage
public typealias OffersMessageHandler = Bindings.OffersMessageHandler

extension Bindings {

	/// A handler for an [`OnionMessage`] containing a BOLT 12 Offers message as its payload.
	///
	/// [`OnionMessage`]: crate::ln::msgs::OnionMessage
	open class OffersMessageHandler: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKOffersMessageHandler?

		internal init(cType: LDKOffersMessageHandler, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKOffersMessageHandler, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKOffersMessageHandler, instantiationContext: String, anchor: NativeTypeWrapper,
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
					instantiationContext: "OffersMessageHandler.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func handleMessageLambda(this_arg: UnsafeRawPointer?, message: LDKOffersMessage)
				-> LDKCOption_OffersMessageZ
			{
				let instance: OffersMessageHandler = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "OffersMessageHandler::handleMessageLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.handleMessage(
					message: OffersMessage(
						cType: message,
						instantiationContext: "OffersMessageHandler.swift::init()::\(#function):\(#line)"))

				// cleanup


				// return value (do some wrapping)
				let returnValue = Option_OffersMessageZ(
					some: swiftCallbackResult,
					instantiationContext: "OffersMessageHandler.swift::init()::\(#function):\(#line)"
				)
				.danglingClone().cType!

				return returnValue
			}

			func releasePendingMessagesLambda(this_arg: UnsafeRawPointer?)
				-> LDKCVec_C3Tuple_OffersMessageDestinationBlindedPathZZ
			{
				let instance: OffersMessageHandler = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "OffersMessageHandler::releasePendingMessagesLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.releasePendingMessages()

				// cleanup


				// return value (do some wrapping)
				let returnValue = Vec_C3Tuple_OffersMessageDestinationBlindedPathZZ(
					array: swiftCallbackResult,
					instantiationContext: "OffersMessageHandler.swift::init()::\(#function):\(#line)"
				)
				.dangleRecursively().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: OffersMessageHandler = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "OffersMessageHandler::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKOffersMessageHandler(
				this_arg: thisArg,
				handle_message: handleMessageLambda,
				release_pending_messages: releasePendingMessagesLambda,
				free: freeLambda
			)
		}


		/// Handles the given message by either responding with an [`Bolt12Invoice`], sending a payment,
		/// or replying with an error.
		///
		/// The returned [`OffersMessage`], if any, is enqueued to be sent by [`OnionMessenger`].
		///
		/// [`OnionMessenger`]: crate::onion_message::OnionMessenger
		open func handleMessage(message: OffersMessage) -> OffersMessage? {

			Bindings.print(
				"Error: OffersMessageHandler::handleMessage MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Releases any [`OffersMessage`]s that need to be sent.
		///
		/// Typically, this is used for messages initiating a payment flow rather than in response to
		/// another message. The latter should use the return value of [`Self::handle_message`].
		open func releasePendingMessages() -> [(OffersMessage, Destination, BlindedPath)] {

			Bindings.print(
				"Error: OffersMessageHandler::releasePendingMessages MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return ()  // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: OffersMessageHandler::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
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
						"Freeing OffersMessageHandler \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing OffersMessageHandler \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}
	}

	internal class NativelyImplementedOffersMessageHandler: OffersMessageHandler {

		/// Handles the given message by either responding with an [`Bolt12Invoice`], sending a payment,
		/// or replying with an error.
		///
		/// The returned [`OffersMessage`], if any, is enqueued to be sent by [`OnionMessenger`].
		///
		/// [`OnionMessenger`]: crate::onion_message::OnionMessenger
		public override func handleMessage(message: OffersMessage) -> OffersMessage? {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.handle_message(self.cType!.this_arg, message.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_OffersMessageZ(
				cType: nativeCallResult, instantiationContext: "OffersMessageHandler.swift::\(#function):\(#line)"
			)
			.getValue()

			return returnValue
		}

		/// Releases any [`OffersMessage`]s that need to be sent.
		///
		/// Typically, this is used for messages initiating a payment flow rather than in response to
		/// another message. The latter should use the return value of [`Self::handle_message`].
		public override func releasePendingMessages() -> [(OffersMessage, Destination, BlindedPath)] {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.release_pending_messages(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_C3Tuple_OffersMessageDestinationBlindedPathZZ(
				cType: nativeCallResult, instantiationContext: "OffersMessageHandler.swift::\(#function):\(#line)"
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
