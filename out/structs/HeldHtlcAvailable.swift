#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// An HTLC destined for the recipient of this message is being held upstream. The reply path
/// accompanying this onion message should be used to send a [`ReleaseHeldHtlc`] response, which
/// will cause the upstream HTLC to be released.
public typealias HeldHtlcAvailable = Bindings.HeldHtlcAvailable

extension Bindings {


	/// An HTLC destined for the recipient of this message is being held upstream. The reply path
	/// accompanying this onion message should be used to send a [`ReleaseHeldHtlc`] response, which
	/// will cause the upstream HTLC to be released.
	public class HeldHtlcAvailable: NativeTypeWrapper {

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

		internal var cType: LDKHeldHtlcAvailable?

		internal init(cType: LDKHeldHtlcAvailable, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKHeldHtlcAvailable, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKHeldHtlcAvailable, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the HeldHtlcAvailable, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = HeldHtlcAvailable_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The secret that will be used by the recipient of this message to release the held HTLC.
		public func getPaymentReleaseSecret() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKHeldHtlcAvailable>) in
					HeldHtlcAvailable_get_payment_release_secret(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// The secret that will be used by the recipient of this message to release the held HTLC.
		public func setPaymentReleaseSecret(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ThirtyTwoBytes(
				value: val, instantiationContext: "HeldHtlcAvailable.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKHeldHtlcAvailable>) in
					HeldHtlcAvailable_set_payment_release_secret(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new HeldHtlcAvailable given each field
		public init(paymentReleaseSecretArg: [UInt8]) {
			// native call variable prep

			let paymentReleaseSecretArgPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentReleaseSecretArg, instantiationContext: "HeldHtlcAvailable.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = HeldHtlcAvailable_new(paymentReleaseSecretArgPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			paymentReleaseSecretArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = HeldHtlcAvailable(cType: nativeCallResult, instantiationContext: "HeldHtlcAvailable.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "HeldHtlcAvailable.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the HeldHtlcAvailable
		internal func clone() -> HeldHtlcAvailable {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKHeldHtlcAvailable>) in
					HeldHtlcAvailable_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = HeldHtlcAvailable(
				cType: nativeCallResult, instantiationContext: "HeldHtlcAvailable.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Serialize the HeldHtlcAvailable object into a byte array which can be read by HeldHtlcAvailable_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKHeldHtlcAvailable>) in
					HeldHtlcAvailable_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "HeldHtlcAvailable.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a HeldHtlcAvailable from a byte array, created by HeldHtlcAvailable_write
		public class func read(ser: [UInt8]) -> Result_HeldHtlcAvailableDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "HeldHtlcAvailable.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = HeldHtlcAvailable_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_HeldHtlcAvailableDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "HeldHtlcAvailable.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> HeldHtlcAvailable {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> HeldHtlcAvailable {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> HeldHtlcAvailable {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> HeldHtlcAvailable {
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
						"Freeing HeldHtlcAvailable \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing HeldHtlcAvailable \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

