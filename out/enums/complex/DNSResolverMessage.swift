import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias DNSResolverMessage = Bindings.DNSResolverMessage

extension Bindings {

	/// An enum containing the possible onion messages which are used uses to request and receive
	/// DNSSEC proofs.
	public class DNSResolverMessage: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKDNSResolverMessage?

		internal init(cType: LDKDNSResolverMessage, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKDNSResolverMessage, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKDNSResolverMessage, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum DNSResolverMessageType {

			/// A query requesting a DNSSEC proof
			case DNSSECQuery

			/// A response containing a DNSSEC proof
			case DNSSECProof

		}

		public func getValueType() -> DNSResolverMessageType {
			switch self.cType!.tag {
				case LDKDNSResolverMessage_DNSSECQuery:
					return .DNSSECQuery

				case LDKDNSResolverMessage_DNSSECProof:
					return .DNSSECProof

				default:
					Bindings.print("Error: Invalid value type for DNSResolverMessage! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the DNSResolverMessage
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = DNSResolverMessage_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the DNSResolverMessage
		internal func clone() -> DNSResolverMessage {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKDNSResolverMessage>) in
					DNSResolverMessage_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = DNSResolverMessage(
				cType: nativeCallResult, instantiationContext: "DNSResolverMessage.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new DNSSECQuery-variant DNSResolverMessage
		public class func initWithDnssecquery(a: Bindings.DNSSECQuery) -> DNSResolverMessage {
			// native call variable prep


			// native method call
			let nativeCallResult = DNSResolverMessage_dnssecquery(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = DNSResolverMessage(
				cType: nativeCallResult, instantiationContext: "DNSResolverMessage.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new DNSSECProof-variant DNSResolverMessage
		public class func initWithDnssecproof(a: Bindings.DNSSECProof) -> DNSResolverMessage {
			// native call variable prep


			// native method call
			let nativeCallResult = DNSResolverMessage_dnssecproof(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = DNSResolverMessage(
				cType: nativeCallResult, instantiationContext: "DNSResolverMessage.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the DNSResolverMessage.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKDNSResolverMessage>) in
					DNSResolverMessage_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two DNSResolverMessages contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: DNSResolverMessage, b: DNSResolverMessage) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKDNSResolverMessage>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKDNSResolverMessage>) in
						DNSResolverMessage_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns whether `tlv_type` corresponds to a TLV record for DNS Resolvers.
		public class func isKnownType(tlvType: UInt64) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult = DNSResolverMessage_is_known_type(tlvType)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the DNSResolverMessage object into a byte array which can be read by DNSResolverMessage_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKDNSResolverMessage>) in
					DNSResolverMessage_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "DNSResolverMessage.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a DNSResolverMessage from a byte array, created by DNSResolverMessage_write
		public class func read(ser: [UInt8], arg: UInt64) -> Result_DNSResolverMessageDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "DNSResolverMessage.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = DNSResolverMessage_read(serPrimitiveWrapper.cType!, arg)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_DNSResolverMessageDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "DNSResolverMessage.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Constructs a new OnionMessageContents which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned OnionMessageContents must be freed before this_arg is
		public func asOnionMessageContents() -> Bindings.OnionMessageContents {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKDNSResolverMessage>) in
					DNSResolverMessage_as_OnionMessageContents(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedOnionMessageContents(
				cType: nativeCallResult, instantiationContext: "DNSResolverMessage.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}


		public func getValueAsDnssecQuery() -> Bindings.DNSSECQuery? {
			if self.cType?.tag != LDKDNSResolverMessage_DNSSECQuery {
				return nil
			}

			return DNSSECQuery(
				cType: self.cType!.dnssec_query,
				instantiationContext: "DNSResolverMessage.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsDnssecProof() -> Bindings.DNSSECProof? {
			if self.cType?.tag != LDKDNSResolverMessage_DNSSECProof {
				return nil
			}

			return DNSSECProof(
				cType: self.cType!.dnssec_proof,
				instantiationContext: "DNSResolverMessage.swift::\(#function):\(#line)", anchor: self)
		}


		internal func danglingClone() -> DNSResolverMessage {
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
						"Freeing DNSResolverMessage \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing DNSResolverMessage \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
