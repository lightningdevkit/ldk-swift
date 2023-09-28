// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// A trait defining a scorer which can both be used to score and updated.
///
/// This is used in places where both bounds are required and implemented for all types which
/// implement [`ScoreLookUp`] and [`ScoreUpdate`].
///
/// Bindings users may need to manually implement this for their custom scoring implementations.
public typealias Score = Bindings.Score

extension Bindings {

	/// A trait defining a scorer which can both be used to score and updated.
	///
	/// This is used in places where both bounds are required and implemented for all types which
	/// implement [`ScoreLookUp`] and [`ScoreUpdate`].
	///
	/// Bindings users may need to manually implement this for their custom scoring implementations.
	open class Score: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKScore?

		internal init(cType: LDKScore, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKScore, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(cType: LDKScore, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public init(scoreLookUp: ScoreLookUp, scoreUpdate: ScoreUpdate) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: "Score.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func writeLambda(this_arg: UnsafeRawPointer?) -> LDKCVec_u8Z {
				let instance: Score = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Score::writeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.write()

				// cleanup


				// return value (do some wrapping)
				let returnValue = Vec_u8Z(
					array: swiftCallbackResult, instantiationContext: "Score.swift::init()::\(#function):\(#line)"
				)
				.dangleRecursively().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: Score = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Score::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKScore(
				this_arg: thisArg,
				ScoreLookUp: scoreLookUp.activate().cType!,
				ScoreUpdate: scoreUpdate.activate().cType!,
				write: writeLambda,
				free: freeLambda
			)
		}


		/// Serialize the object into a byte array
		open func write() -> [UInt8] {

			Bindings.print(
				"Error: Score::write MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return ()  // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: Score::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}


		/// Implementation of ScoreLookUp for this object.
		public func getScoreLookUp() -> ScoreLookUp {
			// return value (do some wrapping)
			let returnValue = NativelyImplementedScoreLookUp(
				cType: self.cType!.ScoreLookUp, instantiationContext: "Score.swift::\(#function):\(#line)", anchor: self
			)

			return returnValue
		}

		/// Implementation of ScoreUpdate for this object.
		public func getScoreUpdate() -> ScoreUpdate {
			// return value (do some wrapping)
			let returnValue = NativelyImplementedScoreUpdate(
				cType: self.cType!.ScoreUpdate, instantiationContext: "Score.swift::\(#function):\(#line)", anchor: self
			)

			return returnValue
		}


		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing Score \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Score \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
			}
		}
	}

	internal class NativelyImplementedScore: Score {

		/// Serialize the object into a byte array
		public override func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.write(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "Score.swift::\(#function):\(#line)"
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
