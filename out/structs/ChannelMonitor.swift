#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A ChannelMonitor handles chain events (blocks connected and disconnected) and generates
/// on-chain transactions to ensure no loss of funds occurs.
///
/// You MUST ensure that no ChannelMonitors for a given channel anywhere contain out-of-date
/// information and are actively monitoring the chain.
///
/// Note that the deserializer is only implemented for (BlockHash, ChannelMonitor), which
/// tells you the last block hash which was block_connect()ed. You MUST rescan any blocks along
/// the \"reorg path\" (ie disconnecting blocks until you find a common ancestor from both the
/// returned block hash and the the current chain and then reconnecting blocks to get to the
/// best chain) upon deserializing the object!
public typealias ChannelMonitor = Bindings.ChannelMonitor

extension Bindings {


	/// A ChannelMonitor handles chain events (blocks connected and disconnected) and generates
	/// on-chain transactions to ensure no loss of funds occurs.
	///
	/// You MUST ensure that no ChannelMonitors for a given channel anywhere contain out-of-date
	/// information and are actively monitoring the chain.
	///
	/// Note that the deserializer is only implemented for (BlockHash, ChannelMonitor), which
	/// tells you the last block hash which was block_connect()ed. You MUST rescan any blocks along
	/// the \"reorg path\" (ie disconnecting blocks until you find a common ancestor from both the
	/// returned block hash and the the current chain and then reconnecting blocks to get to the
	/// best chain) upon deserializing the object!
	public class ChannelMonitor: NativeTypeWrapper {

		let initialCFreeability: Bool


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKChannelMonitor?

		internal init(cType: LDKChannelMonitor, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKChannelMonitor, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKChannelMonitor, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the ChannelMonitor, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ChannelMonitor_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the ChannelMonitor
		internal func clone() -> ChannelMonitor {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKChannelMonitor>) in
					ChannelMonitor_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelMonitor(
				cType: nativeCallResult, instantiationContext: "ChannelMonitor.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Serialize the ChannelMonitor object into a byte array which can be read by ChannelMonitor_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKChannelMonitor>) in
					ChannelMonitor_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "ChannelMonitor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Updates a ChannelMonitor on the basis of some new information provided by the Channel
		/// itself.
		///
		/// panics if the given update is not the next update by update_id.
		public func updateMonitor(
			updates: ChannelMonitorUpdate, broadcaster: BroadcasterInterface, feeEstimator: FeeEstimator, logger: Logger
		) -> Result_NoneNoneZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelMonitor>) in

					withUnsafePointer(to: updates.cType!) { (updatesPointer: UnsafePointer<LDKChannelMonitorUpdate>) in

						withUnsafePointer(to: broadcaster.activate().cType!) {
							(broadcasterPointer: UnsafePointer<LDKBroadcasterInterface>) in

							withUnsafePointer(to: feeEstimator.activate().cType!) {
								(feeEstimatorPointer: UnsafePointer<LDKFeeEstimator>) in

								withUnsafePointer(to: logger.activate().cType!) {
									(loggerPointer: UnsafePointer<LDKLogger>) in
									ChannelMonitor_update_monitor(
										thisArgPointer, updatesPointer, broadcasterPointer, feeEstimatorPointer,
										loggerPointer)
								}

							}

						}

					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NoneNoneZ(
				cType: nativeCallResult, instantiationContext: "ChannelMonitor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Gets the update_id from the latest ChannelMonitorUpdate which was applied to this
		/// ChannelMonitor.
		public func getLatestUpdateId() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelMonitor>) in
					ChannelMonitor_get_latest_update_id(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Gets the funding transaction outpoint of the channel this ChannelMonitor is monitoring for.
		public func getFundingTxo() -> (OutPoint, [UInt8]) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelMonitor>) in
					ChannelMonitor_get_funding_txo(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Tuple_OutPointCVec_u8ZZ(
				cType: nativeCallResult, instantiationContext: "ChannelMonitor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Gets a list of txids, with their output scripts (in the order they appear in the
		/// transaction), which we must learn about spends of via block_connected().
		public func getOutputsToWatch() -> [([UInt8], [(UInt32, [UInt8])])] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelMonitor>) in
					ChannelMonitor_get_outputs_to_watch(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_C2Tuple_ThirtyTwoBytesCVec_C2Tuple_u32CVec_u8ZZZZZ(
				cType: nativeCallResult, instantiationContext: "ChannelMonitor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Loads the funding txo and outputs to watch into the given `chain::Filter` by repeatedly
		/// calling `chain::Filter::register_output` and `chain::Filter::register_tx` until all outputs
		/// have been registered.
		public func loadOutputsToWatch(filter: Filter) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelMonitor>) in

					withUnsafePointer(to: filter.activate().cType!) { (filterPointer: UnsafePointer<LDKFilter>) in
						ChannelMonitor_load_outputs_to_watch(thisArgPointer, filterPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Get the list of HTLCs who's status has been updated on chain. This should be called by
		/// ChannelManager via [`chain::Watch::release_pending_monitor_events`].
		public func getAndClearPendingMonitorEvents() -> [MonitorEvent] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelMonitor>) in
					ChannelMonitor_get_and_clear_pending_monitor_events(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_MonitorEventZ(
				cType: nativeCallResult, instantiationContext: "ChannelMonitor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Processes [`SpendableOutputs`] events produced from each [`ChannelMonitor`] upon maturity.
		///
		/// For channels featuring anchor outputs, this method will also process [`BumpTransaction`]
		/// events produced from each [`ChannelMonitor`] while there is a balance to claim onchain
		/// within each channel. As the confirmation of a commitment transaction may be critical to the
		/// safety of funds, we recommend invoking this every 30 seconds, or lower if running in an
		/// environment with spotty connections, like on mobile.
		///
		/// An [`EventHandler`] may safely call back to the provider, though this shouldn't be needed in
		/// order to handle these events.
		///
		/// [`SpendableOutputs`]: crate::events::Event::SpendableOutputs
		/// [`BumpTransaction`]: crate::events::Event::BumpTransaction
		public func processPendingEvents(handler: EventHandler) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelMonitor>) in

					withUnsafePointer(to: handler.activate().cType!) {
						(handlerPointer: UnsafePointer<LDKEventHandler>) in
						ChannelMonitor_process_pending_events(thisArgPointer, handlerPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Gets the counterparty's initial commitment transaction. The returned commitment
		/// transaction is unsigned. This is intended to be called during the initial persistence of
		/// the monitor (inside an implementation of [`Persist::persist_new_channel`]), to allow for
		/// watchtowers in the persistence pipeline to have enough data to form justice transactions.
		///
		/// This is similar to [`Self::counterparty_commitment_txs_from_update`], except
		/// that for the initial commitment transaction, we don't have a corresponding update.
		///
		/// This will only return `Some` for channel monitors that have been created after upgrading
		/// to LDK 0.0.117+.
		///
		/// [`Persist::persist_new_channel`]: crate::chain::chainmonitor::Persist::persist_new_channel
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func initialCounterpartyCommitmentTx() -> CommitmentTransaction? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelMonitor>) in
					ChannelMonitor_initial_counterparty_commitment_tx(thisArgPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKCommitmentTransaction

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = CommitmentTransaction(
				cType: nativeCallResult, instantiationContext: "ChannelMonitor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Gets all of the counterparty commitment transactions provided by the given update. This
		/// may be empty if the update doesn't include any new counterparty commitments. Returned
		/// commitment transactions are unsigned.
		///
		/// This is provided so that watchtower clients in the persistence pipeline are able to build
		/// justice transactions for each counterparty commitment upon each update. It's intended to be
		/// used within an implementation of [`Persist::update_persisted_channel`], which is provided
		/// with a monitor and an update. Once revoked, signing a justice transaction can be done using
		/// [`Self::sign_to_local_justice_tx`].
		///
		/// It is expected that a watchtower client may use this method to retrieve the latest counterparty
		/// commitment transaction(s), and then hold the necessary data until a later update in which
		/// the monitor has been updated with the corresponding revocation data, at which point the
		/// monitor can sign the justice transaction.
		///
		/// This will only return a non-empty list for monitor updates that have been created after
		/// upgrading to LDK 0.0.117+. Note that no restriction lies on the monitors themselves, which
		/// may have been created prior to upgrading.
		///
		/// [`Persist::update_persisted_channel`]: crate::chain::chainmonitor::Persist::update_persisted_channel
		public func counterpartyCommitmentTxsFromUpdate(update: ChannelMonitorUpdate) -> [CommitmentTransaction] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelMonitor>) in

					withUnsafePointer(to: update.cType!) { (updatePointer: UnsafePointer<LDKChannelMonitorUpdate>) in
						ChannelMonitor_counterparty_commitment_txs_from_update(thisArgPointer, updatePointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_CommitmentTransactionZ(
				cType: nativeCallResult, instantiationContext: "ChannelMonitor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Wrapper around [`EcdsaChannelSigner::sign_justice_revoked_output`] to make
		/// signing the justice transaction easier for implementors of
		/// [`chain::chainmonitor::Persist`]. On success this method returns the provided transaction
		/// signing the input at `input_idx`. This method will only produce a valid signature for
		/// a transaction spending the `to_local` output of a commitment transaction, i.e. this cannot
		/// be used for revoked HTLC outputs.
		///
		/// `Value` is the value of the output being spent by the input at `input_idx`, committed
		/// in the BIP 143 signature.
		///
		/// This method will only succeed if this monitor has received the revocation secret for the
		/// provided `commitment_number`. If a commitment number is provided that does not correspond
		/// to the commitment transaction being revoked, this will return a signed transaction, but
		/// the signature will not be valid.
		///
		/// [`EcdsaChannelSigner::sign_justice_revoked_output`]: crate::sign::EcdsaChannelSigner::sign_justice_revoked_output
		/// [`Persist`]: crate::chain::chainmonitor::Persist
		public func signToLocalJusticeTx(justiceTx: [UInt8], inputIdx: UInt, value: UInt64, commitmentNumber: UInt64)
			-> Result_TransactionNoneZ
		{
			// native call variable prep

			let justiceTxPrimitiveWrapper = Transaction(
				value: justiceTx, instantiationContext: "ChannelMonitor.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelMonitor>) in
					ChannelMonitor_sign_to_local_justice_tx(
						thisArgPointer, justiceTxPrimitiveWrapper.cType!, inputIdx, value, commitmentNumber)
				}


			// cleanup

			// for elided types, we need this
			justiceTxPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_TransactionNoneZ(
				cType: nativeCallResult, instantiationContext: "ChannelMonitor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Gets the `node_id` of the counterparty for this channel.
		///
		/// Will be `None` for channels constructed on LDK versions prior to 0.0.110 and always `Some`
		/// otherwise.
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func getCounterpartyNodeId() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelMonitor>) in
					ChannelMonitor_get_counterparty_node_id(thisArgPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustPrimitiveWrapper
			// Type: LDKPublicKey

			if nativeCallResult.compressed_form == Bindings.arrayToUInt8Tuple33(array: [UInt8](repeating: 0, count: 33))
			{
				return nil
			}


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "ChannelMonitor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Used by [`ChannelManager`] deserialization to broadcast the latest holder state if its copy
		/// of the channel state was out-of-date.
		///
		/// You may also use this to broadcast the latest local commitment transaction, either because
		/// a monitor update failed or because we've fallen behind (i.e. we've received proof that our
		/// counterparty side knows a revocation secret we gave them that they shouldn't know).
		///
		/// Broadcasting these transactions in the second case is UNSAFE, as they allow counterparty
		/// side to punish you. Nevertheless you may want to broadcast them if counterparty doesn't
		/// close channel with their commitment transaction after a substantial amount of time. Best
		/// may be to contact the other node operator out-of-band to coordinate other options available
		/// to you.
		///
		/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
		public func getLatestHolderCommitmentTxn(logger: Logger) -> [[UInt8]] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelMonitor>) in

					withUnsafePointer(to: logger.activate().cType!) { (loggerPointer: UnsafePointer<LDKLogger>) in
						ChannelMonitor_get_latest_holder_commitment_txn(thisArgPointer, loggerPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_TransactionZ(
				cType: nativeCallResult, instantiationContext: "ChannelMonitor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Processes transactions in a newly connected block, which may result in any of the following:
		/// - update the monitor's state against resolved HTLCs
		/// - punish the counterparty in the case of seeing a revoked commitment transaction
		/// - force close the channel and claim/timeout incoming/outgoing HTLCs if near expiration
		/// - detect settled outputs for later spending
		/// - schedule and bump any in-flight claims
		///
		/// Returns any new outputs to watch from `txdata`; after called, these are also included in
		/// [`get_outputs_to_watch`].
		///
		/// [`get_outputs_to_watch`]: #method.get_outputs_to_watch
		public func blockConnected(
			header: [UInt8], txdata: [(UInt, [UInt8])], height: UInt32, broadcaster: BroadcasterInterface,
			feeEstimator: FeeEstimator, logger: Logger
		) -> [([UInt8], [(UInt32, TxOut)])] {
			// native call variable prep

			let tupledHeader = Bindings.arrayToUInt8Tuple80(array: header)

			let txdataVector = Vec_C2Tuple_usizeTransactionZZ(
				array: txdata, instantiationContext: "ChannelMonitor.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelMonitor>) in

					withUnsafePointer(to: tupledHeader) { (tupledHeaderPointer: UnsafePointer<UInt8Tuple80>) in
						ChannelMonitor_block_connected(
							thisArgPointer, tupledHeaderPointer, txdataVector.cType!, height,
							broadcaster.activate().cType!, feeEstimator.activate().cType!, logger.activate().cType!)
					}

				}


			// cleanup

			// txdataVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Vec_TransactionOutputsZ(
				cType: nativeCallResult, instantiationContext: "ChannelMonitor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Determines if the disconnected block contained any transactions of interest and updates
		/// appropriately.
		public func blockDisconnected(
			header: [UInt8], height: UInt32, broadcaster: BroadcasterInterface, feeEstimator: FeeEstimator,
			logger: Logger
		) {
			// native call variable prep

			let tupledHeader = Bindings.arrayToUInt8Tuple80(array: header)


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelMonitor>) in

					withUnsafePointer(to: tupledHeader) { (tupledHeaderPointer: UnsafePointer<UInt8Tuple80>) in
						ChannelMonitor_block_disconnected(
							thisArgPointer, tupledHeaderPointer, height, broadcaster.activate().cType!,
							feeEstimator.activate().cType!, logger.activate().cType!)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Processes transactions confirmed in a block with the given header and height, returning new
		/// outputs to watch. See [`block_connected`] for details.
		///
		/// Used instead of [`block_connected`] by clients that are notified of transactions rather than
		/// blocks. See [`chain::Confirm`] for calling expectations.
		///
		/// [`block_connected`]: Self::block_connected
		public func transactionsConfirmed(
			header: [UInt8], txdata: [(UInt, [UInt8])], height: UInt32, broadcaster: BroadcasterInterface,
			feeEstimator: FeeEstimator, logger: Logger
		) -> [([UInt8], [(UInt32, TxOut)])] {
			// native call variable prep

			let tupledHeader = Bindings.arrayToUInt8Tuple80(array: header)

			let txdataVector = Vec_C2Tuple_usizeTransactionZZ(
				array: txdata, instantiationContext: "ChannelMonitor.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelMonitor>) in

					withUnsafePointer(to: tupledHeader) { (tupledHeaderPointer: UnsafePointer<UInt8Tuple80>) in
						ChannelMonitor_transactions_confirmed(
							thisArgPointer, tupledHeaderPointer, txdataVector.cType!, height,
							broadcaster.activate().cType!, feeEstimator.activate().cType!, logger.activate().cType!)
					}

				}


			// cleanup

			// txdataVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Vec_TransactionOutputsZ(
				cType: nativeCallResult, instantiationContext: "ChannelMonitor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Processes a transaction that was reorganized out of the chain.
		///
		/// Used instead of [`block_disconnected`] by clients that are notified of transactions rather
		/// than blocks. See [`chain::Confirm`] for calling expectations.
		///
		/// [`block_disconnected`]: Self::block_disconnected
		public func transactionUnconfirmed(
			txid: [UInt8], broadcaster: BroadcasterInterface, feeEstimator: FeeEstimator, logger: Logger
		) {
			// native call variable prep

			let tupledTxid = Bindings.arrayToUInt8Tuple32(array: txid)


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelMonitor>) in

					withUnsafePointer(to: tupledTxid) { (tupledTxidPointer: UnsafePointer<UInt8Tuple32>) in
						ChannelMonitor_transaction_unconfirmed(
							thisArgPointer, tupledTxidPointer, broadcaster.activate().cType!,
							feeEstimator.activate().cType!, logger.activate().cType!)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Updates the monitor with the current best chain tip, returning new outputs to watch. See
		/// [`block_connected`] for details.
		///
		/// Used instead of [`block_connected`] by clients that are notified of transactions rather than
		/// blocks. See [`chain::Confirm`] for calling expectations.
		///
		/// [`block_connected`]: Self::block_connected
		public func bestBlockUpdated(
			header: [UInt8], height: UInt32, broadcaster: BroadcasterInterface, feeEstimator: FeeEstimator,
			logger: Logger
		) -> [([UInt8], [(UInt32, TxOut)])] {
			// native call variable prep

			let tupledHeader = Bindings.arrayToUInt8Tuple80(array: header)


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelMonitor>) in

					withUnsafePointer(to: tupledHeader) { (tupledHeaderPointer: UnsafePointer<UInt8Tuple80>) in
						ChannelMonitor_best_block_updated(
							thisArgPointer, tupledHeaderPointer, height, broadcaster.activate().cType!,
							feeEstimator.activate().cType!, logger.activate().cType!)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_TransactionOutputsZ(
				cType: nativeCallResult, instantiationContext: "ChannelMonitor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Returns the set of txids that should be monitored for re-organization out of the chain.
		public func getRelevantTxids() -> [([UInt8], [UInt8]?)] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelMonitor>) in
					ChannelMonitor_get_relevant_txids(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_C2Tuple_ThirtyTwoBytesCOption_ThirtyTwoBytesZZZ(
				cType: nativeCallResult, instantiationContext: "ChannelMonitor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Gets the latest best block which was connected either via the [`chain::Listen`] or
		/// [`chain::Confirm`] interfaces.
		public func currentBestBlock() -> BestBlock {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelMonitor>) in
					ChannelMonitor_current_best_block(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = BestBlock(
				cType: nativeCallResult, instantiationContext: "ChannelMonitor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Triggers rebroadcasts/fee-bumps of pending claims from a force-closed channel. This is
		/// crucial in preventing certain classes of pinning attacks, detecting substantial mempool
		/// feerate changes between blocks, and ensuring reliability if broadcasting fails. We recommend
		/// invoking this every 30 seconds, or lower if running in an environment with spotty
		/// connections, like on mobile.
		public func rebroadcastPendingClaims(
			broadcaster: BroadcasterInterface, feeEstimator: FeeEstimator, logger: Logger
		) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelMonitor>) in
					ChannelMonitor_rebroadcast_pending_claims(
						thisArgPointer, broadcaster.activate().cType!, feeEstimator.activate().cType!,
						logger.activate().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Gets the balances in this channel which are either claimable by us if we were to
		/// force-close the channel now or which are claimable on-chain (possibly awaiting
		/// confirmation).
		///
		/// Any balances in the channel which are available on-chain (excluding on-chain fees) are
		/// included here until an [`Event::SpendableOutputs`] event has been generated for the
		/// balance, or until our counterparty has claimed the balance and accrued several
		/// confirmations on the claim transaction.
		///
		/// Note that for `ChannelMonitors` which track a channel which went on-chain with versions of
		/// LDK prior to 0.0.111, balances may not be fully captured if our counterparty broadcasted
		/// a revoked state.
		///
		/// See [`Balance`] for additional details on the types of claimable balances which
		/// may be returned here and their meanings.
		public func getClaimableBalances() -> [Balance] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelMonitor>) in
					ChannelMonitor_get_claimable_balances(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_BalanceZ(
				cType: nativeCallResult, instantiationContext: "ChannelMonitor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}


		/// Indicates that this is the only struct which contains the same pointer.
		/// Rust functions which take ownership of an object provided via an argument require
		/// this to be true and invalidate the object pointed to by inner.
		public func isOwned() -> Bool {
			// return value (do some wrapping)
			let returnValue = self.cType!.is_owned

			return returnValue
		}


		internal func danglingClone() -> ChannelMonitor {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> ChannelMonitor {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> ChannelMonitor {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> ChannelMonitor {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing ChannelMonitor \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ChannelMonitor \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

