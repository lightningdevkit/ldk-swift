// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// A trait defining behavior for routing an [`OnionMessage`].
public typealias MessageRouter = Bindings.MessageRouter

extension Bindings {

	/// A trait defining behavior for routing an [`OnionMessage`].
	open class MessageRouter: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKMessageRouter?

		internal init(cType: LDKMessageRouter, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKMessageRouter, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKMessageRouter, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
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
					conflictAvoidingVariableName: 0, instantiationContext: "MessageRouter.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func findPathLambda(
				this_arg: UnsafeRawPointer?, sender: LDKPublicKey, peers: LDKCVec_PublicKeyZ,
				destination: LDKDestination
			) -> LDKCResult_OnionMessagePathNoneZ {
				let instance: MessageRouter = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "MessageRouter::findPathLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.findPath(
					sender: PublicKey(
						cType: sender, instantiationContext: "MessageRouter.swift::init()::\(#function):\(#line)"
					)
					.getValue(),
					peers: Vec_PublicKeyZ(
						cType: peers, instantiationContext: "MessageRouter.swift::init()::\(#function):\(#line)"
					)
					.getValue(),
					destination: Destination(
						cType: destination, instantiationContext: "MessageRouter.swift::init()::\(#function):\(#line)"))

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.danglingClone().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: MessageRouter = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "MessageRouter::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKMessageRouter(
				this_arg: thisArg,
				find_path: findPathLambda,
				free: freeLambda
			)
		}


		/// Returns a route for sending an [`OnionMessage`] to the given [`Destination`].
		open func findPath(sender: [UInt8], peers: [[UInt8]], destination: Destination) -> Result_OnionMessagePathNoneZ
		{

			Bindings.print(
				"Error: MessageRouter::findPath MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return ()  // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: MessageRouter::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
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
						"Freeing MessageRouter \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing MessageRouter \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}
	}

	internal class NativelyImplementedMessageRouter: MessageRouter {

		/// Returns a route for sending an [`OnionMessage`] to the given [`Destination`].
		public override func findPath(sender: [UInt8], peers: [[UInt8]], destination: Destination)
			-> Result_OnionMessagePathNoneZ
		{
			// native call variable prep

			let senderPrimitiveWrapper = PublicKey(
				value: sender, instantiationContext: "MessageRouter.swift::\(#function):\(#line)")

			let peersVector = Vec_PublicKeyZ(
				array: peers, instantiationContext: "MessageRouter.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = self.cType!
				.find_path(
					self.cType!.this_arg, senderPrimitiveWrapper.cType!, peersVector.cType!,
					destination.danglingClone().cType!)

			// cleanup

			// for elided types, we need this
			senderPrimitiveWrapper.noOpRetain()

			// peersVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_OnionMessagePathNoneZ(
				cType: nativeCallResult, instantiationContext: "MessageRouter.swift::\(#function):\(#line)")

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
