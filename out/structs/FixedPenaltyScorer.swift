#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// [`Score`] implementation that uses a fixed penalty.
public typealias FixedPenaltyScorer = Bindings.FixedPenaltyScorer

extension Bindings {


	/// [`Score`] implementation that uses a fixed penalty.
	public class FixedPenaltyScorer: NativeTypeWrapper {

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

		internal var cType: LDKFixedPenaltyScorer?

		internal init(cType: LDKFixedPenaltyScorer, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKFixedPenaltyScorer, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKFixedPenaltyScorer, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the FixedPenaltyScorer, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = FixedPenaltyScorer_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the FixedPenaltyScorer
		internal func clone() -> FixedPenaltyScorer {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKFixedPenaltyScorer>) in
					FixedPenaltyScorer_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = FixedPenaltyScorer(
				cType: nativeCallResult, instantiationContext: "FixedPenaltyScorer.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new scorer using `penalty_msat`.
		public class func initWithWithPenalty(penaltyMsat: UInt64) -> FixedPenaltyScorer {
			// native call variable prep


			// native method call
			let nativeCallResult = FixedPenaltyScorer_with_penalty(penaltyMsat)

			// cleanup


			// return value (do some wrapping)
			let returnValue = FixedPenaltyScorer(
				cType: nativeCallResult, instantiationContext: "FixedPenaltyScorer.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Constructs a new Score which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned Score must be freed before this_arg is
		public func asScore() -> Score {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKFixedPenaltyScorer>) in
					FixedPenaltyScorer_as_Score(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedScore(
				cType: nativeCallResult, instantiationContext: "FixedPenaltyScorer.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Serialize the FixedPenaltyScorer object into a byte array which can be read by FixedPenaltyScorer_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKFixedPenaltyScorer>) in
					FixedPenaltyScorer_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "FixedPenaltyScorer.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a FixedPenaltyScorer from a byte array, created by FixedPenaltyScorer_write
		public class func read(ser: [UInt8], arg: UInt64) -> Result_FixedPenaltyScorerDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "FixedPenaltyScorer.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = FixedPenaltyScorer_read(serPrimitiveWrapper.cType!, arg)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_FixedPenaltyScorerDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "FixedPenaltyScorer.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> FixedPenaltyScorer {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> FixedPenaltyScorer {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> FixedPenaltyScorer {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> FixedPenaltyScorer {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing FixedPenaltyScorer \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing FixedPenaltyScorer \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

