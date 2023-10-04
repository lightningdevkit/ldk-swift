#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A [`reply_short_channel_ids_end`] message is sent as a reply to a
/// message. The query recipient makes a best
/// effort to respond based on their local network view which may not be
/// a perfect view of the network.
///
/// [`reply_short_channel_ids_end`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#the-query_short_channel_idsreply_short_channel_ids_end-messages
public typealias ReplyShortChannelIdsEnd = Bindings.ReplyShortChannelIdsEnd

extension Bindings {


	/// A [`reply_short_channel_ids_end`] message is sent as a reply to a
	/// message. The query recipient makes a best
	/// effort to respond based on their local network view which may not be
	/// a perfect view of the network.
	///
	/// [`reply_short_channel_ids_end`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#the-query_short_channel_idsreply_short_channel_ids_end-messages
	public class ReplyShortChannelIdsEnd: NativeTypeWrapper {

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

		internal var cType: LDKReplyShortChannelIdsEnd?

		internal init(cType: LDKReplyShortChannelIdsEnd, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKReplyShortChannelIdsEnd, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKReplyShortChannelIdsEnd, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Frees any resources used by the ReplyShortChannelIdsEnd, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ReplyShortChannelIdsEnd_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The genesis hash of the blockchain that was queried
		public func getChainHash() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
					ReplyShortChannelIdsEnd_get_chain_hash(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// The genesis hash of the blockchain that was queried
		public func setChainHash(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ThirtyTwoBytes(
				value: val, instantiationContext: "ReplyShortChannelIdsEnd.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKReplyShortChannelIdsEnd>) in
					ReplyShortChannelIdsEnd_set_chain_hash(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Indicates if the query recipient maintains up-to-date channel
		/// information for the `chain_hash`
		public func getFullInformation() -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
					ReplyShortChannelIdsEnd_get_full_information(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Indicates if the query recipient maintains up-to-date channel
		/// information for the `chain_hash`
		public func setFullInformation(val: Bool) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKReplyShortChannelIdsEnd>) in
					ReplyShortChannelIdsEnd_set_full_information(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new ReplyShortChannelIdsEnd given each field
		public init(chainHashArg: [UInt8], fullInformationArg: Bool) {
			// native call variable prep

			let chainHashArgPrimitiveWrapper = ThirtyTwoBytes(
				value: chainHashArg, instantiationContext: "ReplyShortChannelIdsEnd.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = ReplyShortChannelIdsEnd_new(chainHashArgPrimitiveWrapper.cType!, fullInformationArg)

			// cleanup

			// for elided types, we need this
			chainHashArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = ReplyShortChannelIdsEnd(cType: nativeCallResult, instantiationContext: "ReplyShortChannelIdsEnd.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "ReplyShortChannelIdsEnd.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the ReplyShortChannelIdsEnd
		internal func clone() -> ReplyShortChannelIdsEnd {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
					ReplyShortChannelIdsEnd_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ReplyShortChannelIdsEnd(
				cType: nativeCallResult, instantiationContext: "ReplyShortChannelIdsEnd.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two ReplyShortChannelIdsEnds contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: ReplyShortChannelIdsEnd, b: ReplyShortChannelIdsEnd) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
						ReplyShortChannelIdsEnd_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the ReplyShortChannelIdsEnd object into a byte array which can be read by ReplyShortChannelIdsEnd_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
					ReplyShortChannelIdsEnd_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "ReplyShortChannelIdsEnd.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a ReplyShortChannelIdsEnd from a byte array, created by ReplyShortChannelIdsEnd_write
		public class func read(ser: [UInt8]) -> Result_ReplyShortChannelIdsEndDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "ReplyShortChannelIdsEnd.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = ReplyShortChannelIdsEnd_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_ReplyShortChannelIdsEndDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "ReplyShortChannelIdsEnd.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> ReplyShortChannelIdsEnd {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> ReplyShortChannelIdsEnd {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> ReplyShortChannelIdsEnd {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> ReplyShortChannelIdsEnd {
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
						"Freeing ReplyShortChannelIdsEnd \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ReplyShortChannelIdsEnd \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

