import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias ProbeSendFailure = Bindings.ProbeSendFailure

extension Bindings {

	/// Indicates that we failed to send a payment probe. Further errors may be surfaced later via
	/// [`Event::ProbeFailed`].
	///
	/// [`Event::ProbeFailed`]: crate::events::Event::ProbeFailed
	public class ProbeSendFailure: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKProbeSendFailure?

		internal init(cType: LDKProbeSendFailure, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKProbeSendFailure, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKProbeSendFailure, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum ProbeSendFailureType {

			/// We were unable to find a route to the destination.
			case RouteNotFound

			/// A parameter which was passed to [`ChannelManager::send_probe`] was invalid, preventing us from
			/// attempting to send the probe at all.
			///
			/// You can freely resend the probe (with the parameter error fixed).
			///
			/// Because the probe failed outright, no payment tracking is done and no
			/// [`Event::ProbeFailed`] events will be generated.
			///
			/// [`ChannelManager::send_probe`]: crate::ln::channelmanager::ChannelManager::send_probe
			/// [`Event::ProbeFailed`]: crate::events::Event::ProbeFailed
			case ParameterError

			/// Indicates that a payment for the provided [`PaymentId`] is already in-flight and has not
			/// yet completed (i.e. generated an [`Event::ProbeSuccessful`] or [`Event::ProbeFailed`]).
			///
			/// [`PaymentId`]: crate::ln::channelmanager::PaymentId
			/// [`Event::ProbeSuccessful`]: crate::events::Event::ProbeSuccessful
			/// [`Event::ProbeFailed`]: crate::events::Event::ProbeFailed
			case DuplicateProbe

		}

		public func getValueType() -> ProbeSendFailureType {
			switch self.cType!.tag {
				case LDKProbeSendFailure_RouteNotFound:
					return .RouteNotFound

				case LDKProbeSendFailure_ParameterError:
					return .ParameterError

				case LDKProbeSendFailure_DuplicateProbe:
					return .DuplicateProbe

				default:
					Bindings.print("Error: Invalid value type for ProbeSendFailure! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the ProbeSendFailure
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ProbeSendFailure_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the ProbeSendFailure
		internal func clone() -> ProbeSendFailure {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKProbeSendFailure>) in
					ProbeSendFailure_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ProbeSendFailure(
				cType: nativeCallResult, instantiationContext: "ProbeSendFailure.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new RouteNotFound-variant ProbeSendFailure
		public class func initWithRouteNotFound() -> ProbeSendFailure {
			// native call variable prep


			// native method call
			let nativeCallResult = ProbeSendFailure_route_not_found()

			// cleanup


			// return value (do some wrapping)
			let returnValue = ProbeSendFailure(
				cType: nativeCallResult, instantiationContext: "ProbeSendFailure.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new ParameterError-variant ProbeSendFailure
		public class func initWithParameterError(a: APIError) -> ProbeSendFailure {
			// native call variable prep


			// native method call
			let nativeCallResult = ProbeSendFailure_parameter_error(a.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = ProbeSendFailure(
				cType: nativeCallResult, instantiationContext: "ProbeSendFailure.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new DuplicateProbe-variant ProbeSendFailure
		public class func initWithDuplicateProbe() -> ProbeSendFailure {
			// native call variable prep


			// native method call
			let nativeCallResult = ProbeSendFailure_duplicate_probe()

			// cleanup


			// return value (do some wrapping)
			let returnValue = ProbeSendFailure(
				cType: nativeCallResult, instantiationContext: "ProbeSendFailure.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two ProbeSendFailures contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: ProbeSendFailure, b: ProbeSendFailure) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKProbeSendFailure>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKProbeSendFailure>) in
						ProbeSendFailure_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func getValueAsParameterError() -> APIError? {
			if self.cType?.tag != LDKProbeSendFailure_ParameterError {
				return nil
			}

			return APIError(
				cType: self.cType!.parameter_error,
				instantiationContext: "ProbeSendFailure.swift::\(#function):\(#line)", anchor: self)
		}


		internal func danglingClone() -> ProbeSendFailure {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing ProbeSendFailure \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ProbeSendFailure \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
