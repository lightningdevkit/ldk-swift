#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias HolderCommitmentTransaction = Bindings.HolderCommitmentTransaction

extension Bindings {

	public class HolderCommitmentTransaction: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKHolderCommitmentTransaction?


		/* DEFAULT_CONSTRUCTOR_START */
		public init(commitment_tx: CommitmentTransaction, counterparty_sig: [UInt8], counterparty_htlc_sigs: [[UInt8]], holder_funding_key: [UInt8], counterparty_funding_key: [UInt8]) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
						let counterparty_htlc_sigsWrapper = Bindings.new_LDKCVec_SignatureZWrapper(array: counterparty_htlc_sigs)
						defer {
							counterparty_htlc_sigsWrapper.noOpRetain()
						}
					
			self.cOpaqueStruct = HolderCommitmentTransaction_new(commitment_tx.danglingClone().cOpaqueStruct!, Bindings.new_LDKSignature(array: counterparty_sig), counterparty_htlc_sigsWrapper.dangle().cOpaqueStruct!, Bindings.new_LDKPublicKey(array: holder_funding_key), Bindings.new_LDKPublicKey(array: counterparty_funding_key))
			super.init(conflictAvoidingVariableName: 0)
			
		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKHolderCommitmentTransaction){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKHolderCommitmentTransaction, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func get_counterparty_sig() -> [UInt8] {
			
			return Bindings.LDKSignature_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
HolderCommitmentTransaction_get_counterparty_sig(this_ptrPointer)
});
		}

		public func set_counterparty_sig(val: [UInt8]) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKHolderCommitmentTransaction>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return HolderCommitmentTransaction_set_counterparty_sig(this_ptrPointer, Bindings.new_LDKSignature(array: val));
		}

		public func get_counterparty_htlc_sigs() -> [[UInt8]] {
			
			return Bindings.LDKCVec_SignatureZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
HolderCommitmentTransaction_get_counterparty_htlc_sigs(this_ptrPointer)
});
		}

		public func set_counterparty_htlc_sigs(val: [[UInt8]]) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKHolderCommitmentTransaction>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKCVec_SignatureZWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
			return HolderCommitmentTransaction_set_counterparty_htlc_sigs(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
		}

		public func clone() -> HolderCommitmentTransaction {
			
			return HolderCommitmentTransaction(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
HolderCommitmentTransaction_clone(origPointer)
});
		}

					internal func danglingClone() -> HolderCommitmentTransaction {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public func write() -> [UInt8] {
			
			return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
HolderCommitmentTransaction_write(objPointer)
});
		}

		public class func read(ser: [UInt8]) -> Result_HolderCommitmentTransactionDecodeErrorZ {
			
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
			return Result_HolderCommitmentTransactionDecodeErrorZ(pointer: HolderCommitmentTransaction_read(serWrapper.cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return HolderCommitmentTransaction_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> HolderCommitmentTransaction {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing HolderCommitmentTransaction \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing HolderCommitmentTransaction \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
