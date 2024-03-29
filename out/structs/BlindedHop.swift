#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// An encrypted payload and node id corresponding to a hop in a payment or onion message path, to
/// be encoded in the sender's onion packet. These hops cannot be identified by outside observers
/// and thus can be used to hide the identity of the recipient.
public typealias BlindedHop = Bindings.BlindedHop

extension Bindings {


	/// An encrypted payload and node id corresponding to a hop in a payment or onion message path, to
	/// be encoded in the sender's onion packet. These hops cannot be identified by outside observers
	/// and thus can be used to hide the identity of the recipient.
	public class BlindedHop: NativeTypeWrapper {

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

		internal var cType: LDKBlindedHop?

		internal init(cType: LDKBlindedHop, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKBlindedHop, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKBlindedHop, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the BlindedHop, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = BlindedHop_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The blinded node id of this hop in a [`BlindedPath`].
		public func getBlindedNodeId() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBlindedHop>) in
					BlindedHop_get_blinded_node_id(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "BlindedHop.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The blinded node id of this hop in a [`BlindedPath`].
		public func setBlindedNodeId(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "BlindedHop.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKBlindedHop>) in
					BlindedHop_set_blinded_node_id(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The encrypted payload intended for this hop in a [`BlindedPath`].
		///
		/// Returns a copy of the field.
		public func getEncryptedPayload() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBlindedHop>) in
					BlindedHop_get_encrypted_payload(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "BlindedHop.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The encrypted payload intended for this hop in a [`BlindedPath`].
		public func setEncryptedPayload(val: [UInt8]) {
			// native call variable prep

			let valVector = Vec_u8Z(array: val, instantiationContext: "BlindedHop.swift::\(#function):\(#line)")
				.dangle()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKBlindedHop>) in
					BlindedHop_set_encrypted_payload(thisPtrPointer, valVector.cType!)
				}


			// cleanup

			// valVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new BlindedHop given each field
		public init(blindedNodeIdArg: [UInt8], encryptedPayloadArg: [UInt8]) {
			// native call variable prep

			let blindedNodeIdArgPrimitiveWrapper = PublicKey(
				value: blindedNodeIdArg, instantiationContext: "BlindedHop.swift::\(#function):\(#line)")

			let encryptedPayloadArgVector = Vec_u8Z(
				array: encryptedPayloadArg, instantiationContext: "BlindedHop.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = BlindedHop_new(
				blindedNodeIdArgPrimitiveWrapper.cType!, encryptedPayloadArgVector.cType!)

			// cleanup

			// for elided types, we need this
			blindedNodeIdArgPrimitiveWrapper.noOpRetain()

			// encryptedPayloadArgVector.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = BlindedHop(cType: nativeCallResult, instantiationContext: "BlindedHop.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: "BlindedHop.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the BlindedHop
		internal func clone() -> BlindedHop {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBlindedHop>) in
					BlindedHop_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = BlindedHop(
				cType: nativeCallResult, instantiationContext: "BlindedHop.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the BlindedHop.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKBlindedHop>) in
					BlindedHop_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two BlindedHops contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: BlindedHop, b: BlindedHop) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKBlindedHop>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKBlindedHop>) in
						BlindedHop_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the BlindedHop object into a byte array which can be read by BlindedHop_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKBlindedHop>) in
					BlindedHop_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "BlindedHop.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a BlindedHop from a byte array, created by BlindedHop_write
		public class func read(ser: [UInt8]) -> Result_BlindedHopDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "BlindedHop.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = BlindedHop_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_BlindedHopDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "BlindedHop.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> BlindedHop {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> BlindedHop {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> BlindedHop {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> BlindedHop {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing BlindedHop \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing BlindedHop \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

