// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// Refers to a scorer that is accessible under lock and also writeable to disk
///
/// We need this trait to be able to pass in a scorer to `lightning-background-processor` that will enable us to
/// use the Persister to persist it.
public typealias WriteableScore = Bindings.WriteableScore

extension Bindings {

	/// Refers to a scorer that is accessible under lock and also writeable to disk
	///
	/// We need this trait to be able to pass in a scorer to `lightning-background-processor` that will enable us to
	/// use the Persister to persist it.
	open class WriteableScore: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKWriteableScore?

		internal init(cType: LDKWriteableScore, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKWriteableScore, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKWriteableScore, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public init(lockableScore: LockableScore) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "WriteableScore.swift::\(#function):\(#line)"
				)

			let thisArg = Bindings.instanceToPointer(instance: self)


			func writeLambda(this_arg: UnsafeRawPointer?) -> LDKCVec_u8Z {
				let instance: WriteableScore = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "WriteableScore::writeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.write()

				// cleanup


				// return value (do some wrapping)
				let returnValue = Vec_u8Z(
					array: swiftCallbackResult,
					instantiationContext: "WriteableScore.swift::init()::\(#function):\(#line)"
				)
				.dangle().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: WriteableScore = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "WriteableScore::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKWriteableScore(
				this_arg: thisArg,
				LockableScore: lockableScore.activate().cType!,
				write: writeLambda,
				free: freeLambda
			)
		}


		/// Serialize the object into a byte array
		open func write() -> [UInt8] {

			Bindings.print(
				"Error: WriteableScore::write MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return  // the semicolon is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: WriteableScore::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}


		/// Implementation of LockableScore for this object.
		public func getLockableScore() -> LockableScore {
			// return value (do some wrapping)
			let returnValue = NativelyImplementedLockableScore(
				cType: self.cType!.LockableScore, instantiationContext: "WriteableScore.swift::\(#function):\(#line)",
				anchor: self)

			return returnValue
		}


		internal func dangle(_ shouldDangle: Bool = true) -> WriteableScore {
			self.dangling = shouldDangle
			return self
		}

		internal func dangleRecursively() -> WriteableScore {
			self.dangling = true
			for currentAnchor in self.anchors {
				currentAnchor.dangleRecursively()
			}
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing WriteableScore \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing WriteableScore \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}
	}

	internal class NativelyImplementedWriteableScore: WriteableScore {

		/// Serialize the object into a byte array
		public override func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.write(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "WriteableScore.swift::\(#function):\(#line)"
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
