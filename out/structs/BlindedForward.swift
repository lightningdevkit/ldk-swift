#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Information used to forward or fail this HTLC that is being forwarded within a blinded path.
public typealias BlindedForward = Bindings.BlindedForward

extension Bindings {


	/// Information used to forward or fail this HTLC that is being forwarded within a blinded path.
	public class BlindedForward: NativeTypeWrapper {

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

		internal var cType: LDKBlindedForward?

		internal init(cType: LDKBlindedForward, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKBlindedForward, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKBlindedForward, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the BlindedForward, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = BlindedForward_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The `blinding_point` that was set in the inbound [`msgs::UpdateAddHTLC`], or in the inbound
		/// onion payload if we're the introduction node. Useful for calculating the next hop's
		/// [`msgs::UpdateAddHTLC::blinding_point`].
		public func getInboundBlindingPoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBlindedForward>) in
					BlindedForward_get_inbound_blinding_point(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "BlindedForward.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The `blinding_point` that was set in the inbound [`msgs::UpdateAddHTLC`], or in the inbound
		/// onion payload if we're the introduction node. Useful for calculating the next hop's
		/// [`msgs::UpdateAddHTLC::blinding_point`].
		public func setInboundBlindingPoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "BlindedForward.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKBlindedForward>) in
					BlindedForward_set_inbound_blinding_point(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// If needed, this determines how this HTLC should be failed backwards, based on whether we are
		/// the introduction node.
		public func getFailure() -> BlindedFailure {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBlindedForward>) in
					BlindedForward_get_failure(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = BlindedFailure(value: nativeCallResult)


			return returnValue
		}

		/// If needed, this determines how this HTLC should be failed backwards, based on whether we are
		/// the introduction node.
		public func setFailure(val: BlindedFailure) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKBlindedForward>) in
					BlindedForward_set_failure(thisPtrPointer, val.getCValue())
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new BlindedForward given each field
		public init(inboundBlindingPointArg: [UInt8], failureArg: BlindedFailure) {
			// native call variable prep

			let inboundBlindingPointArgPrimitiveWrapper = PublicKey(
				value: inboundBlindingPointArg, instantiationContext: "BlindedForward.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = BlindedForward_new(
				inboundBlindingPointArgPrimitiveWrapper.cType!, failureArg.getCValue())

			// cleanup

			// for elided types, we need this
			inboundBlindingPointArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = BlindedForward(cType: nativeCallResult, instantiationContext: "BlindedForward.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "BlindedForward.swift::\(#function):\(#line)"
				)


		}

		/// Creates a copy of the BlindedForward
		internal func clone() -> BlindedForward {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBlindedForward>) in
					BlindedForward_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = BlindedForward(
				cType: nativeCallResult, instantiationContext: "BlindedForward.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the BlindedForward.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKBlindedForward>) in
					BlindedForward_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two BlindedForwards contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: BlindedForward, b: BlindedForward) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKBlindedForward>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKBlindedForward>) in
						BlindedForward_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the BlindedForward object into a byte array which can be read by BlindedForward_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKBlindedForward>) in
					BlindedForward_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "BlindedForward.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a BlindedForward from a byte array, created by BlindedForward_write
		public class func read(ser: [UInt8]) -> Result_BlindedForwardDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "BlindedForward.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = BlindedForward_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_BlindedForwardDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "BlindedForward.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> BlindedForward {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> BlindedForward {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> BlindedForward {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> BlindedForward {
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
						"Freeing BlindedForward \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing BlindedForward \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

