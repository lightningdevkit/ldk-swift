#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Releases the HTLC corresponding to an inbound [`HeldHtlcAvailable`] message.
public typealias ReleaseHeldHtlc = Bindings.ReleaseHeldHtlc

extension Bindings {


	/// Releases the HTLC corresponding to an inbound [`HeldHtlcAvailable`] message.
	public class ReleaseHeldHtlc: NativeTypeWrapper {

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

		internal var cType: LDKReleaseHeldHtlc?

		internal init(cType: LDKReleaseHeldHtlc, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKReleaseHeldHtlc, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKReleaseHeldHtlc, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the ReleaseHeldHtlc, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ReleaseHeldHtlc_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Used to release the HTLC held upstream if it matches the corresponding
		/// [`HeldHtlcAvailable::payment_release_secret`].
		public func getPaymentReleaseSecret() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKReleaseHeldHtlc>) in
					ReleaseHeldHtlc_get_payment_release_secret(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// Used to release the HTLC held upstream if it matches the corresponding
		/// [`HeldHtlcAvailable::payment_release_secret`].
		public func setPaymentReleaseSecret(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ThirtyTwoBytes(
				value: val, instantiationContext: "ReleaseHeldHtlc.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKReleaseHeldHtlc>) in
					ReleaseHeldHtlc_set_payment_release_secret(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new ReleaseHeldHtlc given each field
		public init(paymentReleaseSecretArg: [UInt8]) {
			// native call variable prep

			let paymentReleaseSecretArgPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentReleaseSecretArg, instantiationContext: "ReleaseHeldHtlc.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = ReleaseHeldHtlc_new(paymentReleaseSecretArgPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			paymentReleaseSecretArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = ReleaseHeldHtlc(cType: nativeCallResult, instantiationContext: "ReleaseHeldHtlc.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "ReleaseHeldHtlc.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the ReleaseHeldHtlc
		internal func clone() -> ReleaseHeldHtlc {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKReleaseHeldHtlc>) in
					ReleaseHeldHtlc_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ReleaseHeldHtlc(
				cType: nativeCallResult, instantiationContext: "ReleaseHeldHtlc.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Constructs a new OnionMessageContents which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned OnionMessageContents must be freed before this_arg is
		public func asOnionMessageContents() -> OnionMessageContents {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKReleaseHeldHtlc>) in
					ReleaseHeldHtlc_as_OnionMessageContents(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedOnionMessageContents(
				cType: nativeCallResult, instantiationContext: "ReleaseHeldHtlc.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Serialize the ReleaseHeldHtlc object into a byte array which can be read by ReleaseHeldHtlc_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKReleaseHeldHtlc>) in
					ReleaseHeldHtlc_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "ReleaseHeldHtlc.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a ReleaseHeldHtlc from a byte array, created by ReleaseHeldHtlc_write
		public class func read(ser: [UInt8]) -> Result_ReleaseHeldHtlcDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "ReleaseHeldHtlc.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = ReleaseHeldHtlc_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_ReleaseHeldHtlcDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "ReleaseHeldHtlc.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> ReleaseHeldHtlc {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> ReleaseHeldHtlc {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> ReleaseHeldHtlc {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> ReleaseHeldHtlc {
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
						"Freeing ReleaseHeldHtlc \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ReleaseHeldHtlc \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

