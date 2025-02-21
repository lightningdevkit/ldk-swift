#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// An unauthenticated [`ReceiveTlvs`].
public typealias UnauthenticatedReceiveTlvs = Bindings.UnauthenticatedReceiveTlvs

extension Bindings {


	/// An unauthenticated [`ReceiveTlvs`].
	public class UnauthenticatedReceiveTlvs: NativeTypeWrapper {

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

		internal var cType: LDKUnauthenticatedReceiveTlvs?

		internal init(cType: LDKUnauthenticatedReceiveTlvs, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKUnauthenticatedReceiveTlvs, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKUnauthenticatedReceiveTlvs, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Constructs a new Verification which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned Verification must be freed before this_arg is
		public func asVerification() -> Verification {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUnauthenticatedReceiveTlvs>) in
					UnauthenticatedReceiveTlvs_as_Verification(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedVerification(
				cType: nativeCallResult,
				instantiationContext: "UnauthenticatedReceiveTlvs.swift::\(#function):\(#line)", anchor: self)


			return returnValue
		}

		/// Frees any resources used by the UnauthenticatedReceiveTlvs, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = UnauthenticatedReceiveTlvs_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Used to authenticate the sender of a payment to the receiver and tie MPP HTLCs together.
		public func getPaymentSecret() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnauthenticatedReceiveTlvs>) in
					UnauthenticatedReceiveTlvs_get_payment_secret(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// Used to authenticate the sender of a payment to the receiver and tie MPP HTLCs together.
		public func setPaymentSecret(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ThirtyTwoBytes(
				value: val, instantiationContext: "UnauthenticatedReceiveTlvs.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKUnauthenticatedReceiveTlvs>) in
					UnauthenticatedReceiveTlvs_set_payment_secret(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constraints for the receiver of this payment.
		public func getPaymentConstraints() -> PaymentConstraints {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnauthenticatedReceiveTlvs>) in
					UnauthenticatedReceiveTlvs_get_payment_constraints(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PaymentConstraints(
				cType: nativeCallResult,
				instantiationContext: "UnauthenticatedReceiveTlvs.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Constraints for the receiver of this payment.
		public func setPaymentConstraints(val: PaymentConstraints) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKUnauthenticatedReceiveTlvs>) in
					UnauthenticatedReceiveTlvs_set_payment_constraints(
						thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Context for the receiver of this payment.
		public func getPaymentContext() -> PaymentContext {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnauthenticatedReceiveTlvs>) in
					UnauthenticatedReceiveTlvs_get_payment_context(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PaymentContext(
				cType: nativeCallResult,
				instantiationContext: "UnauthenticatedReceiveTlvs.swift::\(#function):\(#line)", anchor: self)


			return returnValue
		}

		/// Context for the receiver of this payment.
		public func setPaymentContext(val: PaymentContext) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKUnauthenticatedReceiveTlvs>) in
					UnauthenticatedReceiveTlvs_set_payment_context(thisPtrPointer, val.danglingClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new UnauthenticatedReceiveTlvs given each field
		public init(
			paymentSecretArg: [UInt8], paymentConstraintsArg: PaymentConstraints, paymentContextArg: PaymentContext
		) {
			// native call variable prep

			let paymentSecretArgPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentSecretArg, instantiationContext: "UnauthenticatedReceiveTlvs.swift::\(#function):\(#line)"
			)


			// native method call
			let nativeCallResult = UnauthenticatedReceiveTlvs_new(
				paymentSecretArgPrimitiveWrapper.cType!, paymentConstraintsArg.dynamicallyDangledClone().cType!,
				paymentContextArg.danglingClone().cType!)

			// cleanup

			// for elided types, we need this
			paymentSecretArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = UnauthenticatedReceiveTlvs(cType: nativeCallResult, instantiationContext: "UnauthenticatedReceiveTlvs.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "UnauthenticatedReceiveTlvs.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the UnauthenticatedReceiveTlvs
		internal func clone() -> UnauthenticatedReceiveTlvs {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKUnauthenticatedReceiveTlvs>) in
					UnauthenticatedReceiveTlvs_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = UnauthenticatedReceiveTlvs(
				cType: nativeCallResult, instantiationContext: "UnauthenticatedReceiveTlvs.swift::\(#function):\(#line)"
			)


			return returnValue
		}

		/// Creates an authenticated [`ReceiveTlvs`], which includes an HMAC and the provide [`Nonce`]
		/// that can be use later to verify it authenticity.
		public func authenticate(nonce: Nonce, expandedKey: ExpandedKey) -> ReceiveTlvs {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: expandedKey.cType!) { (expandedKeyPointer: UnsafePointer<LDKExpandedKey>) in
					UnauthenticatedReceiveTlvs_authenticate(
						self.dynamicallyDangledClone().cType!, nonce.dynamicallyDangledClone().cType!,
						expandedKeyPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ReceiveTlvs(
				cType: nativeCallResult, instantiationContext: "UnauthenticatedReceiveTlvs.swift::\(#function):\(#line)"
			)


			return returnValue
		}

		/// Serialize the UnauthenticatedReceiveTlvs object into a byte array which can be read by UnauthenticatedReceiveTlvs_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKUnauthenticatedReceiveTlvs>) in
					UnauthenticatedReceiveTlvs_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult,
				instantiationContext: "UnauthenticatedReceiveTlvs.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


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


		internal func danglingClone() -> UnauthenticatedReceiveTlvs {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> UnauthenticatedReceiveTlvs {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> UnauthenticatedReceiveTlvs {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> UnauthenticatedReceiveTlvs {
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
						"Freeing UnauthenticatedReceiveTlvs \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing UnauthenticatedReceiveTlvs \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

