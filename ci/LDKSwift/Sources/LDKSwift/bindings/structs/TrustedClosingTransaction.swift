#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias TrustedClosingTransaction = Bindings.TrustedClosingTransaction

extension Bindings {

	public class TrustedClosingTransaction: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKTrustedClosingTransaction?


		

		public init(pointer: LDKTrustedClosingTransaction){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKTrustedClosingTransaction, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func built_transaction() -> [UInt8] {
			
			return Bindings.LDKTransaction_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKTrustedClosingTransaction>) in
TrustedClosingTransaction_built_transaction(this_argPointer)
}, callerContext: "TrustedClosingTransaction::built_transaction");
		}

		public func get_sighash_all(funding_redeemscript: [UInt8], channel_value_satoshis: UInt64) -> [UInt8] {
			
						let funding_redeemscriptWrapper = Bindings.new_LDKu8sliceWrapper(array: funding_redeemscript)
						defer {
							funding_redeemscriptWrapper.noOpRetain()
						}
					
			return Bindings.LDKThirtyTwoBytes_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKTrustedClosingTransaction>) in
TrustedClosingTransaction_get_sighash_all(this_argPointer, funding_redeemscriptWrapper.cOpaqueStruct!, channel_value_satoshis)
});
		}

		public func sign(funding_key: [UInt8], funding_redeemscript: [UInt8], channel_value_satoshis: UInt64) -> [UInt8] {
			
						let funding_redeemscriptWrapper = Bindings.new_LDKu8sliceWrapper(array: funding_redeemscript)
						defer {
							funding_redeemscriptWrapper.noOpRetain()
						}
					
			return Bindings.LDKSignature_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKTrustedClosingTransaction>) in
withUnsafePointer(to: Bindings.array_to_tuple32(array: funding_key)) { (funding_keyPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
TrustedClosingTransaction_sign(this_argPointer, funding_keyPointer, funding_redeemscriptWrapper.cOpaqueStruct!, channel_value_satoshis)
}
});
		}

		internal func free() -> Void {
			
			return TrustedClosingTransaction_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> TrustedClosingTransaction {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing TrustedClosingTransaction \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing TrustedClosingTransaction \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
