public class SocketDescriptor {

    var cOpaqueStruct: LDKSocketDescriptor?;

    init() {

    	/* NATIVE_CALLBACKS_START */

		func send_dataCallback(pointer: UnsafeMutableRawPointer?, data: LDKu8slice, resume_read: Bool) -> UInt {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!)
			
			return instance.send_data(data: Bindings.LDKu8slice_to_array(nativeType: data), resume_read: resume_read);
		}

		func disconnect_socketCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!)
			
			return instance.disconnect_socket();
		}

		func eqCallback(pointer: UnsafeRawPointer?, other_argPointer: UnsafePointer<LDKSocketDescriptor>) -> Bool {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!)
			let other_arg = SocketDescriptor(pointer: other_argPointer.pointee);

			return instance.eq(other_arg: other_arg);
		}

		func hashCallback(pointer: UnsafeRawPointer?) -> UInt64 {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!)
			
			return instance.hash();
		}

		func cloneCallback(pointer: UnsafeRawPointer?) -> UnsafeMutableRawPointer? {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!)
			
			return instance.clone();
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!)
			
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

    init(pointer: LDKSocketDescriptor){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    public func send_data(data: [UInt8], resume_read: Bool) -> UInt {
    	/* EDIT ME */
		return 0
    }

    public func disconnect_socket() -> Void {
    	/* EDIT ME */
		
    }

    public func eq(other_arg: SocketDescriptor) -> Bool {
    	/* EDIT ME */
		return false
    }

    public func hash() -> UInt64 {
    	/* EDIT ME */
		return 0
    }

    public func clone() -> UnsafeMutableRawPointer {
    	/* EDIT ME */
		return UnsafeMutableRawPointer(bitPattern: 0)!
    }

    public func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}
