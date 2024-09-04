import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias FundingInfo = Bindings.FundingInfo

extension Bindings {

	/// `FundingInfo` holds information about a channel's funding transaction.
	///
	/// When LDK is set to manual propagation of the funding transaction
	/// (via [`ChannelManager::unsafe_manual_funding_transaction_generated`),
	/// LDK does not have the full transaction data. Instead, the `OutPoint`
	/// for the funding is provided here.
	///
	/// [`ChannelManager::unsafe_manual_funding_transaction_generated`]: crate::ln::channelmanager::ChannelManager::unsafe_manual_funding_transaction_generated
	public class FundingInfo: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKFundingInfo?

		internal init(cType: LDKFundingInfo, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKFundingInfo, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKFundingInfo, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum FundingInfoType {

			/// The full funding `Transaction`.
			case Tx

			/// The `OutPoint` of the funding.
			case OutPoint

		}

		public func getValueType() -> FundingInfoType {
			switch self.cType!.tag {
				case LDKFundingInfo_Tx:
					return .Tx

				case LDKFundingInfo_OutPoint:
					return .OutPoint

				default:
					Bindings.print("Error: Invalid value type for FundingInfo! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the FundingInfo
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = FundingInfo_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the FundingInfo
		internal func clone() -> FundingInfo {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKFundingInfo>) in
					FundingInfo_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = FundingInfo(
				cType: nativeCallResult, instantiationContext: "FundingInfo.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Tx-variant FundingInfo
		public class func initWithTx(transaction: [UInt8]) -> FundingInfo {
			// native call variable prep

			let transactionPrimitiveWrapper = Transaction(
				value: transaction, instantiationContext: "FundingInfo.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = FundingInfo_tx(transactionPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			transactionPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = FundingInfo(
				cType: nativeCallResult, instantiationContext: "FundingInfo.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new OutPoint-variant FundingInfo
		public class func initWithOutPoint(outpoint: Bindings.OutPoint) -> FundingInfo {
			// native call variable prep


			// native method call
			let nativeCallResult = FundingInfo_out_point(outpoint.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = FundingInfo(
				cType: nativeCallResult, instantiationContext: "FundingInfo.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two FundingInfos contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: FundingInfo, b: FundingInfo) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKFundingInfo>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKFundingInfo>) in
						FundingInfo_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the FundingInfo object into a byte array which can be read by FundingInfo_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKFundingInfo>) in
					FundingInfo_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "FundingInfo.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a FundingInfo from a byte array, created by FundingInfo_write
		public class func read(ser: [UInt8]) -> Result_FundingInfoDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "FundingInfo.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = FundingInfo_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_FundingInfoDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "FundingInfo.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValueAsTx() -> Tx? {
			if self.cType?.tag != LDKFundingInfo_Tx {
				return nil
			}

			return FundingInfo_LDKTx_Body(
				cType: self.cType!.tx, instantiationContext: "FundingInfo.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsOutPoint() -> OutPoint? {
			if self.cType?.tag != LDKFundingInfo_OutPoint {
				return nil
			}

			return FundingInfo_LDKOutPoint_Body(
				cType: self.cType!.out_point, instantiationContext: "FundingInfo.swift::\(#function):\(#line)",
				anchor: self)
		}


		internal func danglingClone() -> FundingInfo {
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
					Bindings.print("Freeing FundingInfo \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing FundingInfo \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


		///
		internal typealias FundingInfo_LDKTx_Body = Tx


		///
		public class Tx: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKFundingInfo_LDKTx_Body?

			internal init(cType: LDKFundingInfo_LDKTx_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(cType: LDKFundingInfo_LDKTx_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKFundingInfo_LDKTx_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The funding transaction
			public func getTransaction() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = Transaction(
					cType: self.cType!.transaction, instantiationContext: "FundingInfo.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}


		}


		///
		internal typealias FundingInfo_LDKOutPoint_Body = OutPoint


		///
		public class OutPoint: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKFundingInfo_LDKOutPoint_Body?

			internal init(cType: LDKFundingInfo_LDKOutPoint_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKFundingInfo_LDKOutPoint_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKFundingInfo_LDKOutPoint_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The outpoint of the funding
			public func getOutpoint() -> Bindings.OutPoint {
				// return value (do some wrapping)
				let returnValue = Bindings.OutPoint(
					cType: self.cType!.outpoint, instantiationContext: "FundingInfo.swift::\(#function):\(#line)",
					anchor: self)

				return returnValue
			}


		}


	}

}
