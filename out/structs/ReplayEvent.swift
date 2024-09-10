#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// An error type that may be returned to LDK in order to safely abort event handling if it can't
/// currently succeed (e.g., due to a persistence failure).
///
/// Depending on the type, LDK may ensure the event is persisted and will eventually be replayed.
/// Please refer to the documentation of each [`Event`] variant for more details.
public typealias ReplayEvent = Bindings.ReplayEvent

extension Bindings {


	/// An error type that may be returned to LDK in order to safely abort event handling if it can't
	/// currently succeed (e.g., due to a persistence failure).
	///
	/// Depending on the type, LDK may ensure the event is persisted and will eventually be replayed.
	/// Please refer to the documentation of each [`Event`] variant for more details.
	public class ReplayEvent: NativeTypeWrapper {

		let initialCFreeability: Bool


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKReplayEvent?

		internal init(cType: LDKReplayEvent, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKReplayEvent, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKReplayEvent, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the ReplayEvent, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ReplayEvent_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new ReplayEvent given each field
		public init() {
			// native call variable prep


			// native method call
			let nativeCallResult = ReplayEvent_new()

			// cleanup

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = ReplayEvent(cType: nativeCallResult, instantiationContext: "ReplayEvent.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(conflictAvoidingVariableName: 0, instantiationContext: "ReplayEvent.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the ReplayEvent
		internal func clone() -> ReplayEvent {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKReplayEvent>) in
					ReplayEvent_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ReplayEvent(
				cType: nativeCallResult, instantiationContext: "ReplayEvent.swift::\(#function):\(#line)")


			return returnValue
		}


		/// Indicates that this is the only struct which contains the same pointer.
		/// Rust functions which take ownership of an object provided via an argument require
		/// this to be true and invalidate the object pointed to by inner.
		public func isOwned() -> Bool {
			// return value (do some wrapping)
			let returnValue = self.cType!.is_owned

			return returnValue
		}


		internal func danglingClone() -> ReplayEvent {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> ReplayEvent {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> ReplayEvent {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> ReplayEvent {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing ReplayEvent \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ReplayEvent \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

