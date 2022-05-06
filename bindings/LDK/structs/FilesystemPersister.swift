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
});
    }

    public class func persist_manager(data_dir: String, manager: ChannelManager) -> Result_NoneErrorZ {
    	
        return Result_NoneErrorZ(pointer: withUnsafePointer(to: manager.cOpaqueStruct!) { (managerPointer: UnsafePointer<LDKChannelManager>) in
FilesystemPersister_persist_manager(Bindings.new_LDKStr(string: data_dir, chars_is_owned: true), managerPointer)
});
    }

    public class func persist_network_graph(data_dir: String, network_graph: NetworkGraph) -> Result_NoneErrorZ {
    	
        return Result_NoneErrorZ(pointer: withUnsafePointer(to: network_graph.cOpaqueStruct!) { (network_graphPointer: UnsafePointer<LDKNetworkGraph>) in
FilesystemPersister_persist_network_graph(Bindings.new_LDKStr(string: data_dir, chars_is_owned: true), network_graphPointer)
});
    }

    public func read_channelmonitors(keys_manager: KeysInterface) -> Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ {
    	
        return Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKFilesystemPersister>) in
FilesystemPersister_read_channelmonitors(this_argPointer, keys_manager.cOpaqueStruct!)
});
    }

    public func as_Persist() -> NativelyImplementedPersist {
    	
        return NativelyImplementedPersist(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKFilesystemPersister>) in
FilesystemPersister_as_Persist(this_argPointer)
}, anchor: self);
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
