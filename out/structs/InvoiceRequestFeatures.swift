#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Features used within an `invoice_request`.
public typealias InvoiceRequestFeatures = Bindings.InvoiceRequestFeatures

extension Bindings {


	/// Features used within an `invoice_request`.
	public class InvoiceRequestFeatures: NativeTypeWrapper {

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

		internal var cType: LDKInvoiceRequestFeatures?

		internal init(cType: LDKInvoiceRequestFeatures, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKInvoiceRequestFeatures, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKInvoiceRequestFeatures, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Checks if two InvoiceRequestFeaturess contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: InvoiceRequestFeatures, b: InvoiceRequestFeatures) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKInvoiceRequestFeatures>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKInvoiceRequestFeatures>) in
						InvoiceRequestFeatures_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the InvoiceRequestFeatures
		internal func clone() -> InvoiceRequestFeatures {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKInvoiceRequestFeatures>) in
					InvoiceRequestFeatures_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = InvoiceRequestFeatures(
				cType: nativeCallResult, instantiationContext: "InvoiceRequestFeatures.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the InvoiceRequestFeatures.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKInvoiceRequestFeatures>) in
					InvoiceRequestFeatures_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Frees any resources used by the InvoiceRequestFeatures, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = InvoiceRequestFeatures_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Create a blank Features with no features set
		public class func initWithEmpty() -> InvoiceRequestFeatures {
			// native call variable prep


			// native method call
			let nativeCallResult = InvoiceRequestFeatures_empty()

			// cleanup


			// return value (do some wrapping)
			let returnValue = InvoiceRequestFeatures(
				cType: nativeCallResult, instantiationContext: "InvoiceRequestFeatures.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Returns true if this `Features` object contains required features unknown by `other`.
		public func requiresUnknownBitsFrom() -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoiceRequestFeatures>) in

					withUnsafePointer(to: self.cType!) { (otherPointer: UnsafePointer<LDKInvoiceRequestFeatures>) in
						InvoiceRequestFeatures_requires_unknown_bits_from(thisArgPointer, otherPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns true if this `Features` object contains unknown feature flags which are set as
		/// \"required\".
		public func requiresUnknownBits() -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoiceRequestFeatures>) in
					InvoiceRequestFeatures_requires_unknown_bits(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Sets a required feature bit. Errors if `bit` is outside the feature range as defined
		/// by [BOLT 9].
		///
		/// Note: Required bits are even. If an odd bit is given, then the corresponding even bit will
		/// be set instead (i.e., `bit - 1`).
		///
		/// [BOLT 9]: https://github.com/lightning/bolts/blob/master/09-features.md
		public func setRequiredFeatureBit(bit: UInt) -> Result_NoneNoneZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisArgPointer: UnsafeMutablePointer<LDKInvoiceRequestFeatures>) in
					InvoiceRequestFeatures_set_required_feature_bit(thisArgPointer, bit)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NoneNoneZ(
				cType: nativeCallResult, instantiationContext: "InvoiceRequestFeatures.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Sets an optional feature bit. Errors if `bit` is outside the feature range as defined
		/// by [BOLT 9].
		///
		/// Note: Optional bits are odd. If an even bit is given, then the corresponding odd bit will be
		/// set instead (i.e., `bit + 1`).
		///
		/// [BOLT 9]: https://github.com/lightning/bolts/blob/master/09-features.md
		public func setOptionalFeatureBit(bit: UInt) -> Result_NoneNoneZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisArgPointer: UnsafeMutablePointer<LDKInvoiceRequestFeatures>) in
					InvoiceRequestFeatures_set_optional_feature_bit(thisArgPointer, bit)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NoneNoneZ(
				cType: nativeCallResult, instantiationContext: "InvoiceRequestFeatures.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Sets a required custom feature bit. Errors if `bit` is outside the custom range as defined
		/// by [bLIP 2] or if it is a known `T` feature.
		///
		/// Note: Required bits are even. If an odd bit is given, then the corresponding even bit will
		/// be set instead (i.e., `bit - 1`).
		///
		/// [bLIP 2]: https://github.com/lightning/blips/blob/master/blip-0002.md#feature-bits
		public func setRequiredCustomBit(bit: UInt) -> Result_NoneNoneZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisArgPointer: UnsafeMutablePointer<LDKInvoiceRequestFeatures>) in
					InvoiceRequestFeatures_set_required_custom_bit(thisArgPointer, bit)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NoneNoneZ(
				cType: nativeCallResult, instantiationContext: "InvoiceRequestFeatures.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Sets an optional custom feature bit. Errors if `bit` is outside the custom range as defined
		/// by [bLIP 2] or if it is a known `T` feature.
		///
		/// Note: Optional bits are odd. If an even bit is given, then the corresponding odd bit will be
		/// set instead (i.e., `bit + 1`).
		///
		/// [bLIP 2]: https://github.com/lightning/blips/blob/master/blip-0002.md#feature-bits
		public func setOptionalCustomBit(bit: UInt) -> Result_NoneNoneZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisArgPointer: UnsafeMutablePointer<LDKInvoiceRequestFeatures>) in
					InvoiceRequestFeatures_set_optional_custom_bit(thisArgPointer, bit)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NoneNoneZ(
				cType: nativeCallResult, instantiationContext: "InvoiceRequestFeatures.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


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


		internal func danglingClone() -> InvoiceRequestFeatures {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> InvoiceRequestFeatures {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> InvoiceRequestFeatures {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> InvoiceRequestFeatures {
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
						"Freeing InvoiceRequestFeatures \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing InvoiceRequestFeatures \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

