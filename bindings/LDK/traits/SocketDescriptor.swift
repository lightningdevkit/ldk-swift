open class SocketDescriptor {

    public var cOpaqueStruct: LDKSocketDescriptor?;

    public init() {

    	/* NATIVE_CALLBACKS_START */

		func send_dataCallback(pointer: UnsafeMutableRawPointer?, data: LDKu8slice, resume_read: Bool) -> UInt {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "SocketDescriptor.swift::send_data")
			
			return instance.send_data(data: Bindings.LDKu8slice_to_array(nativeType: data), resume_read: resume_read);
		}

		func disconnect_socketCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "SocketDescriptor.swift::disconnect_socket")
			
			return instance.disconnect_socket();
		}

		func eqCallback(pointer: UnsafeRawPointer?, other_argPointer: UnsafePointer<LDKSocketDescriptor>) -> Bool {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "SocketDescriptor.swift::eq")
			let other_arg = SocketDescriptor(pointer: other_argPointer.pointee);

			return instance.eq(other_arg: other_arg);
		}

		func hashCallback(pointer: UnsafeRawPointer?) -> UInt64 {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "SocketDescriptor.swift::hash")
			
			return instance.hash();
		}

		func cloneCallback(pointer: UnsafeRawPointer?) -> UnsafeMutableRawPointer? {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "SocketDescriptor.swift::clone")
			
			return instance.clone();
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "SocketDescriptor.swift::free")
			
			return instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKSocketDescriptor(this_arg: Bindings.instanceToPointer(instance: self), 
			send_data: send_dataCallback,
			disconnect_socket: disconnect_socketCallback,
			eq: eqCallback,
			hash: hashCallback,
			clone: cloneCallback,
			free: freeCallback)
    }

    public init(pointer: LDKSocketDescriptor){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

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

    open func clone() -> UnsafeMutableRawPointer {
    	/* EDIT ME */
		return UnsafeMutableRawPointer(bitPattern: 0)!
    }

    open func free() -> Void {
    	/* EDIT ME */
		
    }


				func clone() -> SocketDescriptor {
					
					return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKSocketDescriptor>) in

					SocketDescriptor(pointer: SocketDescriptor_clone(origPointer))
					
}
				}
			

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedSocketDescriptor: SocketDescriptor {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func send_data(data: [UInt8], resume_read: Bool) -> UInt {
		
				return 
				self.cOpaqueStruct!.send_data(self.cOpaqueStruct!.this_arg, Bindings.new_LDKu8slice(array: data), resume_read)
				
			
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
