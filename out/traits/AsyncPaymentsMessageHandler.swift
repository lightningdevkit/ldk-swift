// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// A handler for an [`OnionMessage`] containing an async payments message as its payload.
///
/// [`OnionMessage`]: crate::ln::msgs::OnionMessage
public typealias AsyncPaymentsMessageHandler = Bindings.AsyncPaymentsMessageHandler

extension Bindings {

	/// A handler for an [`OnionMessage`] containing an async payments message as its payload.
	///
	/// [`OnionMessage`]: crate::ln::msgs::OnionMessage
	open class AsyncPaymentsMessageHandler: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKAsyncPaymentsMessageHandler?

		internal init(cType: LDKAsyncPaymentsMessageHandler, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKAsyncPaymentsMessageHandler, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKAsyncPaymentsMessageHandler, instantiationContext: String, anchor: NativeTypeWrapper,
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
					instantiationContext: "AsyncPaymentsMessageHandler.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func heldHtlcAvailableLambda(
				this_arg: UnsafeRawPointer?, message: LDKHeldHtlcAvailable, responder: LDKResponder
			) -> LDKCOption_C2Tuple_ReleaseHeldHtlcResponseInstructionZZ {
				let instance: AsyncPaymentsMessageHandler = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "AsyncPaymentsMessageHandler::heldHtlcAvailableLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.heldHtlcAvailable(
					message: HeldHtlcAvailable(
						cType: message,
						instantiationContext: "AsyncPaymentsMessageHandler.swift::init()::\(#function):\(#line)"),
					responder: Responder(
						cType: responder,
						instantiationContext: "AsyncPaymentsMessageHandler.swift::init()::\(#function):\(#line)"))

				// cleanup


				// return value (do some wrapping)
				let returnValue = Option_C2Tuple_ReleaseHeldHtlcResponseInstructionZZ(
					some: swiftCallbackResult,
					instantiationContext: "AsyncPaymentsMessageHandler.swift::init()::\(#function):\(#line)"
				)
				.danglingClone().cType!

				return returnValue
			}

			func releaseHeldHtlcLambda(this_arg: UnsafeRawPointer?, message: LDKReleaseHeldHtlc) {
				let instance: AsyncPaymentsMessageHandler = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "AsyncPaymentsMessageHandler::releaseHeldHtlcLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.releaseHeldHtlc(
					message: ReleaseHeldHtlc(
						cType: message,
						instantiationContext: "AsyncPaymentsMessageHandler.swift::init()::\(#function):\(#line)"))

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}

			func releasePendingMessagesLambda(this_arg: UnsafeRawPointer?)
				-> LDKCVec_C2Tuple_AsyncPaymentsMessageMessageSendInstructionsZZ
			{
				let instance: AsyncPaymentsMessageHandler = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "AsyncPaymentsMessageHandler::releasePendingMessagesLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.releasePendingMessages()

				// cleanup


				// return value (do some wrapping)
				let returnValue = Vec_C2Tuple_AsyncPaymentsMessageMessageSendInstructionsZZ(
					array: swiftCallbackResult,
					instantiationContext: "AsyncPaymentsMessageHandler.swift::init()::\(#function):\(#line)"
				)
				.dangleRecursively().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: AsyncPaymentsMessageHandler = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "AsyncPaymentsMessageHandler::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKAsyncPaymentsMessageHandler(
				this_arg: thisArg,
				held_htlc_available: heldHtlcAvailableLambda,
				release_held_htlc: releaseHeldHtlcLambda,
				release_pending_messages: releasePendingMessagesLambda,
				free: freeLambda
			)
		}


		/// Handle a [`HeldHtlcAvailable`] message. A [`ReleaseHeldHtlc`] should be returned to release
		/// the held funds.
		///
		/// Note that responder (or a relevant inner pointer) may be NULL or all-0s to represent None
		open func heldHtlcAvailable(message: HeldHtlcAvailable, responder: Responder) -> (
			ReleaseHeldHtlc, ResponseInstruction
		)? {

			Bindings.print(
				"Error: AsyncPaymentsMessageHandler::heldHtlcAvailable MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Handle a [`ReleaseHeldHtlc`] message. If authentication of the message succeeds, an HTLC
		/// should be released to the corresponding payee.
		open func releaseHeldHtlc(message: ReleaseHeldHtlc) {

			Bindings.print(
				"Error: AsyncPaymentsMessageHandler::releaseHeldHtlc MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Release any [`AsyncPaymentsMessage`]s that need to be sent.
		///
		/// Typically, this is used for messages initiating an async payment flow rather than in response
		/// to another message.
		open func releasePendingMessages() -> [(AsyncPaymentsMessage, MessageSendInstructions)] {

			Bindings.print(
				"Error: AsyncPaymentsMessageHandler::releasePendingMessages MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return ()  // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: AsyncPaymentsMessageHandler::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
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
						"Freeing AsyncPaymentsMessageHandler \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing AsyncPaymentsMessageHandler \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}
	}

	internal class NativelyImplementedAsyncPaymentsMessageHandler: AsyncPaymentsMessageHandler {

		/// Handle a [`HeldHtlcAvailable`] message. A [`ReleaseHeldHtlc`] should be returned to release
		/// the held funds.
		///
		/// Note that responder (or a relevant inner pointer) may be NULL or all-0s to represent None
		public override func heldHtlcAvailable(message: HeldHtlcAvailable, responder: Responder) -> (
			ReleaseHeldHtlc, ResponseInstruction
		)? {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!
				.held_htlc_available(
					self.cType!.this_arg, message.dynamicallyDangledClone().cType!,
					responder.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_C2Tuple_ReleaseHeldHtlcResponseInstructionZZ(
				cType: nativeCallResult,
				instantiationContext: "AsyncPaymentsMessageHandler.swift::\(#function):\(#line)"
			)
			.getValue()

			return returnValue
		}

		/// Handle a [`ReleaseHeldHtlc`] message. If authentication of the message succeeds, an HTLC
		/// should be released to the corresponding payee.
		public override func releaseHeldHtlc(message: ReleaseHeldHtlc) {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!
				.release_held_htlc(self.cType!.this_arg, message.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult

			return returnValue
		}

		/// Release any [`AsyncPaymentsMessage`]s that need to be sent.
		///
		/// Typically, this is used for messages initiating an async payment flow rather than in response
		/// to another message.
		public override func releasePendingMessages() -> [(AsyncPaymentsMessage, MessageSendInstructions)] {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.release_pending_messages(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_C2Tuple_AsyncPaymentsMessageMessageSendInstructionsZZ(
				cType: nativeCallResult,
				instantiationContext: "AsyncPaymentsMessageHandler.swift::\(#function):\(#line)"
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
