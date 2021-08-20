import LDKHeaders

open class SocketDescriptor {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public var cOpaqueStruct: LDKSocketDescriptor?
    internal private(set) var anchor: AnyObject? = nil

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func send_dataCallback(pointer: UnsafeMutableRawPointer?, data: LDKu8slice, resume_read: Bool) -> UInt {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "SocketDescriptor.swift::send_data")
			
			return instance.send_data(data: Bindings.LDKu8slice_to_array(nativeType: data), resume_read: resume_read)
		}

		func disconnect_socketCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "SocketDescriptor.swift::disconnect_socket")
			
			return instance.disconnect_socket()
		}

		func eqCallback(pointer: UnsafeRawPointer?, other_argPointer: UnsafePointer<LDKSocketDescriptor>) -> Bool {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "SocketDescriptor.swift::eq")
			let other_arg = SocketDescriptor(pointer: other_argPointer.pointee);

			return instance.eq(other_arg: other_arg)
		}

		func hashCallback(pointer: UnsafeRawPointer?) -> UInt64 {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "SocketDescriptor.swift::hash")
			
			return instance.hash()
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "SocketDescriptor.swift::free")
			
			return instance.free()
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKSocketDescriptor(this_arg: Bindings.instanceToPointer(instance: self), 
			send_data: send_dataCallback,
			disconnect_socket: disconnect_socketCallback,
			eq: eqCallback,
			hash: hashCallback,
			cloned: nil,
			free: freeCallback)
    }

    public init(pointer: LDKSocketDescriptor){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public init(pointer: LDKSocketDescriptor, anchor: AnyObject){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.dangling = true
		self.anchor = anchor
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */


				public func clone() -> SocketDescriptor {
					
					return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKSocketDescriptor>) in

					SocketDescriptor(pointer: SocketDescriptor_clone(origPointer))
					
}
				}
			

					internal func danglingClone() -> SocketDescriptor {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				



					internal func dangle() -> SocketDescriptor {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing SocketDescriptor \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing SocketDescriptor \(self.instanceNumber) due to dangle.")
						}
					}
				

    open func send_data(data: [UInt8], resume_read: Bool) -> UInt {
    	/* EDIT ME */
		return 0
    }

    open func disconnect_socket() -> Void {
    	/* EDIT ME */
		
    }

    open func eq(other_arg: SocketDescriptor) -> Bool {
    	/* EDIT ME */
		return false
    }

    open func hash() -> UInt64 {
    	/* EDIT ME */
		return 0
    }

    open func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedSocketDescriptor: SocketDescriptor {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func send_data(data: [UInt8], resume_read: Bool) -> UInt {
		
				
						let dataWrapper = Bindings.new_LDKu8sliceWrapper(array: data)
						defer {
							dataWrapper.noOpRetain()
						}
					
				return 
				self.cOpaqueStruct!.send_data(self.cOpaqueStruct!.this_arg, dataWrapper.cOpaqueStruct!, resume_read)
				
			
	}

	public override func disconnect_socket() -> Void {
		
				
				
				self.cOpaqueStruct!.disconnect_socket(self.cOpaqueStruct!.this_arg)
				
			
	}

	public override func eq(other_arg: SocketDescriptor) -> Bool {
		
				
				return withUnsafePointer(to: other_arg.cOpaqueStruct!) { (other_argPointer: UnsafePointer<LDKSocketDescriptor>) in

				self.cOpaqueStruct!.eq(self.cOpaqueStruct!.this_arg, other_argPointer)
				
}
			
	}

	public override func hash() -> UInt64 {
		
				
				return 
				self.cOpaqueStruct!.hash(self.cOpaqueStruct!.this_arg)
				
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
