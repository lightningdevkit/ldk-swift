#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A struct which can be used to select across many [`Future`]s at once without relying on a full
/// async context.
public typealias Sleeper = Bindings.Sleeper

extension Bindings {


	/// A struct which can be used to select across many [`Future`]s at once without relying on a full
	/// async context.
	public class Sleeper: NativeTypeWrapper {

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

		internal var cType: LDKSleeper?

		internal init(cType: LDKSleeper, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKSleeper, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(cType: LDKSleeper, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false)
		{
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the Sleeper, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = Sleeper_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new sleeper from one future, allowing blocking on it.
		public class func initWithSingleFuture(future: Future) -> Sleeper {
			// native call variable prep


			// native method call
			let nativeCallResult = Sleeper_from_single_future(future.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Sleeper(
				cType: nativeCallResult, instantiationContext: "Sleeper.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Constructs a new sleeper from two futures, allowing blocking on both at once.
		public class func initWithTwoFutures(futA: Future, futB: Future) -> Sleeper {
			// native call variable prep


			// native method call
			let nativeCallResult = Sleeper_from_two_futures(
				futA.dynamicallyDangledClone().cType!, futB.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Sleeper(
				cType: nativeCallResult, instantiationContext: "Sleeper.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Constructs a new sleeper on many futures, allowing blocking on all at once.
		public init(futures: [Future]) {
			// native call variable prep

			let futuresVector = Vec_FutureZ(
				array: futures, instantiationContext: "Sleeper.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = Sleeper_new(futuresVector.cType!)

			// cleanup

			// futuresVector.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = Sleeper(cType: nativeCallResult, instantiationContext: "Sleeper.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: "Sleeper.swift::\(#function):\(#line)")


		}

		/// Wait until one of the [`Future`]s registered with this [`Sleeper`] has completed.
		public func wait() {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKSleeper>) in
					Sleeper_wait(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Wait until one of the [`Future`]s registered with this [`Sleeper`] has completed or the
		/// given amount of time has elapsed. Returns true if a [`Future`] completed, false if the time
		/// elapsed.
		public func waitTimeout(maxWait: UInt64) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKSleeper>) in
					Sleeper_wait_timeout(thisArgPointer, maxWait)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


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


		internal func dangle(_ shouldDangle: Bool = true) -> Sleeper {
			self.dangling = shouldDangle
			return self
		}

		internal func dangleRecursively() -> Sleeper {
			self.dangling = true
			for currentAnchor in self.anchors {
				currentAnchor.dangleRecursively()
			}
			return self
		}


		internal func setCFreeability(freeable: Bool) -> Sleeper {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> Sleeper {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing Sleeper \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Sleeper \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
			}
		}


	}


}

