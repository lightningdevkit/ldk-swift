#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Onion messages and payments can be sent and received to blinded paths, which serve to hide the
/// identity of the recipient.
public typealias BlindedPath = Bindings.BlindedPath

extension Bindings {


	/// Onion messages and payments can be sent and received to blinded paths, which serve to hide the
	/// identity of the recipient.
	public class BlindedPath: NativeTypeWrapper {

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

		internal var cType: LDKBlindedPath?

		internal init(cType: LDKBlindedPath, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKBlindedPath, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKBlindedPath, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the BlindedPath, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = BlindedPath_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the BlindedPath
		internal func clone() -> BlindedPath {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBlindedPath>) in
					BlindedPath_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = BlindedPath(
				cType: nativeCallResult, instantiationContext: "BlindedPath.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the BlindedPath.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKBlindedPath>) in
					BlindedPath_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two BlindedPaths contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: BlindedPath, b: BlindedPath) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKBlindedPath>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKBlindedPath>) in
						BlindedPath_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Create a blinded path for an onion message, to be forwarded along `node_pks`. The last node
		/// pubkey in `node_pks` will be the destination node.
		///
		/// Errors if less than two hops are provided or if `node_pk`(s) are invalid.
		public class func newForMessage(nodePks: [[UInt8]], entropySource: EntropySource) -> Result_BlindedPathNoneZ {
			// native call variable prep

			let nodePksVector = Vec_PublicKeyZ(
				array: nodePks, instantiationContext: "BlindedPath.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: entropySource.activate().cType!) {
					(entropySourcePointer: UnsafePointer<LDKEntropySource>) in
					BlindedPath_new_for_message(nodePksVector.cType!, entropySourcePointer)
				}


			// cleanup

			// nodePksVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_BlindedPathNoneZ(
				cType: nativeCallResult, instantiationContext: "BlindedPath.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Serialize the BlindedPath object into a byte array which can be read by BlindedPath_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKBlindedPath>) in
					BlindedPath_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "BlindedPath.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a BlindedPath from a byte array, created by BlindedPath_write
		public class func read(ser: [UInt8]) -> Result_BlindedPathDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "BlindedPath.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = BlindedPath_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_BlindedPathDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "BlindedPath.swift::\(#function):\(#line)")


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


		internal func dangle(_ shouldDangle: Bool = true) -> BlindedPath {
			self.dangling = shouldDangle
			return self
		}


		internal func danglingClone() -> BlindedPath {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> BlindedPath {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> BlindedPath {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> BlindedPath {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing BlindedPath \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing BlindedPath \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

