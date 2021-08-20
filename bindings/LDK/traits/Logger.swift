import LDKHeaders

open class Logger {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public var cOpaqueStruct: LDKLogger?
    internal private(set) var anchor: AnyObject? = nil

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func logCallback(pointer: UnsafeRawPointer?, recordPointer: UnsafePointer<Int8>?) -> Void {
			let instance: Logger = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Logger.swift::log")
			
								var record: String? = nil
								if let recordUnwrapped = recordPointer {
									record = Bindings.UnsafeIntPointer_to_string(nativeType: recordUnwrapped)
								}
							
			return instance.log(record: record)
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Logger = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Logger.swift::free")
			
			return instance.free()
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKLogger(this_arg: Bindings.instanceToPointer(instance: self), 
			log: logCallback,
			free: freeCallback)
    }

    public init(pointer: LDKLogger){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public init(pointer: LDKLogger, anchor: AnyObject){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.dangling = true
		self.anchor = anchor
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */



					internal func dangle() -> Logger {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Logger \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Logger \(self.instanceNumber) due to dangle.")
						}
					}
				

    open func log(record: String?) -> Void {
    	/* EDIT ME */
		
    }

    open func free() -> Void {
    	/* EDIT ME */
		
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
