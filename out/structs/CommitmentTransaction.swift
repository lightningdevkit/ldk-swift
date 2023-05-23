#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// This class tracks the per-transaction information needed to build a commitment transaction and will
/// actually build it and sign.  It is used for holder transactions that we sign only when needed
/// and for transactions we sign for the counterparty.
///
/// This class can be used inside a signer implementation to generate a signature given the relevant
/// secret key.
public typealias CommitmentTransaction = Bindings.CommitmentTransaction

extension Bindings {


	/// This class tracks the per-transaction information needed to build a commitment transaction and will
	/// actually build it and sign.  It is used for holder transactions that we sign only when needed
	/// and for transactions we sign for the counterparty.
	///
	/// This class can be used inside a signer implementation to generate a signature given the relevant
	/// secret key.
	public class CommitmentTransaction: NativeTypeWrapper {

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

		internal var cType: LDKCommitmentTransaction?

		internal init(cType: LDKCommitmentTransaction, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKCommitmentTransaction, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCommitmentTransaction, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Frees any resources used by the CommitmentTransaction, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CommitmentTransaction_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the CommitmentTransaction
		internal func clone() -> CommitmentTransaction {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCommitmentTransaction>) in
					CommitmentTransaction_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = CommitmentTransaction(
				cType: nativeCallResult, instantiationContext: "CommitmentTransaction.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Serialize the CommitmentTransaction object into a byte array which can be read by CommitmentTransaction_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKCommitmentTransaction>) in
					CommitmentTransaction_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "CommitmentTransaction.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a CommitmentTransaction from a byte array, created by CommitmentTransaction_write
		public class func read(ser: [UInt8]) -> Result_CommitmentTransactionDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "CommitmentTransaction.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = CommitmentTransaction_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_CommitmentTransactionDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "CommitmentTransaction.swift::\(#function):\(#line)")


			return returnValue
		}

		/// The backwards-counting commitment number
		public func commitmentNumber() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKCommitmentTransaction>) in
					CommitmentTransaction_commitment_number(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The value to be sent to the broadcaster
		public func toBroadcasterValueSat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKCommitmentTransaction>) in
					CommitmentTransaction_to_broadcaster_value_sat(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The value to be sent to the counterparty
		public func toCountersignatoryValueSat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKCommitmentTransaction>) in
					CommitmentTransaction_to_countersignatory_value_sat(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The feerate paid per 1000-weight-unit in this commitment transaction.
		public func feeratePerKw() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKCommitmentTransaction>) in
					CommitmentTransaction_feerate_per_kw(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Trust our pre-built transaction and derived transaction creation public keys.
		///
		/// Applies a wrapper which allows access to these fields.
		///
		/// This should only be used if you fully trust the builder of this object.  It should not
		/// be used by an external signer - instead use the verify function.
		public func trust() -> TrustedCommitmentTransaction {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKCommitmentTransaction>) in
					CommitmentTransaction_trust(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = TrustedCommitmentTransaction(
				cType: nativeCallResult, instantiationContext: "CommitmentTransaction.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Verify our pre-built transaction and derived transaction creation public keys.
		///
		/// Applies a wrapper which allows access to these fields.
		///
		/// An external validating signer must call this method before signing
		/// or using the built transaction.
		public func verify(
			channelParameters: DirectedChannelTransactionParameters, broadcasterKeys: ChannelPublicKeys,
			countersignatoryKeys: ChannelPublicKeys
		) -> Result_TrustedCommitmentTransactionNoneZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKCommitmentTransaction>) in

					withUnsafePointer(to: channelParameters.cType!) {
						(channelParametersPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in

						withUnsafePointer(to: broadcasterKeys.cType!) {
							(broadcasterKeysPointer: UnsafePointer<LDKChannelPublicKeys>) in

							withUnsafePointer(to: countersignatoryKeys.cType!) {
								(countersignatoryKeysPointer: UnsafePointer<LDKChannelPublicKeys>) in
								CommitmentTransaction_verify(
									thisArgPointer, channelParametersPointer, broadcasterKeysPointer,
									countersignatoryKeysPointer)
							}

						}

					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_TrustedCommitmentTransactionNoneZ(
				cType: nativeCallResult, instantiationContext: "CommitmentTransaction.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


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


		internal func dangle(_ shouldDangle: Bool = true) -> CommitmentTransaction {
			self.dangling = shouldDangle
			return self
		}


		internal func danglingClone() -> CommitmentTransaction {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> CommitmentTransaction {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> CommitmentTransaction {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> CommitmentTransaction {
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
						"Freeing CommitmentTransaction \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing CommitmentTransaction \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

