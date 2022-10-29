#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias OnionMessage = Bindings.OnionMessage

extension Bindings {

	public class OnionMessage: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKOnionMessage?


		

		public init(pointer: LDKOnionMessage){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKOnionMessage, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func get_blinding_point() -> [UInt8] {
			
			return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOnionMessage>) in
OnionMessage_get_blinding_point(this_ptrPointer)
});
		}

		public func set_blinding_point(val: [UInt8]) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKOnionMessage>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return OnionMessage_set_blinding_point(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
		}

		public func clone() -> OnionMessage {
			
			return OnionMessage(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKOnionMessage>) in
OnionMessage_clone(origPointer)
});
		}

					internal func danglingClone() -> OnionMessage {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public class func eq(a: OnionMessage, b: OnionMessage) -> Bool {
			
			return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKOnionMessage>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKOnionMessage>) in
OnionMessage_eq(aPointer, bPointer)
}
};
		}

		public class func read(ser: [UInt8]) -> Result_OnionMessageDecodeErrorZ {
			
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
			return Result_OnionMessageDecodeErrorZ(pointer: OnionMessage_read(serWrapper.cOpaqueStruct!));
		}

		public func write() -> [UInt8] {
			
			return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKOnionMessage>) in
OnionMessage_write(objPointer)
}, callerContext: "OnionMessage::write");
		}

		internal func free() -> Void {
			
			return OnionMessage_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> OnionMessage {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing OnionMessage \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing OnionMessage \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
