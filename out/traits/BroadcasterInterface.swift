// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// An interface to send a transaction to the Bitcoin network.
public typealias BroadcasterInterface = Bindings.BroadcasterInterface

extension Bindings {

	/// An interface to send a transaction to the Bitcoin network.
	open class BroadcasterInterface: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKBroadcasterInterface?

		internal init(cType: LDKBroadcasterInterface, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKBroadcasterInterface, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKBroadcasterInterface, instantiationContext: String, anchor: NativeTypeWrapper,
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
					instantiationContext: "BroadcasterInterface.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func broadcastTransactionLambda(this_arg: UnsafeRawPointer?, tx: LDKTransaction) {
				let instance: BroadcasterInterface = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "BroadcasterInterface::broadcastTransactionLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.broadcastTransaction(
					tx: Transaction(
						cType: tx, instantiationContext: "BroadcasterInterface.swift::init()::\(#function):\(#line)"
					)
					.getValue())

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: BroadcasterInterface = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "BroadcasterInterface::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKBroadcasterInterface(
				this_arg: thisArg,
				broadcast_transaction: broadcastTransactionLambda,
				free: freeLambda
			)
		}


		/// Sends a transaction out to (hopefully) be mined.
		open func broadcastTransaction(tx: [UInt8]) {

			Bindings.print(
				"Error: BroadcasterInterface::broadcastTransaction MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return  // the semicolon is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: BroadcasterInterface::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}


		internal func dangle(_ shouldDangle: Bool = true) -> BroadcasterInterface {
			self.dangling = shouldDangle
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing BroadcasterInterface \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing BroadcasterInterface \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}
	}

	internal class NativelyImplementedBroadcasterInterface: BroadcasterInterface {

		/// Sends a transaction out to (hopefully) be mined.
		public override func broadcastTransaction(tx: [UInt8]) {
			// native call variable prep

			let txPrimitiveWrapper = Transaction(
				value: tx, instantiationContext: "BroadcasterInterface.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = self.cType!.broadcast_transaction(self.cType!.this_arg, txPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			txPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult

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
