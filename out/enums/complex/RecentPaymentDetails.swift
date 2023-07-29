import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias RecentPaymentDetails = Bindings.RecentPaymentDetails

extension Bindings {

	/// Used by [`ChannelManager::list_recent_payments`] to express the status of recent payments.
	/// These include payments that have yet to find a successful path, or have unresolved HTLCs.
	public class RecentPaymentDetails: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKRecentPaymentDetails?

		internal init(cType: LDKRecentPaymentDetails, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKRecentPaymentDetails, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKRecentPaymentDetails, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum RecentPaymentDetailsType {

			/// When a payment is still being sent and awaiting successful delivery.
			case Pending

			/// When a pending payment is fulfilled, we continue tracking it until all pending HTLCs have
			/// been resolved. Upon receiving [`Event::PaymentSent`], we delay for a few minutes before the
			/// payment is removed from tracking.
			case Fulfilled

			/// After a payment's retries are exhausted per the provided [`Retry`], or it is explicitly
			/// abandoned via [`ChannelManager::abandon_payment`], it is marked as abandoned until all
			/// pending HTLCs for this payment resolve and an [`Event::PaymentFailed`] is generated.
			case Abandoned

		}

		public func getValueType() -> RecentPaymentDetailsType {
			switch self.cType!.tag {
				case LDKRecentPaymentDetails_Pending:
					return .Pending

				case LDKRecentPaymentDetails_Fulfilled:
					return .Fulfilled

				case LDKRecentPaymentDetails_Abandoned:
					return .Abandoned

				default:
					Bindings.print("Error: Invalid value type for RecentPaymentDetails! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the RecentPaymentDetails
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = RecentPaymentDetails_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the RecentPaymentDetails
		internal func clone() -> RecentPaymentDetails {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKRecentPaymentDetails>) in
					RecentPaymentDetails_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = RecentPaymentDetails(
				cType: nativeCallResult, instantiationContext: "RecentPaymentDetails.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Pending-variant RecentPaymentDetails
		public class func initWithPending(paymentHash: [UInt8], totalMsat: UInt64) -> RecentPaymentDetails {
			// native call variable prep

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "RecentPaymentDetails.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = RecentPaymentDetails_pending(paymentHashPrimitiveWrapper.cType!, totalMsat)

			// cleanup

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = RecentPaymentDetails(
				cType: nativeCallResult, instantiationContext: "RecentPaymentDetails.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Fulfilled-variant RecentPaymentDetails
		public class func initWithFulfilled(paymentHash: [UInt8]) -> RecentPaymentDetails {
			// native call variable prep

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "RecentPaymentDetails.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = RecentPaymentDetails_fulfilled(paymentHashPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = RecentPaymentDetails(
				cType: nativeCallResult, instantiationContext: "RecentPaymentDetails.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Abandoned-variant RecentPaymentDetails
		public class func initWithAbandoned(paymentHash: [UInt8]) -> RecentPaymentDetails {
			// native call variable prep

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "RecentPaymentDetails.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = RecentPaymentDetails_abandoned(paymentHashPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = RecentPaymentDetails(
				cType: nativeCallResult, instantiationContext: "RecentPaymentDetails.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValueAsPending() -> Pending? {
			if self.cType?.tag != LDKRecentPaymentDetails_Pending {
				return nil
			}

			return RecentPaymentDetails_LDKPending_Body(
				cType: self.cType!.pending, instantiationContext: "RecentPaymentDetails.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsFulfilled() -> Fulfilled? {
			if self.cType?.tag != LDKRecentPaymentDetails_Fulfilled {
				return nil
			}

			return RecentPaymentDetails_LDKFulfilled_Body(
				cType: self.cType!.fulfilled, instantiationContext: "RecentPaymentDetails.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsAbandoned() -> Abandoned? {
			if self.cType?.tag != LDKRecentPaymentDetails_Abandoned {
				return nil
			}

			return RecentPaymentDetails_LDKAbandoned_Body(
				cType: self.cType!.abandoned, instantiationContext: "RecentPaymentDetails.swift::\(#function):\(#line)",
				anchor: self)
		}


		internal func dangle(_ shouldDangle: Bool = true) -> RecentPaymentDetails {
			self.dangling = shouldDangle
			return self
		}


		internal func danglingClone() -> RecentPaymentDetails {
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
						"Freeing RecentPaymentDetails \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing RecentPaymentDetails \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


		///
		internal typealias RecentPaymentDetails_LDKPending_Body = Pending


		///
		public class Pending: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKRecentPaymentDetails_LDKPending_Body?

			internal init(cType: LDKRecentPaymentDetails_LDKPending_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKRecentPaymentDetails_LDKPending_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKRecentPaymentDetails_LDKPending_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// Hash of the payment that is currently being sent but has yet to be fulfilled or
			/// abandoned.
			public func getPaymentHash() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_hash,
					instantiationContext: "RecentPaymentDetails.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}

			/// Total amount (in msat, excluding fees) across all paths for this payment,
			/// not just the amount currently inflight.
			public func getTotalMsat() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.total_msat

				return returnValue
			}


			internal func dangle(_ shouldDangle: Bool = true) -> Pending {
				self.dangling = shouldDangle
				return self
			}


		}


		///
		internal typealias RecentPaymentDetails_LDKFulfilled_Body = Fulfilled


		///
		public class Fulfilled: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKRecentPaymentDetails_LDKFulfilled_Body?

			internal init(cType: LDKRecentPaymentDetails_LDKFulfilled_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKRecentPaymentDetails_LDKFulfilled_Body, instantiationContext: String,
				anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKRecentPaymentDetails_LDKFulfilled_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// Hash of the payment that was claimed. `None` for serializations of [`ChannelManager`]
			/// made before LDK version 0.0.104.
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getPaymentHash() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_hash,
					instantiationContext: "RecentPaymentDetails.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}


			internal func dangle(_ shouldDangle: Bool = true) -> Fulfilled {
				self.dangling = shouldDangle
				return self
			}


		}


		///
		internal typealias RecentPaymentDetails_LDKAbandoned_Body = Abandoned


		///
		public class Abandoned: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKRecentPaymentDetails_LDKAbandoned_Body?

			internal init(cType: LDKRecentPaymentDetails_LDKAbandoned_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKRecentPaymentDetails_LDKAbandoned_Body, instantiationContext: String,
				anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKRecentPaymentDetails_LDKAbandoned_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// Hash of the payment that we have given up trying to send.
			public func getPaymentHash() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_hash,
					instantiationContext: "RecentPaymentDetails.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}


			internal func dangle(_ shouldDangle: Bool = true) -> Abandoned {
				self.dangling = shouldDangle
				return self
			}


		}


	}

}
