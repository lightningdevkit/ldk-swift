public class Listen {

    var cOpaqueStruct: LDKListen?;

    init() {

    	/* NATIVE_CALLBACKS_START */

		func block_connectedCallback(pointer: UnsafeRawPointer?, block: LDKu8slice, height: UInt32) -> Void {
			let instance: Listen = Bindings.pointerToInstance(pointer: pointer!)
			
			return instance.block_connected(block: Bindings.LDKu8slice_to_array(nativeType: block), height: height);
		}

		func block_disconnectedCallback(pointer: UnsafeRawPointer?, headerPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, height: UInt32) -> Void {
			let instance: Listen = Bindings.pointerToInstance(pointer: pointer!)
			
								var header: [UInt8]? = nil
								if let headerUnwrapped = headerPointer {
									header = Bindings.tuple80_to_array(nativeType: headerUnwrapped.pointee)
								}
							
			return instance.block_disconnected(header: header, height: height);
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Listen = Bindings.pointerToInstance(pointer: pointer!)
			
			return instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKListen(this_arg: Bindings.instanceToPointer(instance: self), 
			block_connected: block_connectedCallback,
			block_disconnected: block_disconnectedCallback,
			free: freeCallback)
    }

    init(pointer: LDKListen){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    public func block_connected(block: [UInt8], height: UInt32) -> Void {
    	/* EDIT ME */
		
    }

    public func block_disconnected(header: [UInt8]?, height: UInt32) -> Void {
    	/* EDIT ME */
		
    }

    public func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}
