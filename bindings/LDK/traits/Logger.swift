import LDKHeaders

open class Logger {

    public var cOpaqueStruct: LDKLogger?;

    public init() {

    	/* NATIVE_CALLBACKS_START */

		func logCallback(pointer: UnsafeRawPointer?, recordPointer: UnsafePointer<Int8>?) -> Void {
			let instance: Logger = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Logger.swift::log")
			
								var record: String? = nil
								if let recordUnwrapped = recordPointer {
									record = Bindings.UnsafeIntPointer_to_string(nativeType: recordUnwrapped)
								}
							
			return instance.log(record: record);
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Logger = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Logger.swift::free")
			
			return instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKLogger(this_arg: Bindings.instanceToPointer(instance: self), 
			log: logCallback,
			free: freeCallback)
    }

    public init(pointer: LDKLogger){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    open func log(record: String?) -> Void {
    	/* EDIT ME */
		
    }

    open func free() -> Void {
    	/* EDIT ME */
		
    }

	deinit {
		Logger_free(self.cOpaqueStruct!)
	}

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedLogger: Logger {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func log(record: String?) -> Void {
		
				
				self.cOpaqueStruct!.log(self.cOpaqueStruct!.this_arg, Bindings.string_to_unsafe_int8_pointer(string: record!))
				
			
	}

	public override func free() -> Void {
		
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
