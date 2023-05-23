#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Struct used to return values from [`RevokeAndACK`] messages, containing a bunch of commitment
/// transaction updates if they were pending.
public typealias CommitmentUpdate = Bindings.CommitmentUpdate

extension Bindings {


	/// Struct used to return values from [`RevokeAndACK`] messages, containing a bunch of commitment
	/// transaction updates if they were pending.
	public class CommitmentUpdate: NativeTypeWrapper {

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

		internal var cType: LDKCommitmentUpdate?

		internal init(cType: LDKCommitmentUpdate, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKCommitmentUpdate, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCommitmentUpdate, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the CommitmentUpdate, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CommitmentUpdate_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// `update_add_htlc` messages which should be sent
		public func getUpdateAddHtlcs() -> [UpdateAddHTLC] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommitmentUpdate>) in
					CommitmentUpdate_get_update_add_htlcs(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_UpdateAddHTLCZ(
				cType: nativeCallResult, instantiationContext: "CommitmentUpdate.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// `update_add_htlc` messages which should be sent
		public func setUpdateAddHtlcs(val: [UpdateAddHTLC]) {
			// native call variable prep

			let valVector = Vec_UpdateAddHTLCZ(
				array: val, instantiationContext: "CommitmentUpdate.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommitmentUpdate>) in
					CommitmentUpdate_set_update_add_htlcs(thisPtrPointer, valVector.cType!)
				}


			// cleanup

			// valVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// `update_fulfill_htlc` messages which should be sent
		public func getUpdateFulfillHtlcs() -> [UpdateFulfillHTLC] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommitmentUpdate>) in
					CommitmentUpdate_get_update_fulfill_htlcs(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_UpdateFulfillHTLCZ(
				cType: nativeCallResult, instantiationContext: "CommitmentUpdate.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// `update_fulfill_htlc` messages which should be sent
		public func setUpdateFulfillHtlcs(val: [UpdateFulfillHTLC]) {
			// native call variable prep

			let valVector = Vec_UpdateFulfillHTLCZ(
				array: val, instantiationContext: "CommitmentUpdate.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommitmentUpdate>) in
					CommitmentUpdate_set_update_fulfill_htlcs(thisPtrPointer, valVector.cType!)
				}


			// cleanup

			// valVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// `update_fail_htlc` messages which should be sent
		public func getUpdateFailHtlcs() -> [UpdateFailHTLC] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommitmentUpdate>) in
					CommitmentUpdate_get_update_fail_htlcs(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_UpdateFailHTLCZ(
				cType: nativeCallResult, instantiationContext: "CommitmentUpdate.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// `update_fail_htlc` messages which should be sent
		public func setUpdateFailHtlcs(val: [UpdateFailHTLC]) {
			// native call variable prep

			let valVector = Vec_UpdateFailHTLCZ(
				array: val, instantiationContext: "CommitmentUpdate.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommitmentUpdate>) in
					CommitmentUpdate_set_update_fail_htlcs(thisPtrPointer, valVector.cType!)
				}


			// cleanup

			// valVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// `update_fail_malformed_htlc` messages which should be sent
		public func getUpdateFailMalformedHtlcs() -> [UpdateFailMalformedHTLC] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommitmentUpdate>) in
					CommitmentUpdate_get_update_fail_malformed_htlcs(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_UpdateFailMalformedHTLCZ(
				cType: nativeCallResult, instantiationContext: "CommitmentUpdate.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// `update_fail_malformed_htlc` messages which should be sent
		public func setUpdateFailMalformedHtlcs(val: [UpdateFailMalformedHTLC]) {
			// native call variable prep

			let valVector = Vec_UpdateFailMalformedHTLCZ(
				array: val, instantiationContext: "CommitmentUpdate.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommitmentUpdate>) in
					CommitmentUpdate_set_update_fail_malformed_htlcs(thisPtrPointer, valVector.cType!)
				}


			// cleanup

			// valVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// An `update_fee` message which should be sent
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func getUpdateFee() -> UpdateFee? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommitmentUpdate>) in
					CommitmentUpdate_get_update_fee(thisPtrPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKUpdateFee

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = UpdateFee(
				cType: nativeCallResult, instantiationContext: "CommitmentUpdate.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// An `update_fee` message which should be sent
		///
		/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func setUpdateFee(val: UpdateFee) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommitmentUpdate>) in
					CommitmentUpdate_set_update_fee(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A `commitment_signed` message which should be sent
		public func getCommitmentSigned() -> CommitmentSigned {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommitmentUpdate>) in
					CommitmentUpdate_get_commitment_signed(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = CommitmentSigned(
				cType: nativeCallResult, instantiationContext: "CommitmentUpdate.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// A `commitment_signed` message which should be sent
		public func setCommitmentSigned(val: CommitmentSigned) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommitmentUpdate>) in
					CommitmentUpdate_set_commitment_signed(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new CommitmentUpdate given each field
		public init(
			updateAddHtlcsArg: [UpdateAddHTLC], updateFulfillHtlcsArg: [UpdateFulfillHTLC],
			updateFailHtlcsArg: [UpdateFailHTLC], updateFailMalformedHtlcsArg: [UpdateFailMalformedHTLC],
			updateFeeArg: UpdateFee, commitmentSignedArg: CommitmentSigned
		) {
			// native call variable prep

			let updateAddHtlcsArgVector = Vec_UpdateAddHTLCZ(
				array: updateAddHtlcsArg, instantiationContext: "CommitmentUpdate.swift::\(#function):\(#line)"
			)
			.dangle()

			let updateFulfillHtlcsArgVector = Vec_UpdateFulfillHTLCZ(
				array: updateFulfillHtlcsArg, instantiationContext: "CommitmentUpdate.swift::\(#function):\(#line)"
			)
			.dangle()

			let updateFailHtlcsArgVector = Vec_UpdateFailHTLCZ(
				array: updateFailHtlcsArg, instantiationContext: "CommitmentUpdate.swift::\(#function):\(#line)"
			)
			.dangle()

			let updateFailMalformedHtlcsArgVector = Vec_UpdateFailMalformedHTLCZ(
				array: updateFailMalformedHtlcsArg,
				instantiationContext: "CommitmentUpdate.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = CommitmentUpdate_new(
				updateAddHtlcsArgVector.cType!, updateFulfillHtlcsArgVector.cType!, updateFailHtlcsArgVector.cType!,
				updateFailMalformedHtlcsArgVector.cType!, updateFeeArg.dynamicallyDangledClone().cType!,
				commitmentSignedArg.dynamicallyDangledClone().cType!)

			// cleanup

			// updateAddHtlcsArgVector.noOpRetain()

			// updateFulfillHtlcsArgVector.noOpRetain()

			// updateFailHtlcsArgVector.noOpRetain()

			// updateFailMalformedHtlcsArgVector.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = CommitmentUpdate(cType: nativeCallResult, instantiationContext: "CommitmentUpdate.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "CommitmentUpdate.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the CommitmentUpdate
		internal func clone() -> CommitmentUpdate {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCommitmentUpdate>) in
					CommitmentUpdate_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = CommitmentUpdate(
				cType: nativeCallResult, instantiationContext: "CommitmentUpdate.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two CommitmentUpdates contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: CommitmentUpdate, b: CommitmentUpdate) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKCommitmentUpdate>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKCommitmentUpdate>) in
						CommitmentUpdate_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


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


		internal func dangle(_ shouldDangle: Bool = true) -> CommitmentUpdate {
			self.dangling = shouldDangle
			return self
		}


		internal func danglingClone() -> CommitmentUpdate {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> CommitmentUpdate {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> CommitmentUpdate {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> CommitmentUpdate {
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
						"Freeing CommitmentUpdate \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing CommitmentUpdate \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

