import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias InboundChannelFunds = Bindings.InboundChannelFunds

extension Bindings {

	/// Used to indicate the kind of funding for this channel by the channel acceptor (us).
	///
	/// Allows the differentiation between a request for a dual-funded and non-dual-funded channel.
	public class InboundChannelFunds: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKInboundChannelFunds?

		internal init(cType: LDKInboundChannelFunds, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKInboundChannelFunds, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKInboundChannelFunds, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum InboundChannelFundsType {

			/// For a non-dual-funded channel, the `push_msat` value from the channel initiator to us.
			case PushMsat

			/// Indicates the open request is for a dual funded channel.
			///
			/// Note that these channels do not support starting with initial funds pushed from the counterparty,
			/// who is the channel opener in this case.
			case DualFunded

		}

		public func getValueType() -> InboundChannelFundsType {
			switch self.cType!.tag {
				case LDKInboundChannelFunds_PushMsat:
					return .PushMsat

				case LDKInboundChannelFunds_DualFunded:
					return .DualFunded

				default:
					Bindings.print("Error: Invalid value type for InboundChannelFunds! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the InboundChannelFunds
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = InboundChannelFunds_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the InboundChannelFunds
		internal func clone() -> InboundChannelFunds {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKInboundChannelFunds>) in
					InboundChannelFunds_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = InboundChannelFunds(
				cType: nativeCallResult, instantiationContext: "InboundChannelFunds.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new PushMsat-variant InboundChannelFunds
		public class func initWithPushMsat(a: UInt64) -> InboundChannelFunds {
			// native call variable prep


			// native method call
			let nativeCallResult = InboundChannelFunds_push_msat(a)

			// cleanup


			// return value (do some wrapping)
			let returnValue = InboundChannelFunds(
				cType: nativeCallResult, instantiationContext: "InboundChannelFunds.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new DualFunded-variant InboundChannelFunds
		public class func initWithDualFunded() -> InboundChannelFunds {
			// native call variable prep


			// native method call
			let nativeCallResult = InboundChannelFunds_dual_funded()

			// cleanup


			// return value (do some wrapping)
			let returnValue = InboundChannelFunds(
				cType: nativeCallResult, instantiationContext: "InboundChannelFunds.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two InboundChannelFundss contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: InboundChannelFunds, b: InboundChannelFunds) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKInboundChannelFunds>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKInboundChannelFunds>) in
						InboundChannelFunds_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func getValueAsPushMsat() -> UInt64? {
			if self.cType?.tag != LDKInboundChannelFunds_PushMsat {
				return nil
			}

			return self.cType!.push_msat
		}


		internal func danglingClone() -> InboundChannelFunds {
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
						"Freeing InboundChannelFunds \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing InboundChannelFunds \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
