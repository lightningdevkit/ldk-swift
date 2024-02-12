#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A wrapper for a `Transaction` which can only be constructed with [`TransactionU16LenLimited::new`]
/// if the `Transaction`'s consensus-serialized length is <= u16::MAX.
///
/// Use [`TransactionU16LenLimited::into_transaction`] to convert into the contained `Transaction`.
public typealias TransactionU16LenLimited = Bindings.TransactionU16LenLimited

extension Bindings {


	/// A wrapper for a `Transaction` which can only be constructed with [`TransactionU16LenLimited::new`]
	/// if the `Transaction`'s consensus-serialized length is <= u16::MAX.
	///
	/// Use [`TransactionU16LenLimited::into_transaction`] to convert into the contained `Transaction`.
	public class TransactionU16LenLimited: NativeTypeWrapper {

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

		internal var cType: LDKTransactionU16LenLimited?

		internal init(cType: LDKTransactionU16LenLimited, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKTransactionU16LenLimited, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKTransactionU16LenLimited, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Frees any resources used by the TransactionU16LenLimited, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = TransactionU16LenLimited_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the TransactionU16LenLimited
		internal func clone() -> TransactionU16LenLimited {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKTransactionU16LenLimited>) in
					TransactionU16LenLimited_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = TransactionU16LenLimited(
				cType: nativeCallResult, instantiationContext: "TransactionU16LenLimited.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the TransactionU16LenLimited.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKTransactionU16LenLimited>) in
					TransactionU16LenLimited_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two TransactionU16LenLimiteds contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: TransactionU16LenLimited, b: TransactionU16LenLimited) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKTransactionU16LenLimited>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKTransactionU16LenLimited>) in
						TransactionU16LenLimited_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new `TransactionU16LenLimited` from a `Transaction` only if it's consensus-
		/// serialized length is <= u16::MAX.
		public class func new(transaction: [UInt8]) -> Result_TransactionU16LenLimitedNoneZ {
			// native call variable prep

			let transactionPrimitiveWrapper = Transaction(
				value: transaction, instantiationContext: "TransactionU16LenLimited.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = TransactionU16LenLimited_new(transactionPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			transactionPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_TransactionU16LenLimitedNoneZ(
				cType: nativeCallResult, instantiationContext: "TransactionU16LenLimited.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Consumes this `TransactionU16LenLimited` and returns its contained `Transaction`.
		public func intoTransaction() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult = TransactionU16LenLimited_into_transaction(self.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Transaction(
				cType: nativeCallResult, instantiationContext: "TransactionU16LenLimited.swift::\(#function):\(#line)"
			)
			.getValue()


			return returnValue
		}

		/// Serialize the TransactionU16LenLimited object into a byte array which can be read by TransactionU16LenLimited_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKTransactionU16LenLimited>) in
					TransactionU16LenLimited_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "TransactionU16LenLimited.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a TransactionU16LenLimited from a byte array, created by TransactionU16LenLimited_write
		public class func read(ser: [UInt8]) -> Result_TransactionU16LenLimitedDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "TransactionU16LenLimited.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = TransactionU16LenLimited_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_TransactionU16LenLimitedDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "TransactionU16LenLimited.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> TransactionU16LenLimited {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> TransactionU16LenLimited {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> TransactionU16LenLimited {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> TransactionU16LenLimited {
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
						"Freeing TransactionU16LenLimited \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing TransactionU16LenLimited \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

