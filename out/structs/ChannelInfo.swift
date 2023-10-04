#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Details about a channel (both directions).
/// Received within a channel announcement.
public typealias ChannelInfo = Bindings.ChannelInfo

extension Bindings {


	/// Details about a channel (both directions).
	/// Received within a channel announcement.
	public class ChannelInfo: NativeTypeWrapper {

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

		internal var cType: LDKChannelInfo?

		internal init(cType: LDKChannelInfo, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKChannelInfo, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKChannelInfo, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the ChannelInfo, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ChannelInfo_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Protocol features of a channel communicated during its announcement
		public func getFeatures() -> ChannelFeatures {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelInfo>) in
					ChannelInfo_get_features(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelFeatures(
				cType: nativeCallResult, instantiationContext: "ChannelInfo.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Protocol features of a channel communicated during its announcement
		public func setFeatures(val: ChannelFeatures) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelInfo>) in
					ChannelInfo_set_features(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Source node of the first direction of a channel
		public func getNodeOne() -> NodeId {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelInfo>) in
					ChannelInfo_get_node_one(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NodeId(
				cType: nativeCallResult, instantiationContext: "ChannelInfo.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Source node of the first direction of a channel
		public func setNodeOne(val: NodeId) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelInfo>) in
					ChannelInfo_set_node_one(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Details about the first direction of a channel
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func getOneToTwo() -> ChannelUpdateInfo? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelInfo>) in
					ChannelInfo_get_one_to_two(thisPtrPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKChannelUpdateInfo

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = ChannelUpdateInfo(
				cType: nativeCallResult, instantiationContext: "ChannelInfo.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Details about the first direction of a channel
		///
		/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func setOneToTwo(val: ChannelUpdateInfo) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelInfo>) in
					ChannelInfo_set_one_to_two(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Source node of the second direction of a channel
		public func getNodeTwo() -> NodeId {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelInfo>) in
					ChannelInfo_get_node_two(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NodeId(
				cType: nativeCallResult, instantiationContext: "ChannelInfo.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Source node of the second direction of a channel
		public func setNodeTwo(val: NodeId) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelInfo>) in
					ChannelInfo_set_node_two(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Details about the second direction of a channel
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func getTwoToOne() -> ChannelUpdateInfo? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelInfo>) in
					ChannelInfo_get_two_to_one(thisPtrPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKChannelUpdateInfo

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = ChannelUpdateInfo(
				cType: nativeCallResult, instantiationContext: "ChannelInfo.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Details about the second direction of a channel
		///
		/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func setTwoToOne(val: ChannelUpdateInfo) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelInfo>) in
					ChannelInfo_set_two_to_one(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The channel capacity as seen on-chain, if chain lookup is available.
		public func getCapacitySats() -> UInt64? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelInfo>) in
					ChannelInfo_get_capacity_sats(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "ChannelInfo.swift::\(#function):\(#line)", anchor: self
			)
			.getValue()


			return returnValue
		}

		/// The channel capacity as seen on-chain, if chain lookup is available.
		public func setCapacitySats(val: UInt64?) {
			// native call variable prep

			let valOption = Option_u64Z(some: val, instantiationContext: "ChannelInfo.swift::\(#function):\(#line)")
				.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelInfo>) in
					ChannelInfo_set_capacity_sats(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// An initial announcement of the channel
		/// Mostly redundant with the data we store in fields explicitly.
		/// Everything else is useful only for sending out for initial routing sync.
		/// Not stored if contains excess data to prevent DoS.
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func getAnnouncementMessage() -> ChannelAnnouncement? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelInfo>) in
					ChannelInfo_get_announcement_message(thisPtrPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKChannelAnnouncement

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = ChannelAnnouncement(
				cType: nativeCallResult, instantiationContext: "ChannelInfo.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// An initial announcement of the channel
		/// Mostly redundant with the data we store in fields explicitly.
		/// Everything else is useful only for sending out for initial routing sync.
		/// Not stored if contains excess data to prevent DoS.
		///
		/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func setAnnouncementMessage(val: ChannelAnnouncement) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelInfo>) in
					ChannelInfo_set_announcement_message(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the ChannelInfo
		internal func clone() -> ChannelInfo {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKChannelInfo>) in
					ChannelInfo_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelInfo(
				cType: nativeCallResult, instantiationContext: "ChannelInfo.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two ChannelInfos contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: ChannelInfo, b: ChannelInfo) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKChannelInfo>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKChannelInfo>) in
						ChannelInfo_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns a [`ChannelUpdateInfo`] based on the direction implied by the channel_flag.
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func getDirectionalInfo(channelFlags: UInt8) -> ChannelUpdateInfo? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelInfo>) in
					ChannelInfo_get_directional_info(thisArgPointer, channelFlags)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKChannelUpdateInfo

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = ChannelUpdateInfo(
				cType: nativeCallResult, instantiationContext: "ChannelInfo.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Serialize the ChannelInfo object into a byte array which can be read by ChannelInfo_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKChannelInfo>) in
					ChannelInfo_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "ChannelInfo.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a ChannelInfo from a byte array, created by ChannelInfo_write
		public class func read(ser: [UInt8]) -> Result_ChannelInfoDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "ChannelInfo.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = ChannelInfo_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_ChannelInfoDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelInfo.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> ChannelInfo {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> ChannelInfo {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> ChannelInfo {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> ChannelInfo {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing ChannelInfo \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ChannelInfo \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

