#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Data to construct a [`BlindedHop`] for forwarding a payment.
public typealias ForwardTlvs = Bindings.ForwardTlvs

extension Bindings {


	/// Data to construct a [`BlindedHop`] for forwarding a payment.
	public class ForwardTlvs: NativeTypeWrapper {

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

		internal var cType: LDKForwardTlvs?

		internal init(cType: LDKForwardTlvs, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKForwardTlvs, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKForwardTlvs, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the ForwardTlvs, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ForwardTlvs_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The short channel id this payment should be forwarded out over.
		public func getShortChannelId() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKForwardTlvs>) in
					ForwardTlvs_get_short_channel_id(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The short channel id this payment should be forwarded out over.
		public func setShortChannelId(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKForwardTlvs>) in
					ForwardTlvs_set_short_channel_id(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Payment parameters for relaying over [`Self::short_channel_id`].
		public func getPaymentRelay() -> PaymentRelay {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKForwardTlvs>) in
					ForwardTlvs_get_payment_relay(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PaymentRelay(
				cType: nativeCallResult, instantiationContext: "ForwardTlvs.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Payment parameters for relaying over [`Self::short_channel_id`].
		public func setPaymentRelay(val: PaymentRelay) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKForwardTlvs>) in
					ForwardTlvs_set_payment_relay(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Payment constraints for relaying over [`Self::short_channel_id`].
		public func getPaymentConstraints() -> PaymentConstraints {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKForwardTlvs>) in
					ForwardTlvs_get_payment_constraints(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PaymentConstraints(
				cType: nativeCallResult, instantiationContext: "ForwardTlvs.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Payment constraints for relaying over [`Self::short_channel_id`].
		public func setPaymentConstraints(val: PaymentConstraints) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKForwardTlvs>) in
					ForwardTlvs_set_payment_constraints(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Supported and required features when relaying a payment onion containing this object's
		/// corresponding [`BlindedHop::encrypted_payload`].
		///
		/// [`BlindedHop::encrypted_payload`]: crate::blinded_path::BlindedHop::encrypted_payload
		public func getFeatures() -> BlindedHopFeatures {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKForwardTlvs>) in
					ForwardTlvs_get_features(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = BlindedHopFeatures(
				cType: nativeCallResult, instantiationContext: "ForwardTlvs.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Supported and required features when relaying a payment onion containing this object's
		/// corresponding [`BlindedHop::encrypted_payload`].
		///
		/// [`BlindedHop::encrypted_payload`]: crate::blinded_path::BlindedHop::encrypted_payload
		public func setFeatures(val: BlindedHopFeatures) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKForwardTlvs>) in
					ForwardTlvs_set_features(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new ForwardTlvs given each field
		public init(
			shortChannelIdArg: UInt64, paymentRelayArg: PaymentRelay, paymentConstraintsArg: PaymentConstraints,
			featuresArg: BlindedHopFeatures
		) {
			// native call variable prep


			// native method call
			let nativeCallResult = ForwardTlvs_new(
				shortChannelIdArg, paymentRelayArg.dynamicallyDangledClone().cType!,
				paymentConstraintsArg.dynamicallyDangledClone().cType!, featuresArg.dynamicallyDangledClone().cType!)

			// cleanup

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = ForwardTlvs(cType: nativeCallResult, instantiationContext: "ForwardTlvs.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(conflictAvoidingVariableName: 0, instantiationContext: "ForwardTlvs.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the ForwardTlvs
		internal func clone() -> ForwardTlvs {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKForwardTlvs>) in
					ForwardTlvs_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ForwardTlvs(
				cType: nativeCallResult, instantiationContext: "ForwardTlvs.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Serialize the ForwardTlvs object into a byte array which can be read by ForwardTlvs_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKForwardTlvs>) in
					ForwardTlvs_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "ForwardTlvs.swift::\(#function):\(#line)", anchor: self
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


		internal func danglingClone() -> ForwardTlvs {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> ForwardTlvs {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> ForwardTlvs {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> ForwardTlvs {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing ForwardTlvs \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ForwardTlvs \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

