#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Base key used in conjunction with a `per_commitment_point` to generate an [`HtlcKey`].
///
/// HTLC keys are used to ensure only the recipient of an HTLC can claim it on-chain with the HTLC
/// preimage and that only the sender of an HTLC can claim it on-chain after it has timed out.
/// Thus, both channel counterparties' HTLC keys will appears in each HTLC output's script.
public typealias HtlcBasepoint = Bindings.HtlcBasepoint

extension Bindings {


	/// Base key used in conjunction with a `per_commitment_point` to generate an [`HtlcKey`].
	///
	/// HTLC keys are used to ensure only the recipient of an HTLC can claim it on-chain with the HTLC
	/// preimage and that only the sender of an HTLC can claim it on-chain after it has timed out.
	/// Thus, both channel counterparties' HTLC keys will appears in each HTLC output's script.
	public class HtlcBasepoint: NativeTypeWrapper {

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

		internal var cType: LDKHtlcBasepoint?

		internal init(cType: LDKHtlcBasepoint, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKHtlcBasepoint, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKHtlcBasepoint, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the HtlcBasepoint, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = HtlcBasepoint_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		///
		public func getA() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKHtlcBasepoint>) in
					HtlcBasepoint_get_a(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "HtlcBasepoint.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		///
		public func setA(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "HtlcBasepoint.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKHtlcBasepoint>) in
					HtlcBasepoint_set_a(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new HtlcBasepoint given each field
		public init(aArg: [UInt8]) {
			// native call variable prep

			let aArgPrimitiveWrapper = PublicKey(
				value: aArg, instantiationContext: "HtlcBasepoint.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = HtlcBasepoint_new(aArgPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			aArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = HtlcBasepoint(cType: nativeCallResult, instantiationContext: "HtlcBasepoint.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "HtlcBasepoint.swift::\(#function):\(#line)")


		}

		/// Checks if two HtlcBasepoints contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: HtlcBasepoint, b: HtlcBasepoint) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKHtlcBasepoint>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKHtlcBasepoint>) in
						HtlcBasepoint_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the HtlcBasepoint
		internal func clone() -> HtlcBasepoint {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKHtlcBasepoint>) in
					HtlcBasepoint_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = HtlcBasepoint(
				cType: nativeCallResult, instantiationContext: "HtlcBasepoint.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the HtlcBasepoint.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKHtlcBasepoint>) in
					HtlcBasepoint_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Get inner Public Key
		public func toPublicKey() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKHtlcBasepoint>) in
					HtlcBasepoint_to_public_key(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "HtlcBasepoint.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Serialize the HtlcBasepoint object into a byte array which can be read by HtlcBasepoint_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKHtlcBasepoint>) in
					HtlcBasepoint_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "HtlcBasepoint.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a HtlcBasepoint from a byte array, created by HtlcBasepoint_write
		public class func read(ser: [UInt8]) -> Result_HtlcBasepointDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "HtlcBasepoint.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = HtlcBasepoint_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_HtlcBasepointDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "HtlcBasepoint.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> HtlcBasepoint {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> HtlcBasepoint {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> HtlcBasepoint {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> HtlcBasepoint {
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
						"Freeing HtlcBasepoint \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing HtlcBasepoint \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

