// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// A scorer that is accessed under a lock.
///
/// Needed so that calls to [`Score::channel_penalty_msat`] in [`find_route`] can be made while
/// having shared ownership of a scorer but without requiring internal locking in [`Score`]
/// implementations. Internal locking would be detrimental to route finding performance and could
/// result in [`Score::channel_penalty_msat`] returning a different value for the same channel.
///
/// [`find_route`]: crate::routing::router::find_route
public typealias LockableScore = Bindings.LockableScore

extension Bindings {

	/// A scorer that is accessed under a lock.
	///
	/// Needed so that calls to [`Score::channel_penalty_msat`] in [`find_route`] can be made while
	/// having shared ownership of a scorer but without requiring internal locking in [`Score`]
	/// implementations. Internal locking would be detrimental to route finding performance and could
	/// result in [`Score::channel_penalty_msat`] returning a different value for the same channel.
	///
	/// [`find_route`]: crate::routing::router::find_route
	open class LockableScore: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKLockableScore?

		internal init(cType: LDKLockableScore, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKLockableScore, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKLockableScore, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
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
					conflictAvoidingVariableName: 0, instantiationContext: "LockableScore.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func lockLambda(this_arg: UnsafeRawPointer?) -> LDKScore {
				let instance: LockableScore = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "LockableScore::lockLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.lock()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.activate().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: LockableScore = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "LockableScore::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKLockableScore(
				this_arg: thisArg,
				lock: lockLambda,
				free: freeLambda
			)
		}


		/// Returns the locked scorer.
		open func lock() -> Score {

			Bindings.print(
				"Error: LockableScore::lock MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return ()  // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: LockableScore::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
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
						"Freeing LockableScore \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing LockableScore \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}
	}

	internal class NativelyImplementedLockableScore: LockableScore {

		/// Returns the locked scorer.
		public override func lock() -> Score {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.lock(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedScore(
				cType: nativeCallResult, instantiationContext: "LockableScore.swift::\(#function):\(#line)",
				anchor: self)

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
