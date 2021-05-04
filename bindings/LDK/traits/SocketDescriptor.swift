class SocketDescriptor {

    var cOpaqueStruct: LDKSocketDescriptor?;

    init() {

    	/* NATIVE_CALLBACKS_START */

		func send_dataCallback(pointer: UnsafeMutableRawPointer?, data: LDKu8slice, resume_read: Bool) -> UInt {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.send_data(data: data, resume_read: resume_read);
		}

		func disconnect_socketCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.disconnect_socket();
		}

		func eqCallback(pointer: UnsafeRawPointer?, other_arg: UnsafePointer<LDKSocketDescriptor>) -> Bool {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.eq(other_arg: other_arg);
		}

		func hashCallback(pointer: UnsafeRawPointer?) -> UInt64 {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.hash();
		}

		func cloneCallback(pointer: UnsafeRawPointer?) -> UnsafeMutableRawPointer {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.clone();
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
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

    func send_data(data: LDKu8slice, resume_read: Bool) -> UInt {
    	/* EDIT ME */
		return 0
    }

    func disconnect_socket() -> Void {
    	/* EDIT ME */
		
    }

    func eq(other_arg: UnsafePointer<LDKSocketDescriptor>) -> Bool {
    	/* EDIT ME */
		return false
    }

    func hash() -> UInt64 {
    	/* EDIT ME */
		return 0
    }

    func clone() -> UnsafeMutableRawPointer {
    	/* EDIT ME */
		return UnsafeMutableRawPointer(bitPattern: 0)!
    }

    func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}
