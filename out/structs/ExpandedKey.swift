#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A set of keys that were HKDF-expanded. Returned by [`NodeSigner::get_inbound_payment_key`].
///
/// [`NodeSigner::get_inbound_payment_key`]: crate::sign::NodeSigner::get_inbound_payment_key
public typealias ExpandedKey = Bindings.ExpandedKey

extension Bindings {


	/// A set of keys that were HKDF-expanded. Returned by [`NodeSigner::get_inbound_payment_key`].
	///
	/// [`NodeSigner::get_inbound_payment_key`]: crate::sign::NodeSigner::get_inbound_payment_key
	public class ExpandedKey: NativeTypeWrapper {

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

		internal var cType: LDKExpandedKey?

		internal init(cType: LDKExpandedKey, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKExpandedKey, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKExpandedKey, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the ExpandedKey, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ExpandedKey_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the ExpandedKey.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKExpandedKey>) in
					ExpandedKey_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the ExpandedKey
		internal func clone() -> ExpandedKey {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKExpandedKey>) in
					ExpandedKey_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ExpandedKey(
				cType: nativeCallResult, instantiationContext: "ExpandedKey.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two ExpandedKeys contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: ExpandedKey, b: ExpandedKey) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKExpandedKey>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKExpandedKey>) in
						ExpandedKey_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Create a  new [`ExpandedKey`] for generating an inbound payment hash and secret.
		///
		/// It is recommended to cache this value and not regenerate it for each new inbound payment.
		public init(keyMaterial: [UInt8]) {
			// native call variable prep

			let keyMaterialPrimitiveWrapper = ThirtyTwoBytes(
				value: keyMaterial, instantiationContext: "ExpandedKey.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = ExpandedKey_new(keyMaterialPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			keyMaterialPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = ExpandedKey(cType: nativeCallResult, instantiationContext: "ExpandedKey.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(conflictAvoidingVariableName: 0, instantiationContext: "ExpandedKey.swift::\(#function):\(#line)")


		}


		/// Indicates that this is the only struct which contains the same pointer.
		/// Rust functions which take ownership of an object provided via an argument require
		/// this to be true and invalidate the object pointed to by inner.
		public func isOwned() -> Bool {
			// return value (do some wrapping)
			let returnValue = self.cType!.is_owned

			return returnValue
		}


		internal func danglingClone() -> ExpandedKey {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> ExpandedKey {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> ExpandedKey {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> ExpandedKey {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing ExpandedKey \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ExpandedKey \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

