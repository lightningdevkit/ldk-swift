#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias InFlightHtlcs = Bindings.InFlightHtlcs

extension Bindings {

	public class InFlightHtlcs: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKInFlightHtlcs?


		

		public init(pointer: LDKInFlightHtlcs){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKInFlightHtlcs, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func used_liquidity_msat(source: NodeId, target: NodeId, channel_scid: UInt64) -> Option_u64Z {
			
			return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInFlightHtlcs>) in
withUnsafePointer(to: source.cOpaqueStruct!) { (sourcePointer: UnsafePointer<LDKNodeId>) in
withUnsafePointer(to: target.cOpaqueStruct!) { (targetPointer: UnsafePointer<LDKNodeId>) in
InFlightHtlcs_used_liquidity_msat(this_argPointer, sourcePointer, targetPointer, channel_scid)
}
}
});
		}

		public func write() -> [UInt8] {
			
			return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKInFlightHtlcs>) in
InFlightHtlcs_write(objPointer)
});
		}

		public class func read(ser: [UInt8]) -> Result_InFlightHtlcsDecodeErrorZ {
			
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
			return Result_InFlightHtlcsDecodeErrorZ(pointer: InFlightHtlcs_read(serWrapper.cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return InFlightHtlcs_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> InFlightHtlcs {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing InFlightHtlcs \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing InFlightHtlcs \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
