#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A [`closing_signed`] message to be sent to or received from a peer.
///
/// [`closing_signed`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#closing-negotiation-closing_signed
public typealias ClosingSigned = Bindings.ClosingSigned

extension Bindings {


	/// A [`closing_signed`] message to be sent to or received from a peer.
	///
	/// [`closing_signed`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#closing-negotiation-closing_signed
	public class ClosingSigned: NativeTypeWrapper {

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

		internal var cType: LDKClosingSigned?

		internal init(cType: LDKClosingSigned, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKClosingSigned, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKClosingSigned, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the ClosingSigned, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ClosingSigned_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The channel ID
		public func getChannelId() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKClosingSigned>) in
					ClosingSigned_get_channel_id(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// The channel ID
		public func setChannelId(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ThirtyTwoBytes(
				value: val, instantiationContext: "ClosingSigned.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKClosingSigned>) in
					ClosingSigned_set_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The proposed total fee for the closing transaction
		public func getFeeSatoshis() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKClosingSigned>) in
					ClosingSigned_get_fee_satoshis(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The proposed total fee for the closing transaction
		public func setFeeSatoshis(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKClosingSigned>) in
					ClosingSigned_set_fee_satoshis(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A signature on the closing transaction
		public func getSignature() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKClosingSigned>) in
					ClosingSigned_get_signature(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Signature(
				cType: nativeCallResult, instantiationContext: "ClosingSigned.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// A signature on the closing transaction
		public func setSignature(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = Signature(
				value: val, instantiationContext: "ClosingSigned.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKClosingSigned>) in
					ClosingSigned_set_signature(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The minimum and maximum fees which the sender is willing to accept, provided only by new
		/// nodes.
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func getFeeRange() -> ClosingSignedFeeRange? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKClosingSigned>) in
					ClosingSigned_get_fee_range(thisPtrPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKClosingSignedFeeRange

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = ClosingSignedFeeRange(
				cType: nativeCallResult, instantiationContext: "ClosingSigned.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The minimum and maximum fees which the sender is willing to accept, provided only by new
		/// nodes.
		///
		/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func setFeeRange(val: ClosingSignedFeeRange) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKClosingSigned>) in
					ClosingSigned_set_fee_range(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new ClosingSigned given each field
		public init(
			channelIdArg: [UInt8], feeSatoshisArg: UInt64, signatureArg: [UInt8], feeRangeArg: ClosingSignedFeeRange
		) {
			// native call variable prep

			let channelIdArgPrimitiveWrapper = ThirtyTwoBytes(
				value: channelIdArg, instantiationContext: "ClosingSigned.swift::\(#function):\(#line)")

			let signatureArgPrimitiveWrapper = Signature(
				value: signatureArg, instantiationContext: "ClosingSigned.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = ClosingSigned_new(
				channelIdArgPrimitiveWrapper.cType!, feeSatoshisArg, signatureArgPrimitiveWrapper.cType!,
				feeRangeArg.dynamicallyDangledClone().cType!)

			// cleanup

			// for elided types, we need this
			channelIdArgPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			signatureArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = ClosingSigned(cType: nativeCallResult, instantiationContext: "ClosingSigned.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "ClosingSigned.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the ClosingSigned
		internal func clone() -> ClosingSigned {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKClosingSigned>) in
					ClosingSigned_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ClosingSigned(
				cType: nativeCallResult, instantiationContext: "ClosingSigned.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two ClosingSigneds contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: ClosingSigned, b: ClosingSigned) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKClosingSigned>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKClosingSigned>) in
						ClosingSigned_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the ClosingSigned object into a byte array which can be read by ClosingSigned_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKClosingSigned>) in
					ClosingSigned_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "ClosingSigned.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a ClosingSigned from a byte array, created by ClosingSigned_write
		public class func read(ser: [UInt8]) -> Result_ClosingSignedDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "ClosingSigned.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = ClosingSigned_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_ClosingSignedDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "ClosingSigned.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> ClosingSigned {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> ClosingSigned {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> ClosingSigned {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> ClosingSigned {
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
						"Freeing ClosingSigned \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ClosingSigned \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

