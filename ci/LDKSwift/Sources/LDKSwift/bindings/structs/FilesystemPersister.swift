#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias FilesystemPersister = Bindings.FilesystemPersister

extension Bindings {

	public class FilesystemPersister: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKFilesystemPersister?


		/* DEFAULT_CONSTRUCTOR_START */
		public init(path_to_channel_data: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
			self.cOpaqueStruct = FilesystemPersister_new(Bindings.new_LDKStr(string: path_to_channel_data, chars_is_owned: true))
			super.init(conflictAvoidingVariableName: 0)
			
		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKFilesystemPersister){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKFilesystemPersister, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func get_data_dir() -> String {
			
			return Bindings.LDKStr_to_string(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKFilesystemPersister>) in
FilesystemPersister_get_data_dir(this_argPointer)
}, callerContext: "FilesystemPersister::get_data_dir");
		}

		public func read_channelmonitors(keys_manager: KeysInterface) -> Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ {
			
			return Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKFilesystemPersister>) in
FilesystemPersister_read_channelmonitors(this_argPointer, keys_manager.activate().cOpaqueStruct!)
});
		}

		internal func free() -> Void {
			
			return FilesystemPersister_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> FilesystemPersister {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing FilesystemPersister \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing FilesystemPersister \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
