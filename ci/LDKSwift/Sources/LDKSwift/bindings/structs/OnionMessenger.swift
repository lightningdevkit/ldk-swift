#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias OnionMessenger = Bindings.OnionMessenger

extension Bindings {

	public class OnionMessenger: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKOnionMessenger?


		/* DEFAULT_CONSTRUCTOR_START */
		public init(keys_manager: KeysInterface, logger: Logger, custom_handler: CustomOnionMessageHandler) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
			self.cOpaqueStruct = OnionMessenger_new(keys_manager.activate().cOpaqueStruct!, logger.activate().cOpaqueStruct!, custom_handler.activate().cOpaqueStruct!)
			super.init(conflictAvoidingVariableName: 0)
			try? self.addAnchor(anchor: keys_manager)
try? self.addAnchor(anchor: logger)
try? self.addAnchor(anchor: custom_handler)

		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKOnionMessenger){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKOnionMessenger, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func send_custom_onion_message(intermediate_nodes: [[UInt8]], destination: Destination, msg: CustomOnionMessageContents, reply_path: BlindedRoute) -> Result_NoneSendErrorZ {
			
						let intermediate_nodesWrapper = Bindings.new_LDKCVec_PublicKeyZWrapper(array: intermediate_nodes)
						defer {
							intermediate_nodesWrapper.noOpRetain()
						}
					
			return Result_NoneSendErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKOnionMessenger>) in
OnionMessenger_send_custom_onion_message(this_argPointer, intermediate_nodesWrapper.dangle().cOpaqueStruct!, destination.cOpaqueStruct!, msg.danglingClone().cOpaqueStruct!, reply_path.cOpaqueStruct!)
});
		}

		public func as_OnionMessageHandler() -> NativelyImplementedOnionMessageHandler {
			
			return NativelyImplementedOnionMessageHandler(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKOnionMessenger>) in
OnionMessenger_as_OnionMessageHandler(this_argPointer)
}, anchor: self);
		}

		public func as_OnionMessageProvider() -> NativelyImplementedOnionMessageProvider {
			
			return NativelyImplementedOnionMessageProvider(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKOnionMessenger>) in
OnionMessenger_as_OnionMessageProvider(this_argPointer)
}, anchor: self);
		}

		internal func free() -> Void {
			
			return OnionMessenger_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> OnionMessenger {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing OnionMessenger \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing OnionMessenger \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
