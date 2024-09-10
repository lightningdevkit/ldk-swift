import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias NodeAnnouncementInfo = Bindings.NodeAnnouncementInfo

extension Bindings {

	/// Information received in the latest node_announcement from this node.
	public class NodeAnnouncementInfo: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKNodeAnnouncementInfo?

		internal init(cType: LDKNodeAnnouncementInfo, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKNodeAnnouncementInfo, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKNodeAnnouncementInfo, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum NodeAnnouncementInfoType {

			/// An initial announcement of the node
			/// Everything else is useful only for sending out for initial routing sync.
			/// Not stored if contains excess data to prevent DoS.
			case Relayed

			/// Non-relayable information received in the latest node_announcement from this node.
			case Local

		}

		public func getValueType() -> NodeAnnouncementInfoType {
			switch self.cType!.tag {
				case LDKNodeAnnouncementInfo_Relayed:
					return .Relayed

				case LDKNodeAnnouncementInfo_Local:
					return .Local

				default:
					Bindings.print("Error: Invalid value type for NodeAnnouncementInfo! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the NodeAnnouncementInfo
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = NodeAnnouncementInfo_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the NodeAnnouncementInfo
		internal func clone() -> NodeAnnouncementInfo {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
					NodeAnnouncementInfo_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NodeAnnouncementInfo(
				cType: nativeCallResult, instantiationContext: "NodeAnnouncementInfo.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Relayed-variant NodeAnnouncementInfo
		public class func initWithRelayed(a: Bindings.NodeAnnouncement) -> NodeAnnouncementInfo {
			// native call variable prep


			// native method call
			let nativeCallResult = NodeAnnouncementInfo_relayed(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = NodeAnnouncementInfo(
				cType: nativeCallResult, instantiationContext: "NodeAnnouncementInfo.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Local-variant NodeAnnouncementInfo
		public class func initWithLocal(a: Bindings.NodeAnnouncementDetails) -> NodeAnnouncementInfo {
			// native call variable prep


			// native method call
			let nativeCallResult = NodeAnnouncementInfo_local(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = NodeAnnouncementInfo(
				cType: nativeCallResult, instantiationContext: "NodeAnnouncementInfo.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two NodeAnnouncementInfos contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: NodeAnnouncementInfo, b: NodeAnnouncementInfo) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
						NodeAnnouncementInfo_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Protocol features the node announced support for
		public func features() -> Bindings.NodeFeatures {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
					NodeAnnouncementInfo_features(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NodeFeatures(
				cType: nativeCallResult, instantiationContext: "NodeAnnouncementInfo.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// When the last known update to the node state was issued.
		///
		/// Value may or may not be a timestamp, depending on the policy of the origin node.
		public func lastUpdate() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
					NodeAnnouncementInfo_last_update(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Color assigned to the node
		public func rgb() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
					NodeAnnouncementInfo_rgb(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ThreeBytes(
				cType: nativeCallResult, instantiationContext: "NodeAnnouncementInfo.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Moniker assigned to the node.
		///
		/// May be invalid or malicious (eg control chars), should not be exposed to the user.
		public func alias() -> Bindings.NodeAlias {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
					NodeAnnouncementInfo_alias(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NodeAlias(
				cType: nativeCallResult, instantiationContext: "NodeAnnouncementInfo.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Internet-level addresses via which one can connect to the node
		public func addresses() -> [SocketAddress] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
					NodeAnnouncementInfo_addresses(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_SocketAddressZ(
				cType: nativeCallResult, instantiationContext: "NodeAnnouncementInfo.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// An initial announcement of the node
		///
		/// Not stored if contains excess data to prevent DoS.
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func announcementMessage() -> Bindings.NodeAnnouncement? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
					NodeAnnouncementInfo_announcement_message(thisArgPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKNodeAnnouncement

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = NodeAnnouncement(
				cType: nativeCallResult, instantiationContext: "NodeAnnouncementInfo.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Serialize the NodeAnnouncementInfo object into a byte array which can be read by NodeAnnouncementInfo_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
					NodeAnnouncementInfo_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "NodeAnnouncementInfo.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a NodeAnnouncementInfo from a byte array, created by NodeAnnouncementInfo_write
		public class func read(ser: [UInt8]) -> Result_NodeAnnouncementInfoDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "NodeAnnouncementInfo.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = NodeAnnouncementInfo_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NodeAnnouncementInfoDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "NodeAnnouncementInfo.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValueAsRelayed() -> Bindings.NodeAnnouncement? {
			if self.cType?.tag != LDKNodeAnnouncementInfo_Relayed {
				return nil
			}

			return NodeAnnouncement(
				cType: self.cType!.relayed, instantiationContext: "NodeAnnouncementInfo.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsLocal() -> Bindings.NodeAnnouncementDetails? {
			if self.cType?.tag != LDKNodeAnnouncementInfo_Local {
				return nil
			}

			return NodeAnnouncementDetails(
				cType: self.cType!.local, instantiationContext: "NodeAnnouncementInfo.swift::\(#function):\(#line)",
				anchor: self)
		}


		internal func danglingClone() -> NodeAnnouncementInfo {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing NodeAnnouncementInfo \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing NodeAnnouncementInfo \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
