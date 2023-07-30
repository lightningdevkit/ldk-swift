#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A [`query_short_channel_ids`] message is used to query a peer for
/// routing gossip messages related to one or more `short_channel_id`s.
///
/// The query recipient will reply with the latest, if available,
/// [`ChannelAnnouncement`], [`ChannelUpdate`] and [`NodeAnnouncement`] messages
/// it maintains for the requested `short_channel_id`s followed by a
/// [`ReplyShortChannelIdsEnd`] message. The `short_channel_id`s sent in
/// this query are encoded. We only support `encoding_type=0` uncompressed
/// serialization and do not support `encoding_type=1` zlib serialization.
///
/// [`query_short_channel_ids`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#the-query_short_channel_idsreply_short_channel_ids_end-messages
public typealias QueryShortChannelIds = Bindings.QueryShortChannelIds

extension Bindings {


	/// A [`query_short_channel_ids`] message is used to query a peer for
	/// routing gossip messages related to one or more `short_channel_id`s.
	///
	/// The query recipient will reply with the latest, if available,
	/// [`ChannelAnnouncement`], [`ChannelUpdate`] and [`NodeAnnouncement`] messages
	/// it maintains for the requested `short_channel_id`s followed by a
	/// [`ReplyShortChannelIdsEnd`] message. The `short_channel_id`s sent in
	/// this query are encoded. We only support `encoding_type=0` uncompressed
	/// serialization and do not support `encoding_type=1` zlib serialization.
	///
	/// [`query_short_channel_ids`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#the-query_short_channel_idsreply_short_channel_ids_end-messages
	public class QueryShortChannelIds: NativeTypeWrapper {

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

		internal var cType: LDKQueryShortChannelIds?

		internal init(cType: LDKQueryShortChannelIds, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKQueryShortChannelIds, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKQueryShortChannelIds, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the QueryShortChannelIds, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = QueryShortChannelIds_free(self.cType!)

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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKQueryShortChannelIds>) in
					QueryShortChannelIds_get_chain_hash(thisPtrPointer)
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
				value: val, instantiationContext: "QueryShortChannelIds.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKQueryShortChannelIds>) in
					QueryShortChannelIds_set_chain_hash(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The short_channel_ids that are being queried
		///
		/// Returns a copy of the field.
		public func getShortChannelIds() -> [UInt64] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKQueryShortChannelIds>) in
					QueryShortChannelIds_get_short_channel_ids(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u64Z(
				cType: nativeCallResult, instantiationContext: "QueryShortChannelIds.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The short_channel_ids that are being queried
		public func setShortChannelIds(val: [UInt64]) {
			// native call variable prep

			let valVector = Vec_u64Z(
				array: val, instantiationContext: "QueryShortChannelIds.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKQueryShortChannelIds>) in
					QueryShortChannelIds_set_short_channel_ids(thisPtrPointer, valVector.cType!)
				}


			// cleanup

			// valVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new QueryShortChannelIds given each field
		public init(chainHashArg: [UInt8], shortChannelIdsArg: [UInt64]) {
			// native call variable prep

			let chainHashArgPrimitiveWrapper = ThirtyTwoBytes(
				value: chainHashArg, instantiationContext: "QueryShortChannelIds.swift::\(#function):\(#line)")

			let shortChannelIdsArgVector = Vec_u64Z(
				array: shortChannelIdsArg, instantiationContext: "QueryShortChannelIds.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = QueryShortChannelIds_new(
				chainHashArgPrimitiveWrapper.cType!, shortChannelIdsArgVector.cType!)

			// cleanup

			// for elided types, we need this
			chainHashArgPrimitiveWrapper.noOpRetain()

			// shortChannelIdsArgVector.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = QueryShortChannelIds(cType: nativeCallResult, instantiationContext: "QueryShortChannelIds.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "QueryShortChannelIds.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the QueryShortChannelIds
		internal func clone() -> QueryShortChannelIds {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKQueryShortChannelIds>) in
					QueryShortChannelIds_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = QueryShortChannelIds(
				cType: nativeCallResult, instantiationContext: "QueryShortChannelIds.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two QueryShortChannelIdss contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: QueryShortChannelIds, b: QueryShortChannelIds) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKQueryShortChannelIds>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKQueryShortChannelIds>) in
						QueryShortChannelIds_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Read a QueryShortChannelIds from a byte array, created by QueryShortChannelIds_write
		public class func read(ser: [UInt8]) -> Result_QueryShortChannelIdsDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "QueryShortChannelIds.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = QueryShortChannelIds_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_QueryShortChannelIdsDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "QueryShortChannelIds.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Serialize the QueryShortChannelIds object into a byte array which can be read by QueryShortChannelIds_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKQueryShortChannelIds>) in
					QueryShortChannelIds_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "QueryShortChannelIds.swift::\(#function):\(#line)",
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


		internal func dangle(_ shouldDangle: Bool = true) -> QueryShortChannelIds {
			self.dangling = shouldDangle
			return self
		}

		internal func dangleRecursively() -> QueryShortChannelIds {
			self.dangling = true
			for currentAnchor in self.anchors {
				currentAnchor.dangleRecursively()
			}
			return self
		}


		internal func danglingClone() -> QueryShortChannelIds {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> QueryShortChannelIds {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> QueryShortChannelIds {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> QueryShortChannelIds {
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
						"Freeing QueryShortChannelIds \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing QueryShortChannelIds \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

