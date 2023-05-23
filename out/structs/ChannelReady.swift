#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A [`channel_ready`] message to be sent to or received from a peer.
///
/// [`channel_ready`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#the-channel_ready-message
public typealias ChannelReady = Bindings.ChannelReady

extension Bindings {


	/// A [`channel_ready`] message to be sent to or received from a peer.
	///
	/// [`channel_ready`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#the-channel_ready-message
	public class ChannelReady: NativeTypeWrapper {

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

		internal var cType: LDKChannelReady?

		internal init(cType: LDKChannelReady, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKChannelReady, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKChannelReady, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the ChannelReady, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ChannelReady_free(self.cType!)

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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelReady>) in
					ChannelReady_get_channel_id(thisPtrPointer)
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
				value: val, instantiationContext: "ChannelReady.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelReady>) in
					ChannelReady_set_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The per-commitment point of the second commitment transaction
		public func getNextPerCommitmentPoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelReady>) in
					ChannelReady_get_next_per_commitment_point(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "ChannelReady.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The per-commitment point of the second commitment transaction
		public func setNextPerCommitmentPoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "ChannelReady.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelReady>) in
					ChannelReady_set_next_per_commitment_point(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// If set, provides a `short_channel_id` alias for this channel.
		///
		/// The sender will accept payments to be forwarded over this SCID and forward them to this
		/// messages' recipient.
		public func getShortChannelIdAlias() -> UInt64? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelReady>) in
					ChannelReady_get_short_channel_id_alias(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "ChannelReady.swift::\(#function):\(#line)", anchor: self
			)
			.getValue()


			return returnValue
		}

		/// If set, provides a `short_channel_id` alias for this channel.
		///
		/// The sender will accept payments to be forwarded over this SCID and forward them to this
		/// messages' recipient.
		public func setShortChannelIdAlias(val: UInt64?) {
			// native call variable prep

			let valOption = Option_u64Z(some: val, instantiationContext: "ChannelReady.swift::\(#function):\(#line)")
				.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelReady>) in
					ChannelReady_set_short_channel_id_alias(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new ChannelReady given each field
		public init(channelIdArg: [UInt8], nextPerCommitmentPointArg: [UInt8], shortChannelIdAliasArg: UInt64?) {
			// native call variable prep

			let channelIdArgPrimitiveWrapper = ThirtyTwoBytes(
				value: channelIdArg, instantiationContext: "ChannelReady.swift::\(#function):\(#line)")

			let nextPerCommitmentPointArgPrimitiveWrapper = PublicKey(
				value: nextPerCommitmentPointArg, instantiationContext: "ChannelReady.swift::\(#function):\(#line)")

			let shortChannelIdAliasArgOption = Option_u64Z(
				some: shortChannelIdAliasArg, instantiationContext: "ChannelReady.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = ChannelReady_new(
				channelIdArgPrimitiveWrapper.cType!, nextPerCommitmentPointArgPrimitiveWrapper.cType!,
				shortChannelIdAliasArgOption.cType!)

			// cleanup

			// for elided types, we need this
			channelIdArgPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			nextPerCommitmentPointArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = ChannelReady(cType: nativeCallResult, instantiationContext: "ChannelReady.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "ChannelReady.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the ChannelReady
		internal func clone() -> ChannelReady {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKChannelReady>) in
					ChannelReady_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelReady(
				cType: nativeCallResult, instantiationContext: "ChannelReady.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two ChannelReadys contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: ChannelReady, b: ChannelReady) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKChannelReady>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKChannelReady>) in
						ChannelReady_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the ChannelReady object into a byte array which can be read by ChannelReady_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKChannelReady>) in
					ChannelReady_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "ChannelReady.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a ChannelReady from a byte array, created by ChannelReady_write
		public class func read(ser: [UInt8]) -> Result_ChannelReadyDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "ChannelReady.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = ChannelReady_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_ChannelReadyDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelReady.swift::\(#function):\(#line)")


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


		internal func dangle(_ shouldDangle: Bool = true) -> ChannelReady {
			self.dangling = shouldDangle
			return self
		}


		internal func danglingClone() -> ChannelReady {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> ChannelReady {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> ChannelReady {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> ChannelReady {
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
						"Freeing ChannelReady \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ChannelReady \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

