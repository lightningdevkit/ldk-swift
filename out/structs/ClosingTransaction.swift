#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// This class tracks the per-transaction information needed to build a closing transaction and will
/// actually build it and sign.
///
/// This class can be used inside a signer implementation to generate a signature given the relevant
/// secret key.
public typealias ClosingTransaction = Bindings.ClosingTransaction

extension Bindings {


	/// This class tracks the per-transaction information needed to build a closing transaction and will
	/// actually build it and sign.
	///
	/// This class can be used inside a signer implementation to generate a signature given the relevant
	/// secret key.
	public class ClosingTransaction: NativeTypeWrapper {

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

		internal var cType: LDKClosingTransaction?

		internal init(cType: LDKClosingTransaction, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKClosingTransaction, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKClosingTransaction, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the ClosingTransaction, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ClosingTransaction_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the ClosingTransaction
		internal func clone() -> ClosingTransaction {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKClosingTransaction>) in
					ClosingTransaction_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ClosingTransaction(
				cType: nativeCallResult, instantiationContext: "ClosingTransaction.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the ClosingTransaction.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKClosingTransaction>) in
					ClosingTransaction_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two ClosingTransactions contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: ClosingTransaction, b: ClosingTransaction) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKClosingTransaction>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKClosingTransaction>) in
						ClosingTransaction_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Construct an object of the class
		public init(
			toHolderValueSat: UInt64, toCounterpartyValueSat: UInt64, toHolderScript: [UInt8],
			toCounterpartyScript: [UInt8], fundingOutpoint: OutPoint
		) {
			// native call variable prep

			let toHolderScriptVector = Vec_u8Z(
				array: toHolderScript, instantiationContext: "ClosingTransaction.swift::\(#function):\(#line)"
			)
			.dangle()

			let toCounterpartyScriptVector = Vec_u8Z(
				array: toCounterpartyScript, instantiationContext: "ClosingTransaction.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = ClosingTransaction_new(
				toHolderValueSat, toCounterpartyValueSat, toHolderScriptVector.cType!,
				toCounterpartyScriptVector.cType!, fundingOutpoint.dynamicallyDangledClone().cType!)

			// cleanup

			// toHolderScriptVector.noOpRetain()

			// toCounterpartyScriptVector.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = ClosingTransaction(cType: nativeCallResult, instantiationContext: "ClosingTransaction.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "ClosingTransaction.swift::\(#function):\(#line)")


		}

		/// Trust our pre-built transaction.
		///
		/// Applies a wrapper which allows access to the transaction.
		///
		/// This should only be used if you fully trust the builder of this object. It should not
		/// be used by an external signer - instead use the verify function.
		public func trust() -> TrustedClosingTransaction {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKClosingTransaction>) in
					ClosingTransaction_trust(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = TrustedClosingTransaction(
				cType: nativeCallResult, instantiationContext: "ClosingTransaction.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Verify our pre-built transaction.
		///
		/// Applies a wrapper which allows access to the transaction.
		///
		/// An external validating signer must call this method before signing
		/// or using the built transaction.
		public func verify(fundingOutpoint: OutPoint) -> Result_TrustedClosingTransactionNoneZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKClosingTransaction>) in
					ClosingTransaction_verify(thisArgPointer, fundingOutpoint.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_TrustedClosingTransactionNoneZ(
				cType: nativeCallResult, instantiationContext: "ClosingTransaction.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The value to be sent to the holder, or zero if the output will be omitted
		public func toHolderValueSat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKClosingTransaction>) in
					ClosingTransaction_to_holder_value_sat(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The value to be sent to the counterparty, or zero if the output will be omitted
		public func toCounterpartyValueSat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKClosingTransaction>) in
					ClosingTransaction_to_counterparty_value_sat(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The destination of the holder's output
		public func toHolderScript() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKClosingTransaction>) in
					ClosingTransaction_to_holder_script(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = u8slice(
				cType: nativeCallResult, instantiationContext: "ClosingTransaction.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle().getValue()


			return returnValue
		}

		/// The destination of the counterparty's output
		public func toCounterpartyScript() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKClosingTransaction>) in
					ClosingTransaction_to_counterparty_script(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = u8slice(
				cType: nativeCallResult, instantiationContext: "ClosingTransaction.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle().getValue()


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


		internal func danglingClone() -> ClosingTransaction {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> ClosingTransaction {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> ClosingTransaction {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> ClosingTransaction {
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
						"Freeing ClosingTransaction \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ClosingTransaction \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

