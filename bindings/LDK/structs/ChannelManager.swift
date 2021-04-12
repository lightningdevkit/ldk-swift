class ChannelManager {

    var cOpaqueStruct: LDKChannelManager?;

    init(fee_est: FeeEstimator, chain_monitor: Watch, tx_broadcaster: BroadcasterInterface, logger: Logger, keys_manager: KeysInterface, config: UserConfig, params: ChainParameters) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = ChannelManager_new(fee_est, chain_monitor, tx_broadcaster, logger, keys_manager, config, params)
    }

    private init(pointer: LDKChannelManager){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_current_default_configuration(this_arg: ChannelManager) -> UserConfig {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_get_current_default_configuration(this_argPointer);
    }

    func create_channel(this_arg: ChannelManager, their_network_key: [U], channel_value_satoshis: U, push_msat: U, user_id: U, override_config: UserConfig) -> Result_NoneAPIErrorZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_create_channel(this_argPointer, their_network_key, channel_value_satoshis, push_msat, user_id, override_config);
    }

    func list_channels(this_arg: ChannelManager) -> [ChannelDetails] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_list_channels(this_argPointer);
    }

    func list_usable_channels(this_arg: ChannelManager) -> [ChannelDetails] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_list_usable_channels(this_argPointer);
    }

    func close_channel(this_arg: ChannelManager, channel_id: [U]) -> Result_NoneAPIErrorZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_close_channel(this_argPointer, channel_id);
    }

    func force_close_channel(this_arg: ChannelManager, channel_id: [U]) -> Result_NoneAPIErrorZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_force_close_channel(this_argPointer, channel_id);
    }

    func force_close_all_channels(this_arg: ChannelManager) -> Void {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_force_close_all_channels(this_argPointer);
    }

    func send_payment(this_arg: ChannelManager, route: Route, payment_hash: [U], payment_secret: [U]) -> Result_NonePaymentSendFailureZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
						
		let routePointer = withUnsafePointer(to: route.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRoute>) in
							
			pointer
						
		}
					
        return ChannelManager_send_payment(this_argPointer, routePointer, payment_hash, payment_secret);
    }

    func funding_transaction_generated(this_arg: ChannelManager, temporary_channel_id: [U], funding_txo: OutPoint) -> Void {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_funding_transaction_generated(this_argPointer, temporary_channel_id, funding_txo);
    }

    func broadcast_node_announcement(this_arg: ChannelManager, rgb: [U], alias: [U], addresses: [NetAddress]) -> Void {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_broadcast_node_announcement(this_argPointer, rgb, alias, addresses);
    }

    func process_pending_htlc_forwards(this_arg: ChannelManager) -> Void {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_process_pending_htlc_forwards(this_argPointer);
    }

    func timer_chan_freshness_every_min(this_arg: ChannelManager) -> Void {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_timer_chan_freshness_every_min(this_argPointer);
    }

    func fail_htlc_backwards(this_arg: ChannelManager, payment_hash: [U], payment_secret: [U]) -> boolean {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_fail_htlc_backwards(this_argPointer, payment_hash, payment_secret);
    }

    func claim_funds(this_arg: ChannelManager, payment_preimage: [U], payment_secret: [U], expected_amount: U) -> boolean {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_claim_funds(this_argPointer, payment_preimage, payment_secret, expected_amount);
    }

    func get_our_node_id(this_arg: ChannelManager) -> [U] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_get_our_node_id(this_argPointer);
    }

    func channel_monitor_updated(this_arg: ChannelManager, funding_txo: OutPoint, highest_applied_update_id: U) -> Void {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
						
		let funding_txoPointer = withUnsafePointer(to: funding_txo.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOutPoint>) in
							
			pointer
						
		}
					
        return ChannelManager_channel_monitor_updated(this_argPointer, funding_txoPointer, highest_applied_update_id);
    }

    func as_MessageSendEventsProvider(this_arg: ChannelManager) -> MessageSendEventsProvider {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_as_MessageSendEventsProvider(this_argPointer);
    }

    func as_EventsProvider(this_arg: ChannelManager) -> EventsProvider {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_as_EventsProvider(this_argPointer);
    }

    func as_Listen(this_arg: ChannelManager) -> Listen {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_as_Listen(this_argPointer);
    }

    func transactions_confirmed(this_arg: ChannelManager, header: [U], height: U, txdata: [TwoTuple<U>]) -> Void {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_transactions_confirmed(this_argPointer, header, height, txdata);
    }

    func update_best_block(this_arg: ChannelManager, header: [U], height: U) -> Void {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_update_best_block(this_argPointer, header, height);
    }

    func get_relevant_txids(this_arg: ChannelManager) -> [Txid] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_get_relevant_txids(this_argPointer);
    }

    func transaction_unconfirmed(this_arg: ChannelManager, txid: [U]) -> Void {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_transaction_unconfirmed(this_argPointer, txid);
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
					
        return ChannelManager_as_ChannelMessageHandler(this_argPointer);
    }

    func write(obj: ChannelManager) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) in
							
			pointer
						
		}
					
        return ChannelManager_write(objPointer);
    }

				
	deinit {
					
					
		ChannelManager_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
