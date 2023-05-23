#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// An [`announcement_signatures`] message to be sent to or received from a peer.
///
/// [`announcement_signatures`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#the-announcement_signatures-message
public typealias AnnouncementSignatures = Bindings.AnnouncementSignatures

extension Bindings {


	/// An [`announcement_signatures`] message to be sent to or received from a peer.
	///
	/// [`announcement_signatures`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#the-announcement_signatures-message
	public class AnnouncementSignatures: NativeTypeWrapper {

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

		internal var cType: LDKAnnouncementSignatures?

		internal init(cType: LDKAnnouncementSignatures, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKAnnouncementSignatures, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKAnnouncementSignatures, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Frees any resources used by the AnnouncementSignatures, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = AnnouncementSignatures_free(self.cType!)

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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAnnouncementSignatures>) in
					AnnouncementSignatures_get_channel_id(thisPtrPointer)
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
				value: val, instantiationContext: "AnnouncementSignatures.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAnnouncementSignatures>) in
					AnnouncementSignatures_set_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The short channel ID
		public func getShortChannelId() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAnnouncementSignatures>) in
					AnnouncementSignatures_get_short_channel_id(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The short channel ID
		public func setShortChannelId(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAnnouncementSignatures>) in
					AnnouncementSignatures_set_short_channel_id(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A signature by the node key
		public func getNodeSignature() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAnnouncementSignatures>) in
					AnnouncementSignatures_get_node_signature(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Signature(
				cType: nativeCallResult, instantiationContext: "AnnouncementSignatures.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// A signature by the node key
		public func setNodeSignature(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = Signature(
				value: val, instantiationContext: "AnnouncementSignatures.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAnnouncementSignatures>) in
					AnnouncementSignatures_set_node_signature(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A signature by the funding key
		public func getBitcoinSignature() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAnnouncementSignatures>) in
					AnnouncementSignatures_get_bitcoin_signature(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Signature(
				cType: nativeCallResult, instantiationContext: "AnnouncementSignatures.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// A signature by the funding key
		public func setBitcoinSignature(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = Signature(
				value: val, instantiationContext: "AnnouncementSignatures.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAnnouncementSignatures>) in
					AnnouncementSignatures_set_bitcoin_signature(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new AnnouncementSignatures given each field
		public init(
			channelIdArg: [UInt8], shortChannelIdArg: UInt64, nodeSignatureArg: [UInt8], bitcoinSignatureArg: [UInt8]
		) {
			// native call variable prep

			let channelIdArgPrimitiveWrapper = ThirtyTwoBytes(
				value: channelIdArg, instantiationContext: "AnnouncementSignatures.swift::\(#function):\(#line)")

			let nodeSignatureArgPrimitiveWrapper = Signature(
				value: nodeSignatureArg, instantiationContext: "AnnouncementSignatures.swift::\(#function):\(#line)")

			let bitcoinSignatureArgPrimitiveWrapper = Signature(
				value: bitcoinSignatureArg, instantiationContext: "AnnouncementSignatures.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = AnnouncementSignatures_new(
				channelIdArgPrimitiveWrapper.cType!, shortChannelIdArg, nodeSignatureArgPrimitiveWrapper.cType!,
				bitcoinSignatureArgPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			channelIdArgPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			nodeSignatureArgPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			bitcoinSignatureArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = AnnouncementSignatures(cType: nativeCallResult, instantiationContext: "AnnouncementSignatures.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "AnnouncementSignatures.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the AnnouncementSignatures
		internal func clone() -> AnnouncementSignatures {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKAnnouncementSignatures>) in
					AnnouncementSignatures_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = AnnouncementSignatures(
				cType: nativeCallResult, instantiationContext: "AnnouncementSignatures.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two AnnouncementSignaturess contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: AnnouncementSignatures, b: AnnouncementSignatures) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKAnnouncementSignatures>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKAnnouncementSignatures>) in
						AnnouncementSignatures_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the AnnouncementSignatures object into a byte array which can be read by AnnouncementSignatures_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKAnnouncementSignatures>) in
					AnnouncementSignatures_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "AnnouncementSignatures.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a AnnouncementSignatures from a byte array, created by AnnouncementSignatures_write
		public class func read(ser: [UInt8]) -> Result_AnnouncementSignaturesDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "AnnouncementSignatures.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = AnnouncementSignatures_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_AnnouncementSignaturesDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "AnnouncementSignatures.swift::\(#function):\(#line)")


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


		internal func dangle(_ shouldDangle: Bool = true) -> AnnouncementSignatures {
			self.dangling = shouldDangle
			return self
		}


		internal func danglingClone() -> AnnouncementSignatures {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> AnnouncementSignatures {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> AnnouncementSignatures {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> AnnouncementSignatures {
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
						"Freeing AnnouncementSignatures \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing AnnouncementSignatures \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

