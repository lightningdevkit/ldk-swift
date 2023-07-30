// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// A trait indicating an object may generate onion messages to send
public typealias OnionMessageProvider = Bindings.OnionMessageProvider

extension Bindings {

	/// A trait indicating an object may generate onion messages to send
	open class OnionMessageProvider: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKOnionMessageProvider?

		internal init(cType: LDKOnionMessageProvider, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKOnionMessageProvider, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKOnionMessageProvider, instantiationContext: String, anchor: NativeTypeWrapper,
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
					instantiationContext: "OnionMessageProvider.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func nextOnionMessageForPeerLambda(this_arg: UnsafeRawPointer?, peer_node_id: LDKPublicKey)
				-> LDKOnionMessage
			{
				let instance: OnionMessageProvider = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "OnionMessageProvider::nextOnionMessageForPeerLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.nextOnionMessageForPeer(
					peerNodeId: PublicKey(
						cType: peer_node_id,
						instantiationContext: "OnionMessageProvider.swift::init()::\(#function):\(#line)"
					)
					.getValue())

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.danglingClone().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: OnionMessageProvider = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "OnionMessageProvider::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKOnionMessageProvider(
				this_arg: thisArg,
				next_onion_message_for_peer: nextOnionMessageForPeerLambda,
				free: freeLambda
			)
		}


		/// Gets the next pending onion message for the peer with the given node id.
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		open func nextOnionMessageForPeer(peerNodeId: [UInt8]) -> OnionMessage {

			Bindings.print(
				"Error: OnionMessageProvider::nextOnionMessageForPeer MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return  // the semicolon is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: OnionMessageProvider::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
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
						"Freeing OnionMessageProvider \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing OnionMessageProvider \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}
	}

	internal class NativelyImplementedOnionMessageProvider: OnionMessageProvider {

		/// Gets the next pending onion message for the peer with the given node id.
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public override func nextOnionMessageForPeer(peerNodeId: [UInt8]) -> OnionMessage {
			// native call variable prep

			let peerNodeIdPrimitiveWrapper = PublicKey(
				value: peerNodeId, instantiationContext: "OnionMessageProvider.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = self.cType!
				.next_onion_message_for_peer(self.cType!.this_arg, peerNodeIdPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			peerNodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = OnionMessage(
				cType: nativeCallResult, instantiationContext: "OnionMessageProvider.swift::\(#function):\(#line)")

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
