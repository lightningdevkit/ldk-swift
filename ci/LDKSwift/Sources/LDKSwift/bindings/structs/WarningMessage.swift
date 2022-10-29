#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias WarningMessage = Bindings.WarningMessage

extension Bindings {

	public class WarningMessage: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKWarningMessage?


		/* DEFAULT_CONSTRUCTOR_START */
		public init(channel_id_arg: [UInt8], data_arg: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
			self.cOpaqueStruct = WarningMessage_new(Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg), Bindings.new_LDKStr(string: data_arg, chars_is_owned: true))
			super.init(conflictAvoidingVariableName: 0)
			
		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKWarningMessage){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKWarningMessage, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func get_channel_id() -> [UInt8] {
			
			return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKWarningMessage>) in
WarningMessage_get_channel_id(this_ptrPointer)
}.pointee);
		}

		public func set_channel_id(val: [UInt8]) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKWarningMessage>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return WarningMessage_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
		}

		public func get_data() -> String {
			
			return Bindings.LDKStr_to_string(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKWarningMessage>) in
WarningMessage_get_data(this_ptrPointer)
}, callerContext: "WarningMessage::get_data");
		}

		public func set_data(val: String) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKWarningMessage>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return WarningMessage_set_data(this_ptrPointer, Bindings.new_LDKStr(string: val, chars_is_owned: true));
		}

		public func clone() -> WarningMessage {
			
			return WarningMessage(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKWarningMessage>) in
WarningMessage_clone(origPointer)
});
		}

					internal func danglingClone() -> WarningMessage {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public func write() -> [UInt8] {
			
			return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKWarningMessage>) in
WarningMessage_write(objPointer)
}, callerContext: "WarningMessage::write");
		}

		public class func read(ser: [UInt8]) -> Result_WarningMessageDecodeErrorZ {
			
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
			return Result_WarningMessageDecodeErrorZ(pointer: WarningMessage_read(serWrapper.cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return WarningMessage_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> WarningMessage {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing WarningMessage \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing WarningMessage \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
