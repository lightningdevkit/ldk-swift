#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Non-relayable information received in the latest node_announcement from this node.
public typealias NodeAnnouncementDetails = Bindings.NodeAnnouncementDetails

extension Bindings {


	/// Non-relayable information received in the latest node_announcement from this node.
	public class NodeAnnouncementDetails: NativeTypeWrapper {

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

		internal var cType: LDKNodeAnnouncementDetails?

		internal init(cType: LDKNodeAnnouncementDetails, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKNodeAnnouncementDetails, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKNodeAnnouncementDetails, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Frees any resources used by the NodeAnnouncementDetails, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = NodeAnnouncementDetails_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Protocol features the node announced support for
		public func getFeatures() -> NodeFeatures {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKNodeAnnouncementDetails>) in
					NodeAnnouncementDetails_get_features(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NodeFeatures(
				cType: nativeCallResult, instantiationContext: "NodeAnnouncementDetails.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Protocol features the node announced support for
		public func setFeatures(val: NodeFeatures) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKNodeAnnouncementDetails>) in
					NodeAnnouncementDetails_set_features(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// When the last known update to the node state was issued.
		/// Value is opaque, as set in the announcement.
		public func getLastUpdate() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKNodeAnnouncementDetails>) in
					NodeAnnouncementDetails_get_last_update(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// When the last known update to the node state was issued.
		/// Value is opaque, as set in the announcement.
		public func setLastUpdate(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKNodeAnnouncementDetails>) in
					NodeAnnouncementDetails_set_last_update(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Color assigned to the node
		public func getRgb() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKNodeAnnouncementDetails>) in
					NodeAnnouncementDetails_get_rgb(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple3ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// Color assigned to the node
		public func setRgb(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ThreeBytes(
				value: val, instantiationContext: "NodeAnnouncementDetails.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKNodeAnnouncementDetails>) in
					NodeAnnouncementDetails_set_rgb(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Moniker assigned to the node.
		/// May be invalid or malicious (eg control chars),
		/// should not be exposed to the user.
		public func getAlias() -> NodeAlias {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKNodeAnnouncementDetails>) in
					NodeAnnouncementDetails_get_alias(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NodeAlias(
				cType: nativeCallResult, instantiationContext: "NodeAnnouncementDetails.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Moniker assigned to the node.
		/// May be invalid or malicious (eg control chars),
		/// should not be exposed to the user.
		public func setAlias(val: NodeAlias) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKNodeAnnouncementDetails>) in
					NodeAnnouncementDetails_set_alias(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Internet-level addresses via which one can connect to the node
		///
		/// Returns a copy of the field.
		public func getAddresses() -> [SocketAddress] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKNodeAnnouncementDetails>) in
					NodeAnnouncementDetails_get_addresses(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_SocketAddressZ(
				cType: nativeCallResult, instantiationContext: "NodeAnnouncementDetails.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Internet-level addresses via which one can connect to the node
		public func setAddresses(val: [SocketAddress]) {
			// native call variable prep

			let valVector = Vec_SocketAddressZ(
				array: val, instantiationContext: "NodeAnnouncementDetails.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKNodeAnnouncementDetails>) in
					NodeAnnouncementDetails_set_addresses(thisPtrPointer, valVector.cType!)
				}


			// cleanup

			// valVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new NodeAnnouncementDetails given each field
		public init(
			featuresArg: NodeFeatures, lastUpdateArg: UInt32, rgbArg: [UInt8], aliasArg: NodeAlias,
			addressesArg: [SocketAddress]
		) {
			// native call variable prep

			let rgbArgPrimitiveWrapper = ThreeBytes(
				value: rgbArg, instantiationContext: "NodeAnnouncementDetails.swift::\(#function):\(#line)")

			let addressesArgVector = Vec_SocketAddressZ(
				array: addressesArg, instantiationContext: "NodeAnnouncementDetails.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = NodeAnnouncementDetails_new(
				featuresArg.dynamicallyDangledClone().cType!, lastUpdateArg, rgbArgPrimitiveWrapper.cType!,
				aliasArg.dynamicallyDangledClone().cType!, addressesArgVector.cType!)

			// cleanup

			// for elided types, we need this
			rgbArgPrimitiveWrapper.noOpRetain()

			// addressesArgVector.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = NodeAnnouncementDetails(cType: nativeCallResult, instantiationContext: "NodeAnnouncementDetails.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "NodeAnnouncementDetails.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the NodeAnnouncementDetails
		internal func clone() -> NodeAnnouncementDetails {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKNodeAnnouncementDetails>) in
					NodeAnnouncementDetails_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NodeAnnouncementDetails(
				cType: nativeCallResult, instantiationContext: "NodeAnnouncementDetails.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two NodeAnnouncementDetailss contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: NodeAnnouncementDetails, b: NodeAnnouncementDetails) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKNodeAnnouncementDetails>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKNodeAnnouncementDetails>) in
						NodeAnnouncementDetails_eq(aPointer, bPointer)
					}

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


		internal func danglingClone() -> NodeAnnouncementDetails {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> NodeAnnouncementDetails {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> NodeAnnouncementDetails {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> NodeAnnouncementDetails {
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
						"Freeing NodeAnnouncementDetails \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing NodeAnnouncementDetails \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

