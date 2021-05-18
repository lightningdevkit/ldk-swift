public class FilesystemPersister {

    var cOpaqueStruct: LDKFilesystemPersister?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(path_to_channel_data: String) {
    	
        self.cOpaqueStruct = FilesystemPersister_new(Bindings.new_LDKStr(string: path_to_channel_data))
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKFilesystemPersister){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_data_dir(this_arg: FilesystemPersister) -> String {
    	
        return Bindings.LDKStr_to_string(nativeType: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKFilesystemPersister>) in
FilesystemPersister_get_data_dir(this_argPointer)
});
    }

    public func persist_manager(data_dir: String, manager: ChannelManager) -> Result_NoneErrorZ {
    	
        return Result_NoneErrorZ(pointer: withUnsafePointer(to: manager.cOpaqueStruct!) { (managerPointer: UnsafePointer<LDKChannelManager>) in
FilesystemPersister_persist_manager(Bindings.new_LDKStr(string: data_dir), managerPointer)
});
    }

    public func read_channelmonitors(this_arg: FilesystemPersister, keys_manager: KeysInterface) -> Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ {
    	
        return Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKFilesystemPersister>) in
FilesystemPersister_read_channelmonitors(this_argPointer, keys_manager.cOpaqueStruct!)
});
    }

    public func as_Persist(this_arg: FilesystemPersister) -> Persist {
    	
        return Persist(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKFilesystemPersister>) in
FilesystemPersister_as_Persist(this_argPointer)
});
    }

				
	deinit {
					
					
		FilesystemPersister_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
