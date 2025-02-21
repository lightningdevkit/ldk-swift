#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Contains a simple nonce for use in a blinded path's context.
///
/// Such a context is required when receiving a [`DNSSECProof`] message.
///
/// [`DNSSECProof`]: crate::onion_message::dns_resolution::DNSSECProof
public typealias DNSResolverContext = Bindings.DNSResolverContext

extension Bindings {


	/// Contains a simple nonce for use in a blinded path's context.
	///
	/// Such a context is required when receiving a [`DNSSECProof`] message.
	///
	/// [`DNSSECProof`]: crate::onion_message::dns_resolution::DNSSECProof
	public class DNSResolverContext: NativeTypeWrapper {

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

		internal var cType: LDKDNSResolverContext?

		internal init(cType: LDKDNSResolverContext, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKDNSResolverContext, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKDNSResolverContext, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the DNSResolverContext, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = DNSResolverContext_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A nonce which uniquely describes a DNS resolution.
		///
		/// When we receive a DNSSEC proof message, we should check that it was sent over the blinded
		/// path we included in the request by comparing a stored nonce with this one.
		public func getNonce() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKDNSResolverContext>) in
					DNSResolverContext_get_nonce(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple16ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// A nonce which uniquely describes a DNS resolution.
		///
		/// When we receive a DNSSEC proof message, we should check that it was sent over the blinded
		/// path we included in the request by comparing a stored nonce with this one.
		public func setNonce(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = SixteenBytes(
				value: val, instantiationContext: "DNSResolverContext.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKDNSResolverContext>) in
					DNSResolverContext_set_nonce(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new DNSResolverContext given each field
		public init(nonceArg: [UInt8]) {
			// native call variable prep

			let nonceArgPrimitiveWrapper = SixteenBytes(
				value: nonceArg, instantiationContext: "DNSResolverContext.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = DNSResolverContext_new(nonceArgPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			nonceArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = DNSResolverContext(cType: nativeCallResult, instantiationContext: "DNSResolverContext.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "DNSResolverContext.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the DNSResolverContext
		internal func clone() -> DNSResolverContext {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKDNSResolverContext>) in
					DNSResolverContext_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = DNSResolverContext(
				cType: nativeCallResult, instantiationContext: "DNSResolverContext.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the DNSResolverContext.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKDNSResolverContext>) in
					DNSResolverContext_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two DNSResolverContexts contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: DNSResolverContext, b: DNSResolverContext) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKDNSResolverContext>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKDNSResolverContext>) in
						DNSResolverContext_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the DNSResolverContext object into a byte array which can be read by DNSResolverContext_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKDNSResolverContext>) in
					DNSResolverContext_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "DNSResolverContext.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a DNSResolverContext from a byte array, created by DNSResolverContext_write
		public class func read(ser: [UInt8]) -> Result_DNSResolverContextDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "DNSResolverContext.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = DNSResolverContext_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_DNSResolverContextDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "DNSResolverContext.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> DNSResolverContext {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> DNSResolverContext {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> DNSResolverContext {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> DNSResolverContext {
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
						"Freeing DNSResolverContext \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing DNSResolverContext \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

