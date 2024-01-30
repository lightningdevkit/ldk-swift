#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// BOLT 4 onion packet including hop data for the next peer.
public typealias OnionPacket = Bindings.OnionPacket

extension Bindings {


	/// BOLT 4 onion packet including hop data for the next peer.
	public class OnionPacket: NativeTypeWrapper {

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

		internal var cType: LDKOnionPacket?

		internal init(cType: LDKOnionPacket, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKOnionPacket, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKOnionPacket, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the OnionPacket, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = OnionPacket_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// BOLT 4 version number.
		public func getVersion() -> UInt8 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOnionPacket>) in
					OnionPacket_get_version(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// BOLT 4 version number.
		public func setVersion(val: UInt8) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOnionPacket>) in
					OnionPacket_set_version(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// In order to ensure we always return an error on onion decode in compliance with [BOLT
		/// #4](https://github.com/lightning/bolts/blob/master/04-onion-routing.md), we have to
		/// deserialize `OnionPacket`s contained in [`UpdateAddHTLC`] messages even if the ephemeral
		/// public key (here) is bogus, so we hold a [`Result`] instead of a [`PublicKey`] as we'd
		/// like.
		///
		/// Returns a copy of the field.
		public func getPublicKey() -> Result_PublicKeySecp256k1ErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOnionPacket>) in
					OnionPacket_get_public_key(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_PublicKeySecp256k1ErrorZ(
				cType: nativeCallResult, instantiationContext: "OnionPacket.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// In order to ensure we always return an error on onion decode in compliance with [BOLT
		/// #4](https://github.com/lightning/bolts/blob/master/04-onion-routing.md), we have to
		/// deserialize `OnionPacket`s contained in [`UpdateAddHTLC`] messages even if the ephemeral
		/// public key (here) is bogus, so we hold a [`Result`] instead of a [`PublicKey`] as we'd
		/// like.
		public func setPublicKey(val: Result_PublicKeySecp256k1ErrorZ) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOnionPacket>) in
					OnionPacket_set_public_key(thisPtrPointer, val.danglingClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// HMAC to verify the integrity of hop_data.
		public func getHmac() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOnionPacket>) in
					OnionPacket_get_hmac(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// HMAC to verify the integrity of hop_data.
		public func setHmac(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ThirtyTwoBytes(
				value: val, instantiationContext: "OnionPacket.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOnionPacket>) in
					OnionPacket_set_hmac(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the OnionPacket
		internal func clone() -> OnionPacket {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKOnionPacket>) in
					OnionPacket_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = OnionPacket(
				cType: nativeCallResult, instantiationContext: "OnionPacket.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the OnionPacket.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKOnionPacket>) in
					OnionPacket_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two OnionPackets contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: OnionPacket, b: OnionPacket) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKOnionPacket>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKOnionPacket>) in
						OnionPacket_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the OnionPacket object into a byte array which can be read by OnionPacket_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKOnionPacket>) in
					OnionPacket_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "OnionPacket.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a OnionPacket from a byte array, created by OnionPacket_write
		public class func read(ser: [UInt8]) -> Result_OnionPacketDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "OnionPacket.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = OnionPacket_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_OnionPacketDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "OnionPacket.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> OnionPacket {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> OnionPacket {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> OnionPacket {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> OnionPacket {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing OnionPacket \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing OnionPacket \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

