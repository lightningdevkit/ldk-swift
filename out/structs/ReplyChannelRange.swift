#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A [`reply_channel_range`] message is a reply to a [`QueryChannelRange`]
/// message.
///
/// Multiple `reply_channel_range` messages can be sent in reply
/// to a single [`QueryChannelRange`] message. The query recipient makes a
/// best effort to respond based on their local network view which may
/// not be a perfect view of the network. The `short_channel_id`s in the
/// reply are encoded. We only support `encoding_type=0` uncompressed
/// serialization and do not support `encoding_type=1` zlib serialization.
///
/// [`reply_channel_range`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#the-query_channel_range-and-reply_channel_range-messages
public typealias ReplyChannelRange = Bindings.ReplyChannelRange

extension Bindings {


	/// A [`reply_channel_range`] message is a reply to a [`QueryChannelRange`]
	/// message.
	///
	/// Multiple `reply_channel_range` messages can be sent in reply
	/// to a single [`QueryChannelRange`] message. The query recipient makes a
	/// best effort to respond based on their local network view which may
	/// not be a perfect view of the network. The `short_channel_id`s in the
	/// reply are encoded. We only support `encoding_type=0` uncompressed
	/// serialization and do not support `encoding_type=1` zlib serialization.
	///
	/// [`reply_channel_range`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#the-query_channel_range-and-reply_channel_range-messages
	public class ReplyChannelRange: NativeTypeWrapper {

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

		internal var cType: LDKReplyChannelRange?

		internal init(cType: LDKReplyChannelRange, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKReplyChannelRange, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKReplyChannelRange, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the ReplyChannelRange, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ReplyChannelRange_free(self.cType!)

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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKReplyChannelRange>) in
					ReplyChannelRange_get_chain_hash(thisPtrPointer)
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
				value: val, instantiationContext: "ReplyChannelRange.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKReplyChannelRange>) in
					ReplyChannelRange_set_chain_hash(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The height of the first block in the range of the reply
		public func getFirstBlocknum() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKReplyChannelRange>) in
					ReplyChannelRange_get_first_blocknum(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The height of the first block in the range of the reply
		public func setFirstBlocknum(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKReplyChannelRange>) in
					ReplyChannelRange_set_first_blocknum(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The number of blocks included in the range of the reply
		public func getNumberOfBlocks() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKReplyChannelRange>) in
					ReplyChannelRange_get_number_of_blocks(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The number of blocks included in the range of the reply
		public func setNumberOfBlocks(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKReplyChannelRange>) in
					ReplyChannelRange_set_number_of_blocks(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// True when this is the final reply for a query
		public func getSyncComplete() -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKReplyChannelRange>) in
					ReplyChannelRange_get_sync_complete(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// True when this is the final reply for a query
		public func setSyncComplete(val: Bool) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKReplyChannelRange>) in
					ReplyChannelRange_set_sync_complete(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The `short_channel_id`s in the channel range
		///
		/// Returns a copy of the field.
		public func getShortChannelIds() -> [UInt64] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKReplyChannelRange>) in
					ReplyChannelRange_get_short_channel_ids(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u64Z(
				cType: nativeCallResult, instantiationContext: "ReplyChannelRange.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The `short_channel_id`s in the channel range
		public func setShortChannelIds(val: [UInt64]) {
			// native call variable prep

			let valVector = Vec_u64Z(array: val, instantiationContext: "ReplyChannelRange.swift::\(#function):\(#line)")
				.dangle()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKReplyChannelRange>) in
					ReplyChannelRange_set_short_channel_ids(thisPtrPointer, valVector.cType!)
				}


			// cleanup

			// valVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new ReplyChannelRange given each field
		public init(
			chainHashArg: [UInt8], firstBlocknumArg: UInt32, numberOfBlocksArg: UInt32, syncCompleteArg: Bool,
			shortChannelIdsArg: [UInt64]
		) {
			// native call variable prep

			let chainHashArgPrimitiveWrapper = ThirtyTwoBytes(
				value: chainHashArg, instantiationContext: "ReplyChannelRange.swift::\(#function):\(#line)")

			let shortChannelIdsArgVector = Vec_u64Z(
				array: shortChannelIdsArg, instantiationContext: "ReplyChannelRange.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = ReplyChannelRange_new(
				chainHashArgPrimitiveWrapper.cType!, firstBlocknumArg, numberOfBlocksArg, syncCompleteArg,
				shortChannelIdsArgVector.cType!)

			// cleanup

			// for elided types, we need this
			chainHashArgPrimitiveWrapper.noOpRetain()

			// shortChannelIdsArgVector.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = ReplyChannelRange(cType: nativeCallResult, instantiationContext: "ReplyChannelRange.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "ReplyChannelRange.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the ReplyChannelRange
		internal func clone() -> ReplyChannelRange {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKReplyChannelRange>) in
					ReplyChannelRange_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ReplyChannelRange(
				cType: nativeCallResult, instantiationContext: "ReplyChannelRange.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two ReplyChannelRanges contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: ReplyChannelRange, b: ReplyChannelRange) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKReplyChannelRange>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKReplyChannelRange>) in
						ReplyChannelRange_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Read a ReplyChannelRange from a byte array, created by ReplyChannelRange_write
		public class func read(ser: [UInt8]) -> Result_ReplyChannelRangeDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "ReplyChannelRange.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = ReplyChannelRange_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_ReplyChannelRangeDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "ReplyChannelRange.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Serialize the ReplyChannelRange object into a byte array which can be read by ReplyChannelRange_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKReplyChannelRange>) in
					ReplyChannelRange_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "ReplyChannelRange.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


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


		internal func dangle(_ shouldDangle: Bool = true) -> ReplyChannelRange {
			self.dangling = shouldDangle
			return self
		}

		internal func dangleRecursively() -> ReplyChannelRange {
			self.dangling = true
			for currentAnchor in self.anchors {
				currentAnchor.dangleRecursively()
			}
			return self
		}


		internal func danglingClone() -> ReplyChannelRange {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> ReplyChannelRange {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> ReplyChannelRange {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> ReplyChannelRange {
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
						"Freeing ReplyChannelRange \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ReplyChannelRange \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

