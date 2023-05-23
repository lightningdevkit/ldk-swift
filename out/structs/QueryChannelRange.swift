#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A [`query_channel_range`] message is used to query a peer for channel
/// UTXOs in a range of blocks. The recipient of a query makes a best
/// effort to reply to the query using one or more [`ReplyChannelRange`]
/// messages.
///
/// [`query_channel_range`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#the-query_channel_range-and-reply_channel_range-messages
public typealias QueryChannelRange = Bindings.QueryChannelRange

extension Bindings {


	/// A [`query_channel_range`] message is used to query a peer for channel
	/// UTXOs in a range of blocks. The recipient of a query makes a best
	/// effort to reply to the query using one or more [`ReplyChannelRange`]
	/// messages.
	///
	/// [`query_channel_range`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#the-query_channel_range-and-reply_channel_range-messages
	public class QueryChannelRange: NativeTypeWrapper {

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

		internal var cType: LDKQueryChannelRange?

		internal init(cType: LDKQueryChannelRange, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKQueryChannelRange, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKQueryChannelRange, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the QueryChannelRange, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = QueryChannelRange_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The genesis hash of the blockchain being queried
		public func getChainHash() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKQueryChannelRange>) in
					QueryChannelRange_get_chain_hash(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// The genesis hash of the blockchain being queried
		public func setChainHash(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ThirtyTwoBytes(
				value: val, instantiationContext: "QueryChannelRange.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKQueryChannelRange>) in
					QueryChannelRange_set_chain_hash(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The height of the first block for the channel UTXOs being queried
		public func getFirstBlocknum() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKQueryChannelRange>) in
					QueryChannelRange_get_first_blocknum(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The height of the first block for the channel UTXOs being queried
		public func setFirstBlocknum(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKQueryChannelRange>) in
					QueryChannelRange_set_first_blocknum(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The number of blocks to include in the query results
		public func getNumberOfBlocks() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKQueryChannelRange>) in
					QueryChannelRange_get_number_of_blocks(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The number of blocks to include in the query results
		public func setNumberOfBlocks(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKQueryChannelRange>) in
					QueryChannelRange_set_number_of_blocks(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new QueryChannelRange given each field
		public init(chainHashArg: [UInt8], firstBlocknumArg: UInt32, numberOfBlocksArg: UInt32) {
			// native call variable prep

			let chainHashArgPrimitiveWrapper = ThirtyTwoBytes(
				value: chainHashArg, instantiationContext: "QueryChannelRange.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = QueryChannelRange_new(
				chainHashArgPrimitiveWrapper.cType!, firstBlocknumArg, numberOfBlocksArg)

			// cleanup

			// for elided types, we need this
			chainHashArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = QueryChannelRange(cType: nativeCallResult, instantiationContext: "QueryChannelRange.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "QueryChannelRange.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the QueryChannelRange
		internal func clone() -> QueryChannelRange {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKQueryChannelRange>) in
					QueryChannelRange_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = QueryChannelRange(
				cType: nativeCallResult, instantiationContext: "QueryChannelRange.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two QueryChannelRanges contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: QueryChannelRange, b: QueryChannelRange) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKQueryChannelRange>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKQueryChannelRange>) in
						QueryChannelRange_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Calculates the overflow safe ending block height for the query.
		///
		/// Overflow returns `0xffffffff`, otherwise returns `first_blocknum + number_of_blocks`.
		public func endBlocknum() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKQueryChannelRange>) in
					QueryChannelRange_end_blocknum(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the QueryChannelRange object into a byte array which can be read by QueryChannelRange_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKQueryChannelRange>) in
					QueryChannelRange_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "QueryChannelRange.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a QueryChannelRange from a byte array, created by QueryChannelRange_write
		public class func read(ser: [UInt8]) -> Result_QueryChannelRangeDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "QueryChannelRange.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = QueryChannelRange_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_QueryChannelRangeDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "QueryChannelRange.swift::\(#function):\(#line)")


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


		internal func dangle(_ shouldDangle: Bool = true) -> QueryChannelRange {
			self.dangling = shouldDangle
			return self
		}


		internal func danglingClone() -> QueryChannelRange {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> QueryChannelRange {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> QueryChannelRange {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> QueryChannelRange {
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
						"Freeing QueryChannelRange \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing QueryChannelRange \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

