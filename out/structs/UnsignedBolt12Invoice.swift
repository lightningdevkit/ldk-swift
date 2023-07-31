#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A semantically valid [`Bolt12Invoice`] that hasn't been signed.
public typealias UnsignedBolt12Invoice = Bindings.UnsignedBolt12Invoice

extension Bindings {


	/// A semantically valid [`Bolt12Invoice`] that hasn't been signed.
	public class UnsignedBolt12Invoice: NativeTypeWrapper {

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

		internal var cType: LDKUnsignedBolt12Invoice?

		internal init(cType: LDKUnsignedBolt12Invoice, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKUnsignedBolt12Invoice, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKUnsignedBolt12Invoice, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Frees any resources used by the UnsignedBolt12Invoice, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = UnsignedBolt12Invoice_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The public key corresponding to the key needed to sign the invoice.
		public func signingPubkey() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUnsignedBolt12Invoice>) in
					UnsignedBolt12Invoice_signing_pubkey(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "UnsignedBolt12Invoice.swift::\(#function):\(#line)",
				anchor: self
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


		internal func setCFreeability(freeable: Bool) -> UnsignedBolt12Invoice {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> UnsignedBolt12Invoice {
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
						"Freeing UnsignedBolt12Invoice \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing UnsignedBolt12Invoice \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

