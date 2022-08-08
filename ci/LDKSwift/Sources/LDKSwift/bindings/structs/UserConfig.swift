#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias UserConfig = Bindings.UserConfig

extension Bindings {

	public class UserConfig: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKUserConfig?


		/* DEFAULT_CONSTRUCTOR_START */
		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
			self.cOpaqueStruct = UserConfig_default()
			super.init(conflictAvoidingVariableName: 0)
			
		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKUserConfig){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKUserConfig, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func get_channel_handshake_config() -> ChannelHandshakeConfig {
			
			return ChannelHandshakeConfig(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUserConfig>) in
UserConfig_get_channel_handshake_config(this_ptrPointer)
});
		}

		public func set_channel_handshake_config(val: ChannelHandshakeConfig) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKUserConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return UserConfig_set_channel_handshake_config(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
		}

		public func get_channel_handshake_limits() -> ChannelHandshakeLimits {
			
			return ChannelHandshakeLimits(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUserConfig>) in
UserConfig_get_channel_handshake_limits(this_ptrPointer)
});
		}

		public func set_channel_handshake_limits(val: ChannelHandshakeLimits) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKUserConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return UserConfig_set_channel_handshake_limits(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
		}

		public func get_channel_config() -> ChannelConfig {
			
			return ChannelConfig(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUserConfig>) in
UserConfig_get_channel_config(this_ptrPointer)
});
		}

		public func set_channel_config(val: ChannelConfig) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKUserConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return UserConfig_set_channel_config(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
		}

		public func get_accept_forwards_to_priv_channels() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUserConfig>) in
UserConfig_get_accept_forwards_to_priv_channels(this_ptrPointer)
};
		}

		public func set_accept_forwards_to_priv_channels(val: Bool) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKUserConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return UserConfig_set_accept_forwards_to_priv_channels(this_ptrPointer, val);
		}

		public func get_accept_inbound_channels() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUserConfig>) in
UserConfig_get_accept_inbound_channels(this_ptrPointer)
};
		}

		public func set_accept_inbound_channels(val: Bool) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKUserConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return UserConfig_set_accept_inbound_channels(this_ptrPointer, val);
		}

		public func get_manually_accept_inbound_channels() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUserConfig>) in
UserConfig_get_manually_accept_inbound_channels(this_ptrPointer)
};
		}

		public func set_manually_accept_inbound_channels(val: Bool) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKUserConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return UserConfig_set_manually_accept_inbound_channels(this_ptrPointer, val);
		}

		public func clone() -> UserConfig {
			
			return UserConfig(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKUserConfig>) in
UserConfig_clone(origPointer)
});
		}

					internal func danglingClone() -> UserConfig {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		internal func free() -> Void {
			
			return UserConfig_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> UserConfig {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing UserConfig \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing UserConfig \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
