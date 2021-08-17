import LDKHeaders

public class UserConfig {

    private static var instanceCounter: UInt = 0
    private let instanceNumber: UInt
    private var dangling = false

    public internal(set) var cOpaqueStruct: LDKUserConfig?;

    /* DEFAULT_CONSTRUCTOR_START */
    public init() {
        Self.instanceCounter += 1
        self.instanceNumber = Self.instanceCounter
        self.cOpaqueStruct = UserConfig_default()
        print("User Config \(self.instanceNumber) is owned: \(self.cOpaqueStruct!.is_owned)")
    }

    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKUserConfig) {
        Self.instanceCounter += 1
        self.instanceNumber = Self.instanceCounter
        self.cOpaqueStruct = pointer
        print("User Config \(self.instanceNumber) is owned: \(self.cOpaqueStruct!.is_owned)")
    }

    /* STRUCT_METHODS_START */

    public func get_own_channel_config() -> ChannelHandshakeConfig {

        return ChannelHandshakeConfig(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUserConfig>) in
            UserConfig_get_own_channel_config(this_ptrPointer)
        });
    }

    public func set_own_channel_config(val: ChannelHandshakeConfig) -> Void {

        let this_ptrPointer = UnsafeMutablePointer<LDKUserConfig>.allocate(capacity: 1)
        this_ptrPointer.initialize(to: self.cOpaqueStruct!)

        return UserConfig_set_own_channel_config(this_ptrPointer, val.clone().cOpaqueStruct!);
    }

    public func get_peer_channel_config_limits() -> ChannelHandshakeLimits {

        return ChannelHandshakeLimits(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUserConfig>) in
            UserConfig_get_peer_channel_config_limits(this_ptrPointer)
        });
    }

    public func set_peer_channel_config_limits(val: ChannelHandshakeLimits) -> Void {

        let this_ptrPointer = UnsafeMutablePointer<LDKUserConfig>.allocate(capacity: 1)
        this_ptrPointer.initialize(to: self.cOpaqueStruct!)

        return UserConfig_set_peer_channel_config_limits(this_ptrPointer, val.clone().cOpaqueStruct!);
    }

    public func get_channel_options() -> ChannelConfig {

        return ChannelConfig(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUserConfig>) in
            UserConfig_get_channel_options(this_ptrPointer)
        });
    }

    public func set_channel_options(val: ChannelConfig) -> Void {

        let this_ptrPointer = UnsafeMutablePointer<LDKUserConfig>.allocate(capacity: 1)
        this_ptrPointer.initialize(to: self.cOpaqueStruct!)

        return UserConfig_set_channel_options(this_ptrPointer, val.clone().cOpaqueStruct!);
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

    public func clone() -> UserConfig {

        print("Cloning UserConfig \(self.instanceNumber)")
        let thingz: UnsafeRawPointer = UnsafeRawPointer(&self.cOpaqueStruct!)
        let ugh: UnsafePointer<LDKUserConfig> = thingz.assumingMemoryBound(to: LDKUserConfig.self)

        // return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKUserConfig>) in UserConfig(pointer: UserConfig_clone(origPointer)) };
        var clonePointer = UserConfig_clone(ugh)
        // clonePointer.is_owned = false
        let clone = UserConfig(pointer: clonePointer)
        // UserConfig_free(self.cOpaqueStruct!)
        print("Finished cloning UserConfig \(self.instanceNumber)")
        return clone
    }

    public func danglingClone() -> UserConfig {

        print("Dangling-Cloning UserConfig \(self.instanceNumber)")

        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKUserConfig>) in
            let clone = UserConfig(pointer: UserConfig_clone(origPointer))
            clone.dangling = true
            print("Finished dangling-cloning UserConfig \(self.instanceNumber)")
            return clone
        };


    }


    deinit {

        if !self.dangling {
            print("deiniting UserConfig \(self.instanceNumber)")
            UserConfig_free(self.cOpaqueStruct!)
            print("Finished deiniting UserConfig \(self.instanceNumber)")
        }

    }

    /* STRUCT_METHODS_END */

}
