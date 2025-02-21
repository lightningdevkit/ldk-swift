import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias Amount = Bindings.Amount

extension Bindings {

	/// The minimum amount required for an item in an [`Offer`], denominated in either bitcoin or
	/// another currency.
	public class Amount: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKAmount?

		internal init(cType: LDKAmount, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKAmount, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(cType: LDKAmount, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum AmountType {

			/// An amount of bitcoin.
			case Bitcoin

			/// An amount of currency specified using ISO 4217.
			case Currency

		}

		public func getValueType() -> AmountType {
			switch self.cType!.tag {
				case LDKAmount_Bitcoin:
					return .Bitcoin

				case LDKAmount_Currency:
					return .Currency

				default:
					Bindings.print("Error: Invalid value type for Amount! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the Amount
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = Amount_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the Amount
		internal func clone() -> Amount {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKAmount>) in
					Amount_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Amount(
				cType: nativeCallResult, instantiationContext: "Amount.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Bitcoin-variant Amount
		public class func initWithBitcoin(amountMsats: UInt64) -> Amount {
			// native call variable prep


			// native method call
			let nativeCallResult = Amount_bitcoin(amountMsats)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Amount(
				cType: nativeCallResult, instantiationContext: "Amount.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Currency-variant Amount
		public class func initWithCurrency(iso4217Code: [UInt8], amount: UInt64) -> Amount {
			// native call variable prep

			let iso4217CodePrimitiveWrapper = ThreeBytes(
				value: iso4217Code, instantiationContext: "Amount.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Amount_currency(iso4217CodePrimitiveWrapper.cType!, amount)

			// cleanup

			// for elided types, we need this
			iso4217CodePrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Amount(
				cType: nativeCallResult, instantiationContext: "Amount.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValueAsBitcoin() -> Bitcoin? {
			if self.cType?.tag != LDKAmount_Bitcoin {
				return nil
			}

			return Amount_LDKBitcoin_Body(
				cType: self.cType!.bitcoin, instantiationContext: "Amount.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsCurrency() -> Currency? {
			if self.cType?.tag != LDKAmount_Currency {
				return nil
			}

			return Amount_LDKCurrency_Body(
				cType: self.cType!.currency, instantiationContext: "Amount.swift::\(#function):\(#line)", anchor: self)
		}


		internal func danglingClone() -> Amount {
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
					Bindings.print("Freeing Amount \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Amount \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
			}
		}


		///
		internal typealias Amount_LDKBitcoin_Body = Bitcoin


		///
		public class Bitcoin: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKAmount_LDKBitcoin_Body?

			internal init(cType: LDKAmount_LDKBitcoin_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(cType: LDKAmount_LDKBitcoin_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKAmount_LDKBitcoin_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The amount in millisatoshi.
			public func getAmountMsats() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.amount_msats

				return returnValue
			}


		}


		///
		internal typealias Amount_LDKCurrency_Body = Currency


		///
		public class Currency: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKAmount_LDKCurrency_Body?

			internal init(cType: LDKAmount_LDKCurrency_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(cType: LDKAmount_LDKCurrency_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKAmount_LDKCurrency_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The currency that the amount is denominated in.
			public func getIso4217Code() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThreeBytes(
					cType: self.cType!.iso4217_code, instantiationContext: "Amount.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The amount in the currency unit adjusted by the ISO 4712 exponent (e.g., USD cents).
			public func getAmount() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.amount

				return returnValue
			}


		}


	}

}
