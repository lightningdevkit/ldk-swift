#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A tx_init_rbf message which initiates a replacement of the transaction after it's been
/// completed.
public typealias TxInitRbf = Bindings.TxInitRbf

extension Bindings {


	/// A tx_init_rbf message which initiates a replacement of the transaction after it's been
	/// completed.
	public class TxInitRbf: NativeTypeWrapper {

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

		internal var cType: LDKTxInitRbf?

		internal init(cType: LDKTxInitRbf, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKTxInitRbf, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKTxInitRbf, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the TxInitRbf, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = TxInitRbf_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The channel ID
		public func getChannelId() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKTxInitRbf>) in
					TxInitRbf_get_channel_id(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// The channel ID
		public func setChannelId(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ThirtyTwoBytes(
				value: val, instantiationContext: "TxInitRbf.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKTxInitRbf>) in
					TxInitRbf_set_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The locktime of the transaction
		public func getLocktime() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKTxInitRbf>) in
					TxInitRbf_get_locktime(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The locktime of the transaction
		public func setLocktime(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKTxInitRbf>) in
					TxInitRbf_set_locktime(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The feerate of the transaction
		public func getFeerateSatPer1000Weight() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKTxInitRbf>) in
					TxInitRbf_get_feerate_sat_per_1000_weight(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The feerate of the transaction
		public func setFeerateSatPer1000Weight(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKTxInitRbf>) in
					TxInitRbf_set_feerate_sat_per_1000_weight(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The number of satoshis the sender will contribute to or, if negative, remove from
		/// (e.g. splice-out) the funding output of the transaction
		public func getFundingOutputContribution() -> Int64? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKTxInitRbf>) in
					TxInitRbf_get_funding_output_contribution(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_i64Z(
				cType: nativeCallResult, instantiationContext: "TxInitRbf.swift::\(#function):\(#line)", anchor: self
			)
			.getValue()


			return returnValue
		}

		/// The number of satoshis the sender will contribute to or, if negative, remove from
		/// (e.g. splice-out) the funding output of the transaction
		public func setFundingOutputContribution(val: Int64?) {
			// native call variable prep

			let valOption = Option_i64Z(some: val, instantiationContext: "TxInitRbf.swift::\(#function):\(#line)")
				.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKTxInitRbf>) in
					TxInitRbf_set_funding_output_contribution(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new TxInitRbf given each field
		public init(
			channelIdArg: [UInt8], locktimeArg: UInt32, feerateSatPer1000WeightArg: UInt32,
			fundingOutputContributionArg: Int64?
		) {
			// native call variable prep

			let channelIdArgPrimitiveWrapper = ThirtyTwoBytes(
				value: channelIdArg, instantiationContext: "TxInitRbf.swift::\(#function):\(#line)")

			let fundingOutputContributionArgOption = Option_i64Z(
				some: fundingOutputContributionArg, instantiationContext: "TxInitRbf.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = TxInitRbf_new(
				channelIdArgPrimitiveWrapper.cType!, locktimeArg, feerateSatPer1000WeightArg,
				fundingOutputContributionArgOption.cType!)

			// cleanup

			// for elided types, we need this
			channelIdArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = TxInitRbf(cType: nativeCallResult, instantiationContext: "TxInitRbf.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: "TxInitRbf.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the TxInitRbf
		internal func clone() -> TxInitRbf {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKTxInitRbf>) in
					TxInitRbf_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = TxInitRbf(
				cType: nativeCallResult, instantiationContext: "TxInitRbf.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the TxInitRbf.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKTxInitRbf>) in
					TxInitRbf_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two TxInitRbfs contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: TxInitRbf, b: TxInitRbf) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKTxInitRbf>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKTxInitRbf>) in
						TxInitRbf_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the TxInitRbf object into a byte array which can be read by TxInitRbf_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKTxInitRbf>) in
					TxInitRbf_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "TxInitRbf.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a TxInitRbf from a byte array, created by TxInitRbf_write
		public class func read(ser: [UInt8]) -> Result_TxInitRbfDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "TxInitRbf.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = TxInitRbf_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_TxInitRbfDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "TxInitRbf.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> TxInitRbf {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> TxInitRbf {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> TxInitRbf {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> TxInitRbf {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing TxInitRbf \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing TxInitRbf \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

