#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// An [`update_add_htlc`] message to be sent to or received from a peer.
///
/// [`update_add_htlc`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#adding-an-htlc-update_add_htlc
public typealias UpdateAddHTLC = Bindings.UpdateAddHTLC

extension Bindings {


	/// An [`update_add_htlc`] message to be sent to or received from a peer.
	///
	/// [`update_add_htlc`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#adding-an-htlc-update_add_htlc
	public class UpdateAddHTLC: NativeTypeWrapper {

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

		internal var cType: LDKUpdateAddHTLC?

		internal init(cType: LDKUpdateAddHTLC, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKUpdateAddHTLC, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKUpdateAddHTLC, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the UpdateAddHTLC, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = UpdateAddHTLC_free(self.cType!)

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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUpdateAddHTLC>) in
					UpdateAddHTLC_get_channel_id(thisPtrPointer)
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
				value: val, instantiationContext: "UpdateAddHTLC.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUpdateAddHTLC>) in
					UpdateAddHTLC_set_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The HTLC ID
		public func getHtlcId() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUpdateAddHTLC>) in
					UpdateAddHTLC_get_htlc_id(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The HTLC ID
		public func setHtlcId(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUpdateAddHTLC>) in
					UpdateAddHTLC_set_htlc_id(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The HTLC value in milli-satoshi
		public func getAmountMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUpdateAddHTLC>) in
					UpdateAddHTLC_get_amount_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The HTLC value in milli-satoshi
		public func setAmountMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUpdateAddHTLC>) in
					UpdateAddHTLC_set_amount_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The payment hash, the pre-image of which controls HTLC redemption
		public func getPaymentHash() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUpdateAddHTLC>) in
					UpdateAddHTLC_get_payment_hash(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// The payment hash, the pre-image of which controls HTLC redemption
		public func setPaymentHash(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ThirtyTwoBytes(
				value: val, instantiationContext: "UpdateAddHTLC.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUpdateAddHTLC>) in
					UpdateAddHTLC_set_payment_hash(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The expiry height of the HTLC
		public func getCltvExpiry() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUpdateAddHTLC>) in
					UpdateAddHTLC_get_cltv_expiry(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The expiry height of the HTLC
		public func setCltvExpiry(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUpdateAddHTLC>) in
					UpdateAddHTLC_set_cltv_expiry(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The extra fee skimmed by the sender of this message. See
		/// [`ChannelConfig::accept_underpaying_htlcs`].
		///
		/// [`ChannelConfig::accept_underpaying_htlcs`]: crate::util::config::ChannelConfig::accept_underpaying_htlcs
		public func getSkimmedFeeMsat() -> UInt64? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUpdateAddHTLC>) in
					UpdateAddHTLC_get_skimmed_fee_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "UpdateAddHTLC.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// The extra fee skimmed by the sender of this message. See
		/// [`ChannelConfig::accept_underpaying_htlcs`].
		///
		/// [`ChannelConfig::accept_underpaying_htlcs`]: crate::util::config::ChannelConfig::accept_underpaying_htlcs
		public func setSkimmedFeeMsat(val: UInt64?) {
			// native call variable prep

			let valOption = Option_u64Z(some: val, instantiationContext: "UpdateAddHTLC.swift::\(#function):\(#line)")
				.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUpdateAddHTLC>) in
					UpdateAddHTLC_set_skimmed_fee_msat(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The onion routing packet with encrypted data for the next hop.
		public func getOnionRoutingPacket() -> OnionPacket {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUpdateAddHTLC>) in
					UpdateAddHTLC_get_onion_routing_packet(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = OnionPacket(
				cType: nativeCallResult, instantiationContext: "UpdateAddHTLC.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The onion routing packet with encrypted data for the next hop.
		public func setOnionRoutingPacket(val: OnionPacket) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUpdateAddHTLC>) in
					UpdateAddHTLC_set_onion_routing_packet(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Provided if we are relaying or receiving a payment within a blinded path, to decrypt the onion
		/// routing packet and the recipient-provided encrypted payload within.
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func getBlindingPoint() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUpdateAddHTLC>) in
					UpdateAddHTLC_get_blinding_point(thisPtrPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustPrimitiveWrapper
			// Type: LDKPublicKey

			if nativeCallResult.compressed_form == Bindings.arrayToUInt8Tuple33(array: [UInt8](repeating: 0, count: 33))
			{
				return nil
			}


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "UpdateAddHTLC.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Provided if we are relaying or receiving a payment within a blinded path, to decrypt the onion
		/// routing packet and the recipient-provided encrypted payload within.
		///
		/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func setBlindingPoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "UpdateAddHTLC.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUpdateAddHTLC>) in
					UpdateAddHTLC_set_blinding_point(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new UpdateAddHTLC given each field
		///
		/// Note that blinding_point_arg (or a relevant inner pointer) may be NULL or all-0s to represent None
		public init(
			channelIdArg: [UInt8], htlcIdArg: UInt64, amountMsatArg: UInt64, paymentHashArg: [UInt8],
			cltvExpiryArg: UInt32, skimmedFeeMsatArg: UInt64?, onionRoutingPacketArg: OnionPacket,
			blindingPointArg: [UInt8]
		) {
			// native call variable prep

			let channelIdArgPrimitiveWrapper = ThirtyTwoBytes(
				value: channelIdArg, instantiationContext: "UpdateAddHTLC.swift::\(#function):\(#line)")

			let paymentHashArgPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHashArg, instantiationContext: "UpdateAddHTLC.swift::\(#function):\(#line)")

			let skimmedFeeMsatArgOption = Option_u64Z(
				some: skimmedFeeMsatArg, instantiationContext: "UpdateAddHTLC.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let blindingPointArgPrimitiveWrapper = PublicKey(
				value: blindingPointArg, instantiationContext: "UpdateAddHTLC.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = UpdateAddHTLC_new(
				channelIdArgPrimitiveWrapper.cType!, htlcIdArg, amountMsatArg, paymentHashArgPrimitiveWrapper.cType!,
				cltvExpiryArg, skimmedFeeMsatArgOption.cType!, onionRoutingPacketArg.dynamicallyDangledClone().cType!,
				blindingPointArgPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			channelIdArgPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			paymentHashArgPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			blindingPointArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = UpdateAddHTLC(cType: nativeCallResult, instantiationContext: "UpdateAddHTLC.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "UpdateAddHTLC.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the UpdateAddHTLC
		internal func clone() -> UpdateAddHTLC {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKUpdateAddHTLC>) in
					UpdateAddHTLC_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = UpdateAddHTLC(
				cType: nativeCallResult, instantiationContext: "UpdateAddHTLC.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the UpdateAddHTLC.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKUpdateAddHTLC>) in
					UpdateAddHTLC_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two UpdateAddHTLCs contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: UpdateAddHTLC, b: UpdateAddHTLC) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKUpdateAddHTLC>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKUpdateAddHTLC>) in
						UpdateAddHTLC_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the UpdateAddHTLC object into a byte array which can be read by UpdateAddHTLC_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKUpdateAddHTLC>) in
					UpdateAddHTLC_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "UpdateAddHTLC.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a UpdateAddHTLC from a byte array, created by UpdateAddHTLC_write
		public class func read(ser: [UInt8]) -> Result_UpdateAddHTLCDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "UpdateAddHTLC.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = UpdateAddHTLC_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_UpdateAddHTLCDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "UpdateAddHTLC.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> UpdateAddHTLC {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> UpdateAddHTLC {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> UpdateAddHTLC {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> UpdateAddHTLC {
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
						"Freeing UpdateAddHTLC \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing UpdateAddHTLC \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

