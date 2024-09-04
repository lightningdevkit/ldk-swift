#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A 128-bit number used only once.
///
/// Needed when constructing [`Offer::metadata`] and deriving [`Offer::signing_pubkey`] from
/// [`ExpandedKey`]. Must not be reused for any other derivation without first hashing.
///
/// [`Offer::metadata`]: crate::offers::offer::Offer::metadata
/// [`Offer::signing_pubkey`]: crate::offers::offer::Offer::signing_pubkey
/// [`ExpandedKey`]: crate::ln::inbound_payment::ExpandedKey
public typealias Nonce = Bindings.Nonce

extension Bindings {


	/// A 128-bit number used only once.
	///
	/// Needed when constructing [`Offer::metadata`] and deriving [`Offer::signing_pubkey`] from
	/// [`ExpandedKey`]. Must not be reused for any other derivation without first hashing.
	///
	/// [`Offer::metadata`]: crate::offers::offer::Offer::metadata
	/// [`Offer::signing_pubkey`]: crate::offers::offer::Offer::signing_pubkey
	/// [`ExpandedKey`]: crate::ln::inbound_payment::ExpandedKey
	public class Nonce: NativeTypeWrapper {

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

		internal var cType: LDKNonce?

		internal init(cType: LDKNonce, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKNonce, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(cType: LDKNonce, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the Nonce, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = Nonce_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the Nonce
		internal func clone() -> Nonce {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKNonce>) in
					Nonce_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Nonce(cType: nativeCallResult, instantiationContext: "Nonce.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two Nonces contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: Nonce, b: Nonce) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKNonce>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKNonce>) in
						Nonce_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a `Nonce` from the given [`EntropySource`].
		public class func initWithEntropySource(entropySource: EntropySource) -> Nonce {
			// native call variable prep


			// native method call
			let nativeCallResult = Nonce_from_entropy_source(entropySource.activate().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Nonce(cType: nativeCallResult, instantiationContext: "Nonce.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Returns a slice of the underlying bytes of size [`Nonce::LENGTH`].
		public func asSlice() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNonce>) in
					Nonce_as_slice(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = u8slice(
				cType: nativeCallResult, instantiationContext: "Nonce.swift::\(#function):\(#line)", anchor: self
			)
			.dangle().getValue()


			return returnValue
		}

		/// Serialize the Nonce object into a byte array which can be read by Nonce_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKNonce>) in
					Nonce_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "Nonce.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a Nonce from a byte array, created by Nonce_write
		public class func read(ser: [UInt8]) -> Result_NonceDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "Nonce.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Nonce_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NonceDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "Nonce.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> Nonce {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> Nonce {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> Nonce {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> Nonce {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing Nonce \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Nonce \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
			}
		}


	}


}

