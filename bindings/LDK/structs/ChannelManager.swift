class ChannelManager {

    var cOpaqueStruct: LDKChannelManager?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(fee_est: FeeEstimator, chain_monitor: Watch, tx_broadcaster: BroadcasterInterface, logger: Logger, keys_manager: KeysInterface, config: UserConfig, params: ChainParameters) {
    	
        self.cOpaqueStruct = ChannelManager_new(fee_est.cOpaqueStruct!, chain_monitor.cOpaqueStruct!, tx_broadcaster.cOpaqueStruct!, logger.cOpaqueStruct!, keys_manager.cOpaqueStruct!, config.cOpaqueStruct!, params.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKChannelManager){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_current_default_configuration(this_arg: ChannelManager) -> UserConfig {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return UserConfig(pointer: ChannelManager_get_current_default_configuration(this_argPointer));
    }

    func create_channel(this_arg: ChannelManager, their_network_key: [UInt8], channel_value_satoshis: UInt64, push_msat: UInt64, user_id: UInt64, override_config: UserConfig) -> Result_NoneAPIErrorZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return Result_NoneAPIErrorZ(pointer: ChannelManager_create_channel(this_argPointer, Bindings.new_LDKPublicKey(array: their_network_key), channel_value_satoshis, push_msat, user_id, override_config.cOpaqueStruct!));
    }

    func list_channels(this_arg: ChannelManager) -> [LDKChannelDetails] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_ChannelDetailsZ_to_array(nativeType: ChannelManager_list_channels(this_argPointer));
    }

    func list_usable_channels(this_arg: ChannelManager) -> [LDKChannelDetails] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_ChannelDetailsZ_to_array(nativeType: ChannelManager_list_usable_channels(this_argPointer));
    }

    func close_channel(this_arg: ChannelManager, channel_id: [UInt8]) -> Result_NoneAPIErrorZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
							
		let channel_idPointer = withUnsafePointer(to: Bindings.array_to_tuple32(array: channel_id)) { (pointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
								
			pointer
							
		}
						
        return Result_NoneAPIErrorZ(pointer: ChannelManager_close_channel(this_argPointer, channel_idPointer));
    }

    func force_close_channel(this_arg: ChannelManager, channel_id: [UInt8]) -> Result_NoneAPIErrorZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
							
		let channel_idPointer = withUnsafePointer(to: Bindings.array_to_tuple32(array: channel_id)) { (pointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
								
			pointer
							
		}
						
        return Result_NoneAPIErrorZ(pointer: ChannelManager_force_close_channel(this_argPointer, channel_idPointer));
    }

    func force_close_all_channels(this_arg: ChannelManager) -> Void {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_force_close_all_channels(this_argPointer);
    }

    func send_payment(this_arg: ChannelManager, route: Route, payment_hash: [UInt8], payment_secret: [UInt8]) -> Result_NonePaymentSendFailureZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
						
		let routePointer = withUnsafePointer(to: route.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRoute>) in
							
			pointer
						
		}
					
        return Result_NonePaymentSendFailureZ(pointer: ChannelManager_send_payment(this_argPointer, routePointer, Bindings.new_LDKThirtyTwoBytes(array: payment_hash), Bindings.new_LDKThirtyTwoBytes(array: payment_secret)));
    }

    func funding_transaction_generated(this_arg: ChannelManager, temporary_channel_id: [UInt8], funding_transaction: [UInt8]) -> Result_NoneAPIErrorZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
							
		let temporary_channel_idPointer = withUnsafePointer(to: Bindings.array_to_tuple32(array: temporary_channel_id)) { (pointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
								
			pointer
							
		}
						
        return Result_NoneAPIErrorZ(pointer: ChannelManager_funding_transaction_generated(this_argPointer, temporary_channel_idPointer, Bindings.new_LDKTransaction(array: funding_transaction)));
    }

    func broadcast_node_announcement(this_arg: ChannelManager, rgb: [UInt8], alias: [UInt8], addresses: [LDKNetAddress]) -> Void {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_broadcast_node_announcement(this_argPointer, Bindings.new_LDKThreeBytes(array: rgb), Bindings.new_LDKThirtyTwoBytes(array: alias), Bindings.new_LDKCVec_NetAddressZ(array: addresses));
    }

    func process_pending_htlc_forwards(this_arg: ChannelManager) -> Void {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_process_pending_htlc_forwards(this_argPointer);
    }

    func timer_tick_occurred(this_arg: ChannelManager) -> Void {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_timer_tick_occurred(this_argPointer);
    }

    func fail_htlc_backwards(this_arg: ChannelManager, payment_hash: [UInt8]) -> Bool {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
							
		let payment_hashPointer = withUnsafePointer(to: Bindings.array_to_tuple32(array: payment_hash)) { (pointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
								
			pointer
							
		}
						
        return ChannelManager_fail_htlc_backwards(this_argPointer, payment_hashPointer);
    }

    func claim_funds(this_arg: ChannelManager, payment_preimage: [UInt8]) -> Bool {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_claim_funds(this_argPointer, Bindings.new_LDKThirtyTwoBytes(array: payment_preimage));
    }

    func get_our_node_id(this_arg: ChannelManager) -> [UInt8] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: ChannelManager_get_our_node_id(this_argPointer));
    }

    func channel_monitor_updated(this_arg: ChannelManager, funding_txo: OutPoint, highest_applied_update_id: UInt64) -> Void {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
						
		let funding_txoPointer = withUnsafePointer(to: funding_txo.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOutPoint>) in
							
			pointer
						
		}
					
        return ChannelManager_channel_monitor_updated(this_argPointer, funding_txoPointer, highest_applied_update_id);
    }

    func create_inbound_payment(this_arg: ChannelManager, min_value_msat: Option_u64Z, invoice_expiry_delta_secs: UInt32, user_payment_id: UInt64) -> C2Tuple_PaymentHashPaymentSecretZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return C2Tuple_PaymentHashPaymentSecretZ(pointer: ChannelManager_create_inbound_payment(this_argPointer, min_value_msat.cOpaqueStruct!, invoice_expiry_delta_secs, user_payment_id));
    }

    func create_inbound_payment_for_hash(this_arg: ChannelManager, payment_hash: [UInt8], min_value_msat: Option_u64Z, invoice_expiry_delta_secs: UInt32, user_payment_id: UInt64) -> Result_PaymentSecretAPIErrorZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return Result_PaymentSecretAPIErrorZ(pointer: ChannelManager_create_inbound_payment_for_hash(this_argPointer, Bindings.new_LDKThirtyTwoBytes(array: payment_hash), min_value_msat.cOpaqueStruct!, invoice_expiry_delta_secs, user_payment_id));
    }

    func as_MessageSendEventsProvider(this_arg: ChannelManager) -> MessageSendEventsProvider {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return MessageSendEventsProvider(pointer: ChannelManager_as_MessageSendEventsProvider(this_argPointer));
    }

    func as_EventsProvider(this_arg: ChannelManager) -> EventsProvider {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return EventsProvider(pointer: ChannelManager_as_EventsProvider(this_argPointer));
    }

    func as_Listen(this_arg: ChannelManager) -> Listen {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return Listen(pointer: ChannelManager_as_Listen(this_argPointer));
    }

    func as_Confirm(this_arg: ChannelManager) -> Confirm {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return Confirm(pointer: ChannelManager_as_Confirm(this_argPointer));
    }

    func await_persistable_update_timeout(this_arg: ChannelManager, max_wait: UInt64) -> Bool {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_await_persistable_update_timeout(this_argPointer, max_wait);
    }

    func await_persistable_update(this_arg: ChannelManager) -> Void {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_await_persistable_update(this_argPointer);
    }

    func as_ChannelMessageHandler(this_arg: ChannelManager) -> ChannelMessageHandler {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelMessageHandler(pointer: ChannelManager_as_ChannelMessageHandler(this_argPointer));
    }

    func write(obj: ChannelManager) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: ChannelManager_write(objPointer));
    }

				
	deinit {
					
					
		ChannelManager_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
