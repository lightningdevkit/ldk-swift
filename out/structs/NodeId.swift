#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Represents the compressed public key of a node
public typealias NodeId = Bindings.NodeId

extension Bindings {


	/// Represents the compressed public key of a node
	public class NodeId: NativeTypeWrapper {

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

		internal var cType: LDKNodeId?

		internal init(cType: LDKNodeId, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKNodeId, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(cType: LDKNodeId, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the NodeId, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = NodeId_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the NodeId
		internal func clone() -> NodeId {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKNodeId>) in
					NodeId_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NodeId(
				cType: nativeCallResult, instantiationContext: "NodeId.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Create a new NodeId from a public key
		public class func initWithPubkey(pubkey: [UInt8]) -> NodeId {
			// native call variable prep

			let pubkeyPrimitiveWrapper = PublicKey(
				value: pubkey, instantiationContext: "NodeId.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = NodeId_from_pubkey(pubkeyPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			pubkeyPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = NodeId(
				cType: nativeCallResult, instantiationContext: "NodeId.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Get the public key slice from this NodeId
		public func asSlice() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeId>) in
					NodeId_as_slice(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = u8slice(
				cType: nativeCallResult, instantiationContext: "NodeId.swift::\(#function):\(#line)", anchor: self
			)
			.dangle().getValue()


			return returnValue
		}

		/// Get the public key as an array from this NodeId
		public func asArray() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeId>) in
					NodeId_as_array(thisArgPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple33ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// Get the public key from this NodeId
		public func asPubkey() -> Result_PublicKeySecp256k1ErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeId>) in
					NodeId_as_pubkey(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_PublicKeySecp256k1ErrorZ(
				cType: nativeCallResult, instantiationContext: "NodeId.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the NodeId.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKNodeId>) in
					NodeId_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the NodeId object into a byte array which can be read by NodeId_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKNodeId>) in
					NodeId_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "NodeId.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a NodeId from a byte array, created by NodeId_write
		public class func read(ser: [UInt8]) -> Result_NodeIdDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "NodeId.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = NodeId_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NodeIdDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "NodeId.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> NodeId {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> NodeId {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> NodeId {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> NodeId {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing NodeId \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing NodeId \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
			}
		}


	}


}

