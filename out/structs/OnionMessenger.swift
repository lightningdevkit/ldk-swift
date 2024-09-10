#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A sender, receiver and forwarder of [`OnionMessage`]s.
///
/// # Handling Messages
///
/// `OnionMessenger` implements [`OnionMessageHandler`], making it responsible for either forwarding
/// messages to peers or delegating to the appropriate handler for the message type. Currently, the
/// available handlers are:
/// * [`OffersMessageHandler`], for responding to [`InvoiceRequest`]s and paying [`Bolt12Invoice`]s
/// * [`CustomOnionMessageHandler`], for handling user-defined message types
///
/// # Sending Messages
///
/// [`OnionMessage`]s are sent initially using [`OnionMessenger::send_onion_message`]. When handling
/// a message, the matched handler may return a response message which `OnionMessenger` will send
/// on its behalf.
///
/// # Example
///
/// ```
/// # extern crate bitcoin;
/// # use bitcoin::hashes::_export::_core::time::Duration;
/// # use bitcoin::hex::FromHex;
/// # use bitcoin::secp256k1::{PublicKey, Secp256k1, SecretKey, self};
/// # use lightning::blinded_path::EmptyNodeIdLookUp;
/// # use lightning::blinded_path::message::{BlindedMessagePath, MessageForwardNode, MessageContext};
/// # use lightning::sign::{EntropySource, KeysManager};
/// # use lightning::ln::peer_handler::IgnoringMessageHandler;
/// # use lightning::onion_message::messenger::{Destination, MessageRouter, MessageSendInstructions, OnionMessagePath, OnionMessenger};
/// # use lightning::onion_message::packet::OnionMessageContents;
/// # use lightning::util::logger::{Logger, Record};
/// # use lightning::util::ser::{Writeable, Writer};
/// # use lightning::io;
/// # use std::sync::Arc;
/// # struct FakeLogger;
/// # impl Logger for FakeLogger {
/// #     fn log(&self, record: Record) { println!(\"{:?}\" , record); }
/// # }
/// # struct FakeMessageRouter {}
/// # impl MessageRouter for FakeMessageRouter {
/// #     fn find_path(&self, sender: PublicKey, peers: Vec<PublicKey>, destination: Destination) -> Result<OnionMessagePath, ()> {
/// #         let secp_ctx = Secp256k1::new();
/// #         let node_secret = SecretKey::from_slice(&<Vec<u8>>::from_hex(\"0101010101010101010101010101010101010101010101010101010101010101\").unwrap()[..]).unwrap();
/// #         let hop_node_id1 = PublicKey::from_secret_key(&secp_ctx, &node_secret);
/// #         let hop_node_id2 = hop_node_id1;
/// #         Ok(OnionMessagePath {
/// #             intermediate_nodes: vec![hop_node_id1, hop_node_id2],
/// #             destination,
/// #             first_node_addresses: None,
/// #         })
/// #     }
/// #     fn create_blinded_paths<T: secp256k1::Signing + secp256k1::Verification>(
/// #         &self, _recipient: PublicKey, _context: MessageContext, _peers: Vec<PublicKey>, _secp_ctx: &Secp256k1<T>
/// #     ) -> Result<Vec<BlindedMessagePath>, ()> {
/// #         unreachable!()
/// #     }
/// # }
/// # let seed = [42u8; 32];
/// # let time = Duration::from_secs(123456);
/// # let keys_manager = KeysManager::new(&seed, time.as_secs(), time.subsec_nanos());
/// # let logger = Arc::new(FakeLogger {});
/// # let node_secret = SecretKey::from_slice(&<Vec<u8>>::from_hex(\"0101010101010101010101010101010101010101010101010101010101010101\").unwrap()[..]).unwrap();
/// # let secp_ctx = Secp256k1::new();
/// # let hop_node_id1 = PublicKey::from_secret_key(&secp_ctx, &node_secret);
/// # let (hop_node_id3, hop_node_id4) = (hop_node_id1, hop_node_id1);
/// # let destination_node_id = hop_node_id1;
/// # let node_id_lookup = EmptyNodeIdLookUp {};
/// # let message_router = Arc::new(FakeMessageRouter {});
/// # let custom_message_handler = IgnoringMessageHandler {};
/// # let offers_message_handler = IgnoringMessageHandler {};
/// # let async_payments_message_handler = IgnoringMessageHandler {};
/// // Create the onion messenger. This must use the same `keys_manager` as is passed to your
/// // ChannelManager.
/// let onion_messenger = OnionMessenger::new(
/// &keys_manager, &keys_manager, logger, &node_id_lookup, message_router,
/// &offers_message_handler, &async_payments_message_handler, &custom_message_handler
/// );
///
/// # #[derive(Debug, Clone)]
/// # struct YourCustomMessage {}
/// impl Writeable for YourCustomMessage {
/// \tfn write<W: Writer>(&self, w: &mut W) -> Result<(), io::Error> {
/// \t\t# Ok(())
/// \t\t// Write your custom onion message to `w`
/// \t}
/// }
/// impl OnionMessageContents for YourCustomMessage {
/// \tfn tlv_type(&self) -> u64 {
/// \t\t# let your_custom_message_type = 42;
/// \t\tyour_custom_message_type
/// \t}
/// \tfn msg_type(&self) -> &'static str { \"YourCustomMessageType\" }
/// }
/// // Send a custom onion message to a node id.
/// let destination = Destination::Node(destination_node_id);
/// let instructions = MessageSendInstructions::WithoutReplyPath { destination };
/// # let message = YourCustomMessage {};
/// onion_messenger.send_onion_message(message, instructions);
///
/// // Create a blinded path to yourself, for someone to send an onion message to.
/// # let your_node_id = hop_node_id1;
/// let hops = [
/// \tMessageForwardNode { node_id: hop_node_id3, short_channel_id: None },
/// \tMessageForwardNode { node_id: hop_node_id4, short_channel_id: None },
/// ];
/// let context = MessageContext::Custom(Vec::new());
/// let blinded_path = BlindedMessagePath::new(&hops, your_node_id, context, &keys_manager, &secp_ctx).unwrap();
///
/// // Send a custom onion message to a blinded path.
/// let destination = Destination::BlindedPath(blinded_path);
/// let instructions = MessageSendInstructions::WithoutReplyPath { destination };
/// # let message = YourCustomMessage {};
/// onion_messenger.send_onion_message(message, instructions);
/// ```
///
/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
public typealias OnionMessenger = Bindings.OnionMessenger

extension Bindings {


	/// A sender, receiver and forwarder of [`OnionMessage`]s.
	///
	/// # Handling Messages
	///
	/// `OnionMessenger` implements [`OnionMessageHandler`], making it responsible for either forwarding
	/// messages to peers or delegating to the appropriate handler for the message type. Currently, the
	/// available handlers are:
	/// * [`OffersMessageHandler`], for responding to [`InvoiceRequest`]s and paying [`Bolt12Invoice`]s
	/// * [`CustomOnionMessageHandler`], for handling user-defined message types
	///
	/// # Sending Messages
	///
	/// [`OnionMessage`]s are sent initially using [`OnionMessenger::send_onion_message`]. When handling
	/// a message, the matched handler may return a response message which `OnionMessenger` will send
	/// on its behalf.
	///
	/// # Example
	///
	/// ```
	/// # extern crate bitcoin;
	/// # use bitcoin::hashes::_export::_core::time::Duration;
	/// # use bitcoin::hex::FromHex;
	/// # use bitcoin::secp256k1::{PublicKey, Secp256k1, SecretKey, self};
	/// # use lightning::blinded_path::EmptyNodeIdLookUp;
	/// # use lightning::blinded_path::message::{BlindedMessagePath, MessageForwardNode, MessageContext};
	/// # use lightning::sign::{EntropySource, KeysManager};
	/// # use lightning::ln::peer_handler::IgnoringMessageHandler;
	/// # use lightning::onion_message::messenger::{Destination, MessageRouter, MessageSendInstructions, OnionMessagePath, OnionMessenger};
	/// # use lightning::onion_message::packet::OnionMessageContents;
	/// # use lightning::util::logger::{Logger, Record};
	/// # use lightning::util::ser::{Writeable, Writer};
	/// # use lightning::io;
	/// # use std::sync::Arc;
	/// # struct FakeLogger;
	/// # impl Logger for FakeLogger {
	/// #     fn log(&self, record: Record) { println!(\"{:?}\" , record); }
	/// # }
	/// # struct FakeMessageRouter {}
	/// # impl MessageRouter for FakeMessageRouter {
	/// #     fn find_path(&self, sender: PublicKey, peers: Vec<PublicKey>, destination: Destination) -> Result<OnionMessagePath, ()> {
	/// #         let secp_ctx = Secp256k1::new();
	/// #         let node_secret = SecretKey::from_slice(&<Vec<u8>>::from_hex(\"0101010101010101010101010101010101010101010101010101010101010101\").unwrap()[..]).unwrap();
	/// #         let hop_node_id1 = PublicKey::from_secret_key(&secp_ctx, &node_secret);
	/// #         let hop_node_id2 = hop_node_id1;
	/// #         Ok(OnionMessagePath {
	/// #             intermediate_nodes: vec![hop_node_id1, hop_node_id2],
	/// #             destination,
	/// #             first_node_addresses: None,
	/// #         })
	/// #     }
	/// #     fn create_blinded_paths<T: secp256k1::Signing + secp256k1::Verification>(
	/// #         &self, _recipient: PublicKey, _context: MessageContext, _peers: Vec<PublicKey>, _secp_ctx: &Secp256k1<T>
	/// #     ) -> Result<Vec<BlindedMessagePath>, ()> {
	/// #         unreachable!()
	/// #     }
	/// # }
	/// # let seed = [42u8; 32];
	/// # let time = Duration::from_secs(123456);
	/// # let keys_manager = KeysManager::new(&seed, time.as_secs(), time.subsec_nanos());
	/// # let logger = Arc::new(FakeLogger {});
	/// # let node_secret = SecretKey::from_slice(&<Vec<u8>>::from_hex(\"0101010101010101010101010101010101010101010101010101010101010101\").unwrap()[..]).unwrap();
	/// # let secp_ctx = Secp256k1::new();
	/// # let hop_node_id1 = PublicKey::from_secret_key(&secp_ctx, &node_secret);
	/// # let (hop_node_id3, hop_node_id4) = (hop_node_id1, hop_node_id1);
	/// # let destination_node_id = hop_node_id1;
	/// # let node_id_lookup = EmptyNodeIdLookUp {};
	/// # let message_router = Arc::new(FakeMessageRouter {});
	/// # let custom_message_handler = IgnoringMessageHandler {};
	/// # let offers_message_handler = IgnoringMessageHandler {};
	/// # let async_payments_message_handler = IgnoringMessageHandler {};
	/// // Create the onion messenger. This must use the same `keys_manager` as is passed to your
	/// // ChannelManager.
	/// let onion_messenger = OnionMessenger::new(
	/// &keys_manager, &keys_manager, logger, &node_id_lookup, message_router,
	/// &offers_message_handler, &async_payments_message_handler, &custom_message_handler
	/// );
	///
	/// # #[derive(Debug, Clone)]
	/// # struct YourCustomMessage {}
	/// impl Writeable for YourCustomMessage {
	/// \tfn write<W: Writer>(&self, w: &mut W) -> Result<(), io::Error> {
	/// \t\t# Ok(())
	/// \t\t// Write your custom onion message to `w`
	/// \t}
	/// }
	/// impl OnionMessageContents for YourCustomMessage {
	/// \tfn tlv_type(&self) -> u64 {
	/// \t\t# let your_custom_message_type = 42;
	/// \t\tyour_custom_message_type
	/// \t}
	/// \tfn msg_type(&self) -> &'static str { \"YourCustomMessageType\" }
	/// }
	/// // Send a custom onion message to a node id.
	/// let destination = Destination::Node(destination_node_id);
	/// let instructions = MessageSendInstructions::WithoutReplyPath { destination };
	/// # let message = YourCustomMessage {};
	/// onion_messenger.send_onion_message(message, instructions);
	///
	/// // Create a blinded path to yourself, for someone to send an onion message to.
	/// # let your_node_id = hop_node_id1;
	/// let hops = [
	/// \tMessageForwardNode { node_id: hop_node_id3, short_channel_id: None },
	/// \tMessageForwardNode { node_id: hop_node_id4, short_channel_id: None },
	/// ];
	/// let context = MessageContext::Custom(Vec::new());
	/// let blinded_path = BlindedMessagePath::new(&hops, your_node_id, context, &keys_manager, &secp_ctx).unwrap();
	///
	/// // Send a custom onion message to a blinded path.
	/// let destination = Destination::BlindedPath(blinded_path);
	/// let instructions = MessageSendInstructions::WithoutReplyPath { destination };
	/// # let message = YourCustomMessage {};
	/// onion_messenger.send_onion_message(message, instructions);
	/// ```
	///
	/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
	/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
	public class OnionMessenger: NativeTypeWrapper {

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

		internal var cType: LDKOnionMessenger?

		internal init(cType: LDKOnionMessenger, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKOnionMessenger, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKOnionMessenger, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the OnionMessenger, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = OnionMessenger_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new `OnionMessenger` to send, forward, and delegate received onion messages to
		/// their respective handlers.
		public class func initWith(
			entropySource: EntropySource, nodeSigner: NodeSigner, logger: Logger, nodeIdLookup: NodeIdLookUp,
			messageRouter: MessageRouter, offersHandler: OffersMessageHandler,
			asyncPaymentsHandler: AsyncPaymentsMessageHandler, customHandler: CustomOnionMessageHandler
		) -> OnionMessenger {
			// native call variable prep


			// native method call
			let nativeCallResult = OnionMessenger_new(
				entropySource.activate().cType!, nodeSigner.activate().cType!, logger.activate().cType!,
				nodeIdLookup.activate().cType!, messageRouter.activate().cType!, offersHandler.activate().cType!,
				asyncPaymentsHandler.activate().cType!, customHandler.activate().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = OnionMessenger(
				cType: nativeCallResult, instantiationContext: "OnionMessenger.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Similar to [`Self::new`], but rather than dropping onion messages that are
		/// intended to be forwarded to offline peers, we will intercept them for
		/// later forwarding.
		///
		/// Interception flow:
		/// 1. If an onion message for an offline peer is received, `OnionMessenger` will
		/// generate an [`Event::OnionMessageIntercepted`]. Event handlers can
		/// then choose to persist this onion message for later forwarding, or drop
		/// it.
		/// 2. When the offline peer later comes back online, `OnionMessenger` will
		/// generate an [`Event::OnionMessagePeerConnected`]. Event handlers will
		/// then fetch all previously intercepted onion messages for this peer.
		/// 3. Once the stored onion messages are fetched, they can finally be
		/// forwarded to the now-online peer via [`Self::forward_onion_message`].
		///
		/// # Note
		///
		/// LDK will not rate limit how many [`Event::OnionMessageIntercepted`]s
		/// are generated, so it is the caller's responsibility to limit how many
		/// onion messages are persisted and only persist onion messages for relevant
		/// peers.
		public class func initWithWithOfflinePeerInterception(
			entropySource: EntropySource, nodeSigner: NodeSigner, logger: Logger, nodeIdLookup: NodeIdLookUp,
			messageRouter: MessageRouter, offersHandler: OffersMessageHandler,
			asyncPaymentsHandler: AsyncPaymentsMessageHandler, customHandler: CustomOnionMessageHandler
		) -> OnionMessenger {
			// native call variable prep


			// native method call
			let nativeCallResult = OnionMessenger_new_with_offline_peer_interception(
				entropySource.activate().cType!, nodeSigner.activate().cType!, logger.activate().cType!,
				nodeIdLookup.activate().cType!, messageRouter.activate().cType!, offersHandler.activate().cType!,
				asyncPaymentsHandler.activate().cType!, customHandler.activate().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = OnionMessenger(
				cType: nativeCallResult, instantiationContext: "OnionMessenger.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Sends an [`OnionMessage`] based on its [`MessageSendInstructions`].
		public func sendOnionMessage(contents: OnionMessageContents, instructions: MessageSendInstructions)
			-> Result_SendSuccessSendErrorZ
		{
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOnionMessenger>) in
					OnionMessenger_send_onion_message(
						thisArgPointer, contents.activate().cType!, instructions.danglingClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_SendSuccessSendErrorZ(
				cType: nativeCallResult, instantiationContext: "OnionMessenger.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Forwards an [`OnionMessage`] to `peer_node_id`. Useful if we initialized
		/// the [`OnionMessenger`] with [`Self::new_with_offline_peer_interception`]
		/// and want to forward a previously intercepted onion message to a peer that
		/// has just come online.
		public func forwardOnionMessage(message: OnionMessage, peerNodeId: [UInt8]) -> Result_NoneSendErrorZ {
			// native call variable prep

			let peerNodeIdPrimitiveWrapper = PublicKey(
				value: peerNodeId, instantiationContext: "OnionMessenger.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOnionMessenger>) in
					OnionMessenger_forward_onion_message(
						thisArgPointer, message.dynamicallyDangledClone().cType!, peerNodeIdPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			peerNodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneSendErrorZ(
				cType: nativeCallResult, instantiationContext: "OnionMessenger.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Handles the response to an [`OnionMessage`] based on its [`ResponseInstruction`],
		/// enqueueing any response for sending.
		///
		/// This function is useful for asynchronous handling of [`OnionMessage`]s.
		/// Handlers have the option to return `None`, indicating that no immediate response should be
		/// sent. Then, they can transfer the associated [`Responder`] to another task responsible for
		/// generating the response asynchronously. Subsequently, when the response is prepared and
		/// ready for sending, that task can invoke this method to enqueue the response for delivery.
		public func handleOnionMessageResponse(response: OnionMessageContents, instructions: ResponseInstruction)
			-> Result_SendSuccessSendErrorZ
		{
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOnionMessenger>) in
					OnionMessenger_handle_onion_message_response(
						thisArgPointer, response.activate().cType!, instructions.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_SendSuccessSendErrorZ(
				cType: nativeCallResult, instantiationContext: "OnionMessenger.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Gets a [`Future`] that completes when an event is available via
		/// [`EventsProvider::process_pending_events`] or [`Self::process_pending_events_async`].
		///
		/// Note that callbacks registered on the [`Future`] MUST NOT call back into this
		/// [`OnionMessenger`] and should instead register actions to be taken later.
		///
		/// [`EventsProvider::process_pending_events`]: crate::events::EventsProvider::process_pending_events
		public func getUpdateFuture() -> Future {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOnionMessenger>) in
					OnionMessenger_get_update_future(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Future(
				cType: nativeCallResult, instantiationContext: "OnionMessenger.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Constructs a new EventsProvider which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned EventsProvider must be freed before this_arg is
		public func asEventsProvider() -> EventsProvider {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOnionMessenger>) in
					OnionMessenger_as_EventsProvider(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedEventsProvider(
				cType: nativeCallResult, instantiationContext: "OnionMessenger.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Constructs a new OnionMessageHandler which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned OnionMessageHandler must be freed before this_arg is
		public func asOnionMessageHandler() -> OnionMessageHandler {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOnionMessenger>) in
					OnionMessenger_as_OnionMessageHandler(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedOnionMessageHandler(
				cType: nativeCallResult, instantiationContext: "OnionMessenger.swift::\(#function):\(#line)",
				anchor: self)


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


		internal func setCFreeability(freeable: Bool) -> OnionMessenger {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> OnionMessenger {
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
						"Freeing OnionMessenger \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing OnionMessenger \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

