import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias Payee = Bindings.Payee

extension Bindings {

	/// The recipient of a payment, differing based on whether they've hidden their identity with route
	/// blinding.
	public class Payee: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKPayee?

		internal init(cType: LDKPayee, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKPayee, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(cType: LDKPayee, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum PayeeType {

			/// The recipient provided blinded paths and payinfo to reach them. The blinded paths themselves
			/// will be included in the final [`Route`].
			case Blinded

			/// The recipient included these route hints in their BOLT11 invoice.
			case Clear

		}

		public func getValueType() -> PayeeType {
			switch self.cType!.tag {
				case LDKPayee_Blinded:
					return .Blinded

				case LDKPayee_Clear:
					return .Clear

				default:
					Bindings.print("Error: Invalid value type for Payee! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the Payee
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = Payee_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the Payee
		internal func clone() -> Payee {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKPayee>) in
					Payee_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Payee(cType: nativeCallResult, instantiationContext: "Payee.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Blinded-variant Payee
		public class func initWithBlinded(
			routeHints: [(BlindedPayInfo, BlindedPath)], features: Bindings.Bolt12InvoiceFeatures
		) -> Payee {
			// native call variable prep

			let routeHintsVector = Vec_C2Tuple_BlindedPayInfoBlindedPathZZ(
				array: routeHints, instantiationContext: "Payee.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = Payee_blinded(routeHintsVector.cType!, features.dynamicallyDangledClone().cType!)

			// cleanup

			// routeHintsVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Payee(cType: nativeCallResult, instantiationContext: "Payee.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Clear-variant Payee
		public class func initWithClear(
			nodeId: [UInt8], routeHints: [RouteHint], features: Bindings.Bolt11InvoiceFeatures,
			finalCltvExpiryDelta: UInt32
		) -> Payee {
			// native call variable prep

			let nodeIdPrimitiveWrapper = PublicKey(
				value: nodeId, instantiationContext: "Payee.swift::\(#function):\(#line)")

			let routeHintsVector = Vec_RouteHintZ(
				array: routeHints, instantiationContext: "Payee.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = Payee_clear(
				nodeIdPrimitiveWrapper.cType!, routeHintsVector.cType!, features.dynamicallyDangledClone().cType!,
				finalCltvExpiryDelta)

			// cleanup

			// for elided types, we need this
			nodeIdPrimitiveWrapper.noOpRetain()

			// routeHintsVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Payee(cType: nativeCallResult, instantiationContext: "Payee.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the Payee.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKPayee>) in
					Payee_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two Payees contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: Payee, b: Payee) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKPayee>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKPayee>) in
						Payee_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func getValueAsBlinded() -> Blinded? {
			if self.cType?.tag != LDKPayee_Blinded {
				return nil
			}

			return Payee_LDKBlinded_Body(
				cType: self.cType!.blinded, instantiationContext: "Payee.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsClear() -> Clear? {
			if self.cType?.tag != LDKPayee_Clear {
				return nil
			}

			return Payee_LDKClear_Body(
				cType: self.cType!.clear, instantiationContext: "Payee.swift::\(#function):\(#line)", anchor: self)
		}


		internal func danglingClone() -> Payee {
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
					Bindings.print("Freeing Payee \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Payee \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
			}
		}


		///
		internal typealias Payee_LDKBlinded_Body = Blinded


		///
		public class Blinded: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKPayee_LDKBlinded_Body?

			internal init(cType: LDKPayee_LDKBlinded_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(cType: LDKPayee_LDKBlinded_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKPayee_LDKBlinded_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// Aggregated routing info and blinded paths, for routing to the payee without knowing their
			/// node id.
			public func getRouteHints() -> [(BlindedPayInfo, BlindedPath)] {
				// return value (do some wrapping)
				let returnValue = Vec_C2Tuple_BlindedPayInfoBlindedPathZZ(
					cType: self.cType!.route_hints, instantiationContext: "Payee.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// Features supported by the payee.
			///
			/// May be set from the payee's invoice. May be `None` if the invoice does not contain any
			/// features.
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getFeatures() -> Bindings.Bolt12InvoiceFeatures {
				// return value (do some wrapping)
				let returnValue = Bindings.Bolt12InvoiceFeatures(
					cType: self.cType!.features, instantiationContext: "Payee.swift::\(#function):\(#line)",
					anchor: self)

				return returnValue
			}


		}


		///
		internal typealias Payee_LDKClear_Body = Clear


		///
		public class Clear: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKPayee_LDKClear_Body?

			internal init(cType: LDKPayee_LDKClear_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(cType: LDKPayee_LDKClear_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKPayee_LDKClear_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The node id of the payee.
			public func getNodeId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = PublicKey(
					cType: self.cType!.node_id, instantiationContext: "Payee.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}

			/// Hints for routing to the payee, containing channels connecting the payee to public nodes.
			public func getRouteHints() -> [RouteHint] {
				// return value (do some wrapping)
				let returnValue = Vec_RouteHintZ(
					cType: self.cType!.route_hints, instantiationContext: "Payee.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// Features supported by the payee.
			///
			/// May be set from the payee's invoice or via [`for_keysend`]. May be `None` if the invoice
			/// does not contain any features.
			///
			/// [`for_keysend`]: PaymentParameters::for_keysend
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getFeatures() -> Bindings.Bolt11InvoiceFeatures {
				// return value (do some wrapping)
				let returnValue = Bindings.Bolt11InvoiceFeatures(
					cType: self.cType!.features, instantiationContext: "Payee.swift::\(#function):\(#line)",
					anchor: self)

				return returnValue
			}

			/// The minimum CLTV delta at the end of the route. This value must not be zero.
			public func getFinalCltvExpiryDelta() -> UInt32 {
				// return value (do some wrapping)
				let returnValue = self.cType!.final_cltv_expiry_delta

				return returnValue
			}


		}


	}

}
