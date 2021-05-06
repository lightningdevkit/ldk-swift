public class FilesystemPersister {

    var cOpaqueStruct: LDKFilesystemPersister?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(path_to_channel_data: String) {
    	
		let converted_path_to_channel_data = Bindings.new_LDKStr(string: path_to_channel_data)
        self.cOpaqueStruct = FilesystemPersister_new(converted_path_to_channel_data)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKFilesystemPersister){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_data_dir(this_arg: FilesystemPersister) -> String {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFilesystemPersister>) in
							
			pointer
						
		}
					
        return Bindings.LDKStr_to_string(nativeType: FilesystemPersister_get_data_dir(this_argPointer));
    }

    public func persist_manager(data_dir: String, manager: ChannelManager) -> Result_NoneErrorZ {
    	
						
		let managerPointer = withUnsafePointer(to: manager.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return Result_NoneErrorZ(pointer: FilesystemPersister_persist_manager(Bindings.new_LDKStr(string: data_dir), managerPointer));
    }

    public func read_channelmonitors(this_arg: FilesystemPersister, keys_manager: KeysInterface) -> Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFilesystemPersister>) in
							
			pointer
						
		}
					
        return Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ(pointer: FilesystemPersister_read_channelmonitors(this_argPointer, keys_manager.cOpaqueStruct!));
    }

    public func as_Persist(this_arg: FilesystemPersister) -> Persist {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFilesystemPersister>) in
							
			pointer
						
		}
					
        return Persist(pointer: FilesystemPersister_as_Persist(this_argPointer));
    }

				
	deinit {
					
					
		FilesystemPersister_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
