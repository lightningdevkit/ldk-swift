#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// [`ScoreLookUp`] implementation that factors in in-flight HTLC liquidity.
///
/// Useful for custom [`Router`] implementations to wrap their [`ScoreLookUp`] on-the-fly when calling
/// [`find_route`].
///
/// [`ScoreLookUp`]: crate::routing::scoring::ScoreLookUp
public typealias ScorerAccountingForInFlightHtlcs = Bindings.ScorerAccountingForInFlightHtlcs

extension Bindings {


	/// [`ScoreLookUp`] implementation that factors in in-flight HTLC liquidity.
	///
	/// Useful for custom [`Router`] implementations to wrap their [`ScoreLookUp`] on-the-fly when calling
	/// [`find_route`].
	///
	/// [`ScoreLookUp`]: crate::routing::scoring::ScoreLookUp
	public class ScorerAccountingForInFlightHtlcs: NativeTypeWrapper {

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

		internal var cType: LDKScorerAccountingForInFlightHtlcs?

		internal init(cType: LDKScorerAccountingForInFlightHtlcs, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKScorerAccountingForInFlightHtlcs, instantiationContext: String, anchor: NativeTypeWrapper
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKScorerAccountingForInFlightHtlcs, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the ScorerAccountingForInFlightHtlcs, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ScorerAccountingForInFlightHtlcs_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Initialize a new `ScorerAccountingForInFlightHtlcs`.
		public init(scorer: ScoreLookUp, inflightHtlcs: InFlightHtlcs) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: inflightHtlcs.cType!) { (inflightHtlcsPointer: UnsafePointer<LDKInFlightHtlcs>) in
					ScorerAccountingForInFlightHtlcs_new(scorer.activate().cType!, inflightHtlcsPointer)
				}


			// cleanup

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = ScorerAccountingForInFlightHtlcs(cType: nativeCallResult, instantiationContext: "ScorerAccountingForInFlightHtlcs.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "ScorerAccountingForInFlightHtlcs.swift::\(#function):\(#line)")
			try! self.addAnchor(anchor: inflightHtlcs)


		}

		/// Constructs a new ScoreLookUp which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned ScoreLookUp must be freed before this_arg is
		public func asScoreLookUp() -> ScoreLookUp {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(thisArgPointer: UnsafePointer<LDKScorerAccountingForInFlightHtlcs>) in
					ScorerAccountingForInFlightHtlcs_as_ScoreLookUp(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedScoreLookUp(
				cType: nativeCallResult,
				instantiationContext: "ScorerAccountingForInFlightHtlcs.swift::\(#function):\(#line)", anchor: self)


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


		internal func setCFreeability(freeable: Bool) -> ScorerAccountingForInFlightHtlcs {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> ScorerAccountingForInFlightHtlcs {
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
						"Freeing ScorerAccountingForInFlightHtlcs \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ScorerAccountingForInFlightHtlcs \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

