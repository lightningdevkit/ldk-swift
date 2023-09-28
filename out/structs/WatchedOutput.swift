#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A transaction output watched by a [`ChannelMonitor`] for spends on-chain.
///
/// Used to convey to a [`Filter`] such an output with a given spending condition. Any transaction
/// spending the output must be given to [`ChannelMonitor::block_connected`] either directly or via
/// [`Confirm::transactions_confirmed`].
///
/// If `block_hash` is `Some`, this indicates the output was created in the corresponding block and
/// may have been spent there. See [`Filter::register_output`] for details.
///
/// [`ChannelMonitor`]: channelmonitor::ChannelMonitor
/// [`ChannelMonitor::block_connected`]: channelmonitor::ChannelMonitor::block_connected
public typealias WatchedOutput = Bindings.WatchedOutput

extension Bindings {


	/// A transaction output watched by a [`ChannelMonitor`] for spends on-chain.
	///
	/// Used to convey to a [`Filter`] such an output with a given spending condition. Any transaction
	/// spending the output must be given to [`ChannelMonitor::block_connected`] either directly or via
	/// [`Confirm::transactions_confirmed`].
	///
	/// If `block_hash` is `Some`, this indicates the output was created in the corresponding block and
	/// may have been spent there. See [`Filter::register_output`] for details.
	///
	/// [`ChannelMonitor`]: channelmonitor::ChannelMonitor
	/// [`ChannelMonitor::block_connected`]: channelmonitor::ChannelMonitor::block_connected
	public class WatchedOutput: NativeTypeWrapper {

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

		internal var cType: LDKWatchedOutput?

		internal init(cType: LDKWatchedOutput, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKWatchedOutput, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKWatchedOutput, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the WatchedOutput, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = WatchedOutput_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// First block where the transaction output may have been spent.
		public func getBlockHash() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKWatchedOutput>) in
					WatchedOutput_get_block_hash(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_ThirtyTwoBytesZ(
				cType: nativeCallResult, instantiationContext: "WatchedOutput.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// First block where the transaction output may have been spent.
		public func setBlockHash(val: [UInt8]?) {
			// native call variable prep

			let valOption = Option_ThirtyTwoBytesZ(
				some: val, instantiationContext: "WatchedOutput.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKWatchedOutput>) in
					WatchedOutput_set_block_hash(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Outpoint identifying the transaction output.
		public func getOutpoint() -> OutPoint {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKWatchedOutput>) in
					WatchedOutput_get_outpoint(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = OutPoint(
				cType: nativeCallResult, instantiationContext: "WatchedOutput.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Outpoint identifying the transaction output.
		public func setOutpoint(val: OutPoint) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKWatchedOutput>) in
					WatchedOutput_set_outpoint(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Spending condition of the transaction output.
		public func getScriptPubkey() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKWatchedOutput>) in
					WatchedOutput_get_script_pubkey(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = u8slice(
				cType: nativeCallResult, instantiationContext: "WatchedOutput.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle().getValue()


			return returnValue
		}

		/// Spending condition of the transaction output.
		public func setScriptPubkey(val: [UInt8]) {
			// native call variable prep

			let valVector = Vec_u8Z(array: val, instantiationContext: "WatchedOutput.swift::\(#function):\(#line)")
				.dangle()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKWatchedOutput>) in
					WatchedOutput_set_script_pubkey(thisPtrPointer, valVector.cType!)
				}


			// cleanup

			// valVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new WatchedOutput given each field
		public init(blockHashArg: [UInt8]?, outpointArg: OutPoint, scriptPubkeyArg: [UInt8]) {
			// native call variable prep

			let blockHashArgOption = Option_ThirtyTwoBytesZ(
				some: blockHashArg, instantiationContext: "WatchedOutput.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let scriptPubkeyArgVector = Vec_u8Z(
				array: scriptPubkeyArg, instantiationContext: "WatchedOutput.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = WatchedOutput_new(
				blockHashArgOption.cType!, outpointArg.dynamicallyDangledClone().cType!, scriptPubkeyArgVector.cType!)

			// cleanup

			// scriptPubkeyArgVector.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = WatchedOutput(cType: nativeCallResult, instantiationContext: "WatchedOutput.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "WatchedOutput.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the WatchedOutput
		internal func clone() -> WatchedOutput {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKWatchedOutput>) in
					WatchedOutput_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = WatchedOutput(
				cType: nativeCallResult, instantiationContext: "WatchedOutput.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two WatchedOutputs contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: WatchedOutput, b: WatchedOutput) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKWatchedOutput>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKWatchedOutput>) in
						WatchedOutput_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the WatchedOutput.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKWatchedOutput>) in
					WatchedOutput_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


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


		internal func danglingClone() -> WatchedOutput {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> WatchedOutput {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> WatchedOutput {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> WatchedOutput {
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
						"Freeing WatchedOutput \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing WatchedOutput \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

