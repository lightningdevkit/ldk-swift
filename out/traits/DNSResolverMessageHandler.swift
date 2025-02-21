// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// A handler for an [`OnionMessage`] containing a DNS(SEC) query or a DNSSEC proof
///
/// [`OnionMessage`]: crate::ln::msgs::OnionMessage
public typealias DNSResolverMessageHandler = Bindings.DNSResolverMessageHandler

extension Bindings {

	/// A handler for an [`OnionMessage`] containing a DNS(SEC) query or a DNSSEC proof
	///
	/// [`OnionMessage`]: crate::ln::msgs::OnionMessage
	open class DNSResolverMessageHandler: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKDNSResolverMessageHandler?

		internal init(cType: LDKDNSResolverMessageHandler, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKDNSResolverMessageHandler, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKDNSResolverMessageHandler, instantiationContext: String, anchor: NativeTypeWrapper,
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
					instantiationContext: "DNSResolverMessageHandler.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func handleDnssecQueryLambda(this_arg: UnsafeRawPointer?, message: LDKDNSSECQuery, responder: LDKResponder)
				-> LDKCOption_C2Tuple_DNSResolverMessageResponseInstructionZZ
			{
				let instance: DNSResolverMessageHandler = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "DNSResolverMessageHandler::handleDnssecQueryLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.handleDnssecQuery(
					message: DNSSECQuery(
						cType: message,
						instantiationContext: "DNSResolverMessageHandler.swift::init()::\(#function):\(#line)"),
					responder: Responder(
						cType: responder,
						instantiationContext: "DNSResolverMessageHandler.swift::init()::\(#function):\(#line)"))

				// cleanup


				// return value (do some wrapping)
				let returnValue = Option_C2Tuple_DNSResolverMessageResponseInstructionZZ(
					some: swiftCallbackResult,
					instantiationContext: "DNSResolverMessageHandler.swift::init()::\(#function):\(#line)"
				)
				.danglingClone().cType!

				return returnValue
			}

			func handleDnssecProofLambda(
				this_arg: UnsafeRawPointer?, message: LDKDNSSECProof, context: LDKDNSResolverContext
			) {
				let instance: DNSResolverMessageHandler = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "DNSResolverMessageHandler::handleDnssecProofLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.handleDnssecProof(
					message: DNSSECProof(
						cType: message,
						instantiationContext: "DNSResolverMessageHandler.swift::init()::\(#function):\(#line)"),
					context: DNSResolverContext(
						cType: context,
						instantiationContext: "DNSResolverMessageHandler.swift::init()::\(#function):\(#line)"))

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}

			func providedNodeFeaturesLambda(this_arg: UnsafeRawPointer?) -> LDKNodeFeatures {
				let instance: DNSResolverMessageHandler = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "DNSResolverMessageHandler::providedNodeFeaturesLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.providedNodeFeatures()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.danglingClone().cType!

				return returnValue
			}

			func releasePendingMessagesLambda(this_arg: UnsafeRawPointer?)
				-> LDKCVec_C2Tuple_DNSResolverMessageMessageSendInstructionsZZ
			{
				let instance: DNSResolverMessageHandler = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "DNSResolverMessageHandler::releasePendingMessagesLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.releasePendingMessages()

				// cleanup


				// return value (do some wrapping)
				let returnValue = Vec_C2Tuple_DNSResolverMessageMessageSendInstructionsZZ(
					array: swiftCallbackResult,
					instantiationContext: "DNSResolverMessageHandler.swift::init()::\(#function):\(#line)"
				)
				.dangleRecursively().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: DNSResolverMessageHandler = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "DNSResolverMessageHandler::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKDNSResolverMessageHandler(
				this_arg: thisArg,
				handle_dnssec_query: handleDnssecQueryLambda,
				handle_dnssec_proof: handleDnssecProofLambda,
				provided_node_features: providedNodeFeaturesLambda,
				release_pending_messages: releasePendingMessagesLambda,
				free: freeLambda
			)
		}


		/// Handle a [`DNSSECQuery`] message.
		///
		/// If we provide DNS resolution services to third parties, we should respond with a
		/// [`DNSSECProof`] message.
		///
		/// Note that responder (or a relevant inner pointer) may be NULL or all-0s to represent None
		open func handleDnssecQuery(message: DNSSECQuery, responder: Responder) -> (
			DNSResolverMessage, ResponseInstruction
		)? {

			Bindings.print(
				"Error: DNSResolverMessageHandler::handleDnssecQuery MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Handle a [`DNSSECProof`] message (in response to a [`DNSSECQuery`] we presumably sent).
		///
		/// With this, we should be able to validate the DNS record we requested.
		open func handleDnssecProof(message: DNSSECProof, context: DNSResolverContext) {

			Bindings.print(
				"Error: DNSResolverMessageHandler::handleDnssecProof MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Gets the node feature flags which this handler itself supports. Useful for setting the
		/// `dns_resolver` flag if this handler supports returning [`DNSSECProof`] messages in response
		/// to [`DNSSECQuery`] messages.
		open func providedNodeFeatures() -> NodeFeatures {

			Bindings.print(
				"Error: DNSResolverMessageHandler::providedNodeFeatures MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Release any [`DNSResolverMessage`]s that need to be sent.
		open func releasePendingMessages() -> [(DNSResolverMessage, MessageSendInstructions)] {

			Bindings.print(
				"Error: DNSResolverMessageHandler::releasePendingMessages MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return ()  // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: DNSResolverMessageHandler::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
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
						"Freeing DNSResolverMessageHandler \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing DNSResolverMessageHandler \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}
	}

	internal class NativelyImplementedDNSResolverMessageHandler: DNSResolverMessageHandler {

		/// Handle a [`DNSSECQuery`] message.
		///
		/// If we provide DNS resolution services to third parties, we should respond with a
		/// [`DNSSECProof`] message.
		///
		/// Note that responder (or a relevant inner pointer) may be NULL or all-0s to represent None
		public override func handleDnssecQuery(message: DNSSECQuery, responder: Responder) -> (
			DNSResolverMessage, ResponseInstruction
		)? {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!
				.handle_dnssec_query(
					self.cType!.this_arg, message.dynamicallyDangledClone().cType!,
					responder.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_C2Tuple_DNSResolverMessageResponseInstructionZZ(
				cType: nativeCallResult, instantiationContext: "DNSResolverMessageHandler.swift::\(#function):\(#line)"
			)
			.getValue()

			return returnValue
		}

		/// Handle a [`DNSSECProof`] message (in response to a [`DNSSECQuery`] we presumably sent).
		///
		/// With this, we should be able to validate the DNS record we requested.
		public override func handleDnssecProof(message: DNSSECProof, context: DNSResolverContext) {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!
				.handle_dnssec_proof(
					self.cType!.this_arg, message.dynamicallyDangledClone().cType!,
					context.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult

			return returnValue
		}

		/// Gets the node feature flags which this handler itself supports. Useful for setting the
		/// `dns_resolver` flag if this handler supports returning [`DNSSECProof`] messages in response
		/// to [`DNSSECQuery`] messages.
		public override func providedNodeFeatures() -> NodeFeatures {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.provided_node_features(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = NodeFeatures(
				cType: nativeCallResult, instantiationContext: "DNSResolverMessageHandler.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Release any [`DNSResolverMessage`]s that need to be sent.
		public override func releasePendingMessages() -> [(DNSResolverMessage, MessageSendInstructions)] {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.release_pending_messages(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_C2Tuple_DNSResolverMessageMessageSendInstructionsZZ(
				cType: nativeCallResult, instantiationContext: "DNSResolverMessageHandler.swift::\(#function):\(#line)"
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
