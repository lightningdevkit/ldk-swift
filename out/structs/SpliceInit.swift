#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A `splice_init` message to be sent by or received from the stfu initiator (splice initiator).
public typealias SpliceInit = Bindings.SpliceInit

extension Bindings {


	/// A `splice_init` message to be sent by or received from the stfu initiator (splice initiator).
	public class SpliceInit: NativeTypeWrapper {

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

		internal var cType: LDKSpliceInit?

		internal init(cType: LDKSpliceInit, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKSpliceInit, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKSpliceInit, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the SpliceInit, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = SpliceInit_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The channel ID where splicing is intended
		public func getChannelId() -> ChannelId {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKSpliceInit>) in
					SpliceInit_get_channel_id(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelId(
				cType: nativeCallResult, instantiationContext: "SpliceInit.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The channel ID where splicing is intended
		public func setChannelId(val: ChannelId) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKSpliceInit>) in
					SpliceInit_set_channel_id(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The amount the splice initiator is intending to add to its channel balance (splice-in)
		/// or remove from its channel balance (splice-out).
		public func getFundingContributionSatoshis() -> Int64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKSpliceInit>) in
					SpliceInit_get_funding_contribution_satoshis(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The amount the splice initiator is intending to add to its channel balance (splice-in)
		/// or remove from its channel balance (splice-out).
		public func setFundingContributionSatoshis(val: Int64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKSpliceInit>) in
					SpliceInit_set_funding_contribution_satoshis(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The feerate for the new funding transaction, set by the splice initiator
		public func getFundingFeeratePerkw() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKSpliceInit>) in
					SpliceInit_get_funding_feerate_perkw(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The feerate for the new funding transaction, set by the splice initiator
		public func setFundingFeeratePerkw(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKSpliceInit>) in
					SpliceInit_set_funding_feerate_perkw(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The locktime for the new funding transaction
		public func getLocktime() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKSpliceInit>) in
					SpliceInit_get_locktime(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The locktime for the new funding transaction
		public func setLocktime(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKSpliceInit>) in
					SpliceInit_set_locktime(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The key of the sender (splice initiator) controlling the new funding transaction
		public func getFundingPubkey() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKSpliceInit>) in
					SpliceInit_get_funding_pubkey(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "SpliceInit.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The key of the sender (splice initiator) controlling the new funding transaction
		public func setFundingPubkey(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "SpliceInit.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKSpliceInit>) in
					SpliceInit_set_funding_pubkey(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// If set, only confirmed inputs added (by the splice acceptor) will be accepted
		public func getRequireConfirmedInputs() -> Option_NoneZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKSpliceInit>) in
					SpliceInit_get_require_confirmed_inputs(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_NoneZ(value: nativeCallResult)


			return returnValue
		}

		/// If set, only confirmed inputs added (by the splice acceptor) will be accepted
		@available(
			*, deprecated,
			message: "This method passes the following non-cloneable, but freeable objects by value: `val`."
		)
		public func setRequireConfirmedInputs(val: Option_NoneZ) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKSpliceInit>) in
					SpliceInit_set_require_confirmed_inputs(thisPtrPointer, val.getCValue())
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new SpliceInit given each field
		@available(
			*, deprecated,
			message:
				"This method passes the following non-cloneable, but freeable objects by value: `requireConfirmedInputsArg`."
		)
		public init(
			channelIdArg: ChannelId, fundingContributionSatoshisArg: Int64, fundingFeeratePerkwArg: UInt32,
			locktimeArg: UInt32, fundingPubkeyArg: [UInt8], requireConfirmedInputsArg: Option_NoneZ
		) {
			// native call variable prep

			let fundingPubkeyArgPrimitiveWrapper = PublicKey(
				value: fundingPubkeyArg, instantiationContext: "SpliceInit.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = SpliceInit_new(
				channelIdArg.dynamicallyDangledClone().cType!, fundingContributionSatoshisArg, fundingFeeratePerkwArg,
				locktimeArg, fundingPubkeyArgPrimitiveWrapper.cType!, requireConfirmedInputsArg.getCValue())

			// cleanup

			// for elided types, we need this
			fundingPubkeyArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = SpliceInit(cType: nativeCallResult, instantiationContext: "SpliceInit.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: "SpliceInit.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the SpliceInit
		internal func clone() -> SpliceInit {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKSpliceInit>) in
					SpliceInit_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = SpliceInit(
				cType: nativeCallResult, instantiationContext: "SpliceInit.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two SpliceInits contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: SpliceInit, b: SpliceInit) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKSpliceInit>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKSpliceInit>) in
						SpliceInit_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the SpliceInit object into a byte array which can be read by SpliceInit_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKSpliceInit>) in
					SpliceInit_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "SpliceInit.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a SpliceInit from a byte array, created by SpliceInit_write
		public class func read(ser: [UInt8]) -> Result_SpliceInitDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "SpliceInit.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = SpliceInit_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_SpliceInitDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "SpliceInit.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> SpliceInit {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> SpliceInit {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> SpliceInit {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> SpliceInit {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing SpliceInit \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing SpliceInit \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

