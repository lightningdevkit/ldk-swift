import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias AsyncPaymentsMessage = Bindings.AsyncPaymentsMessage

extension Bindings {

	/// Possible async payment messages sent and received via an [`OnionMessage`].
	///
	/// [`OnionMessage`]: crate::ln::msgs::OnionMessage
	public class AsyncPaymentsMessage: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKAsyncPaymentsMessage?

		internal init(cType: LDKAsyncPaymentsMessage, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKAsyncPaymentsMessage, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKAsyncPaymentsMessage, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum AsyncPaymentsMessageType {

			/// An HTLC is being held upstream for the often-offline recipient, to be released via
			/// [`ReleaseHeldHtlc`].
			case HeldHtlcAvailable

			/// Releases the HTLC corresponding to an inbound [`HeldHtlcAvailable`] message.
			case ReleaseHeldHtlc

		}

		public func getValueType() -> AsyncPaymentsMessageType {
			switch self.cType!.tag {
				case LDKAsyncPaymentsMessage_HeldHtlcAvailable:
					return .HeldHtlcAvailable

				case LDKAsyncPaymentsMessage_ReleaseHeldHtlc:
					return .ReleaseHeldHtlc

				default:
					Bindings.print("Error: Invalid value type for AsyncPaymentsMessage! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the AsyncPaymentsMessage
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = AsyncPaymentsMessage_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the AsyncPaymentsMessage
		internal func clone() -> AsyncPaymentsMessage {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKAsyncPaymentsMessage>) in
					AsyncPaymentsMessage_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = AsyncPaymentsMessage(
				cType: nativeCallResult, instantiationContext: "AsyncPaymentsMessage.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new HeldHtlcAvailable-variant AsyncPaymentsMessage
		public class func initWithHeldHtlcAvailable(a: Bindings.HeldHtlcAvailable) -> AsyncPaymentsMessage {
			// native call variable prep


			// native method call
			let nativeCallResult = AsyncPaymentsMessage_held_htlc_available(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = AsyncPaymentsMessage(
				cType: nativeCallResult, instantiationContext: "AsyncPaymentsMessage.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new ReleaseHeldHtlc-variant AsyncPaymentsMessage
		public class func initWithReleaseHeldHtlc(a: Bindings.ReleaseHeldHtlc) -> AsyncPaymentsMessage {
			// native call variable prep


			// native method call
			let nativeCallResult = AsyncPaymentsMessage_release_held_htlc(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = AsyncPaymentsMessage(
				cType: nativeCallResult, instantiationContext: "AsyncPaymentsMessage.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Returns whether `tlv_type` corresponds to a TLV record for async payment messages.
		public class func isKnownType(tlvType: UInt64) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult = AsyncPaymentsMessage_is_known_type(tlvType)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new OnionMessageContents which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned OnionMessageContents must be freed before this_arg is
		public func asOnionMessageContents() -> Bindings.OnionMessageContents {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKAsyncPaymentsMessage>) in
					AsyncPaymentsMessage_as_OnionMessageContents(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedOnionMessageContents(
				cType: nativeCallResult, instantiationContext: "AsyncPaymentsMessage.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Serialize the AsyncPaymentsMessage object into a byte array which can be read by AsyncPaymentsMessage_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKAsyncPaymentsMessage>) in
					AsyncPaymentsMessage_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "AsyncPaymentsMessage.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a AsyncPaymentsMessage from a byte array, created by AsyncPaymentsMessage_write
		public class func read(ser: [UInt8], arg: UInt64) -> Result_AsyncPaymentsMessageDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "AsyncPaymentsMessage.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = AsyncPaymentsMessage_read(serPrimitiveWrapper.cType!, arg)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_AsyncPaymentsMessageDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "AsyncPaymentsMessage.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValueAsHeldHtlcAvailable() -> Bindings.HeldHtlcAvailable? {
			if self.cType?.tag != LDKAsyncPaymentsMessage_HeldHtlcAvailable {
				return nil
			}

			return HeldHtlcAvailable(
				cType: self.cType!.held_htlc_available,
				instantiationContext: "AsyncPaymentsMessage.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsReleaseHeldHtlc() -> Bindings.ReleaseHeldHtlc? {
			if self.cType?.tag != LDKAsyncPaymentsMessage_ReleaseHeldHtlc {
				return nil
			}

			return ReleaseHeldHtlc(
				cType: self.cType!.release_held_htlc,
				instantiationContext: "AsyncPaymentsMessage.swift::\(#function):\(#line)", anchor: self)
		}


		internal func danglingClone() -> AsyncPaymentsMessage {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing AsyncPaymentsMessage \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing AsyncPaymentsMessage \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
