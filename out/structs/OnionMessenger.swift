
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A sender, receiver and forwarder of onion messages. In upcoming releases, this object will be
			/// used to retrieve invoices and fulfill invoice requests from [offers]. Currently, only sending
			/// and receiving custom onion messages is supported.
			/// 
			/// # Example
			/// 
			/// ```
			/// # extern crate bitcoin;
			/// # use bitcoin::hashes::_export::_core::time::Duration;
			/// # use bitcoin::secp256k1::{PublicKey, Secp256k1, SecretKey};
			/// # use lightning::blinded_path::BlindedPath;
			/// # use lightning::chain::keysinterface::KeysManager;
			/// # use lightning::ln::peer_handler::IgnoringMessageHandler;
			/// # use lightning::onion_message::messenger::{Destination, OnionMessenger};
			/// # use lightning::onion_message::packet::{CustomOnionMessageContents, OnionMessageContents};
			/// # use lightning::util::logger::{Logger, Record};
			/// # use lightning::util::ser::{Writeable, Writer};
			/// # use lightning::io;
			/// # use std::sync::Arc;
			/// # struct FakeLogger;
			/// # impl Logger for FakeLogger {
			/// #     fn log(&self, record: &Record) { unimplemented!() }
			/// # }
			/// # let seed = [42u8; 32];
			/// # let time = Duration::from_secs(123456);
			/// # let keys_manager = KeysManager::new(&seed, time.as_secs(), time.subsec_nanos());
			/// # let logger = Arc::new(FakeLogger {});
			/// # let node_secret = SecretKey::from_slice(&hex::decode(\"0101010101010101010101010101010101010101010101010101010101010101\").unwrap()[..]).unwrap();
			/// # let secp_ctx = Secp256k1::new();
			/// # let hop_node_id1 = PublicKey::from_secret_key(&secp_ctx, &node_secret);
			/// # let (hop_node_id2, hop_node_id3, hop_node_id4) = (hop_node_id1, hop_node_id1, hop_node_id1);
			/// # let destination_node_id = hop_node_id1;
			/// # let your_custom_message_handler = IgnoringMessageHandler {};
			/// // Create the onion messenger. This must use the same `keys_manager` as is passed to your
			/// // ChannelManager.
			/// let onion_messenger = OnionMessenger::new(&keys_manager, &keys_manager, logger, &your_custom_message_handler);
			/// 
			/// # #[derive(Clone)]
			/// # struct YourCustomMessage {}
			/// impl Writeable for YourCustomMessage {
			/// \tfn write<W: Writer>(&self, w: &mut W) -> Result<(), io::Error> {
			/// \t\t# Ok(())
			/// \t\t// Write your custom onion message to `w`
			/// \t}
			/// }
			/// impl CustomOnionMessageContents for YourCustomMessage {
			/// \tfn tlv_type(&self) -> u64 {
			/// \t\t# let your_custom_message_type = 42;
			/// \t\tyour_custom_message_type
			/// \t}
			/// }
			/// // Send a custom onion message to a node id.
			/// let intermediate_hops = [hop_node_id1, hop_node_id2];
			/// let reply_path = None;
			/// # let your_custom_message = YourCustomMessage {};
			/// let message = OnionMessageContents::Custom(your_custom_message);
			/// onion_messenger.send_onion_message(&intermediate_hops, Destination::Node(destination_node_id), message, reply_path);
			/// 
			/// // Create a blinded path to yourself, for someone to send an onion message to.
			/// # let your_node_id = hop_node_id1;
			/// let hops = [hop_node_id3, hop_node_id4, your_node_id];
			/// let blinded_path = BlindedPath::new_for_message(&hops, &keys_manager, &secp_ctx).unwrap();
			/// 
			/// // Send a custom onion message to a blinded path.
			/// # let intermediate_hops = [hop_node_id1, hop_node_id2];
			/// let reply_path = None;
			/// # let your_custom_message = YourCustomMessage {};
			/// let message = OnionMessageContents::Custom(your_custom_message);
			/// onion_messenger.send_onion_message(&intermediate_hops, Destination::BlindedPath(blinded_path), message, reply_path);
			/// ```
			/// 
			/// [offers]: <https://github.com/lightning/bolts/pull/798>
			/// [`OnionMessenger`]: crate::onion_message::OnionMessenger
			public typealias OnionMessenger = Bindings.OnionMessenger

			extension Bindings {
		

				/// A sender, receiver and forwarder of onion messages. In upcoming releases, this object will be
				/// used to retrieve invoices and fulfill invoice requests from [offers]. Currently, only sending
				/// and receiving custom onion messages is supported.
				/// 
				/// # Example
				/// 
				/// ```
				/// # extern crate bitcoin;
				/// # use bitcoin::hashes::_export::_core::time::Duration;
				/// # use bitcoin::secp256k1::{PublicKey, Secp256k1, SecretKey};
				/// # use lightning::blinded_path::BlindedPath;
				/// # use lightning::chain::keysinterface::KeysManager;
				/// # use lightning::ln::peer_handler::IgnoringMessageHandler;
				/// # use lightning::onion_message::messenger::{Destination, OnionMessenger};
				/// # use lightning::onion_message::packet::{CustomOnionMessageContents, OnionMessageContents};
				/// # use lightning::util::logger::{Logger, Record};
				/// # use lightning::util::ser::{Writeable, Writer};
				/// # use lightning::io;
				/// # use std::sync::Arc;
				/// # struct FakeLogger;
				/// # impl Logger for FakeLogger {
				/// #     fn log(&self, record: &Record) { unimplemented!() }
				/// # }
				/// # let seed = [42u8; 32];
				/// # let time = Duration::from_secs(123456);
				/// # let keys_manager = KeysManager::new(&seed, time.as_secs(), time.subsec_nanos());
				/// # let logger = Arc::new(FakeLogger {});
				/// # let node_secret = SecretKey::from_slice(&hex::decode(\"0101010101010101010101010101010101010101010101010101010101010101\").unwrap()[..]).unwrap();
				/// # let secp_ctx = Secp256k1::new();
				/// # let hop_node_id1 = PublicKey::from_secret_key(&secp_ctx, &node_secret);
				/// # let (hop_node_id2, hop_node_id3, hop_node_id4) = (hop_node_id1, hop_node_id1, hop_node_id1);
				/// # let destination_node_id = hop_node_id1;
				/// # let your_custom_message_handler = IgnoringMessageHandler {};
				/// // Create the onion messenger. This must use the same `keys_manager` as is passed to your
				/// // ChannelManager.
				/// let onion_messenger = OnionMessenger::new(&keys_manager, &keys_manager, logger, &your_custom_message_handler);
				/// 
				/// # #[derive(Clone)]
				/// # struct YourCustomMessage {}
				/// impl Writeable for YourCustomMessage {
				/// \tfn write<W: Writer>(&self, w: &mut W) -> Result<(), io::Error> {
				/// \t\t# Ok(())
				/// \t\t// Write your custom onion message to `w`
				/// \t}
				/// }
				/// impl CustomOnionMessageContents for YourCustomMessage {
				/// \tfn tlv_type(&self) -> u64 {
				/// \t\t# let your_custom_message_type = 42;
				/// \t\tyour_custom_message_type
				/// \t}
				/// }
				/// // Send a custom onion message to a node id.
				/// let intermediate_hops = [hop_node_id1, hop_node_id2];
				/// let reply_path = None;
				/// # let your_custom_message = YourCustomMessage {};
				/// let message = OnionMessageContents::Custom(your_custom_message);
				/// onion_messenger.send_onion_message(&intermediate_hops, Destination::Node(destination_node_id), message, reply_path);
				/// 
				/// // Create a blinded path to yourself, for someone to send an onion message to.
				/// # let your_node_id = hop_node_id1;
				/// let hops = [hop_node_id3, hop_node_id4, your_node_id];
				/// let blinded_path = BlindedPath::new_for_message(&hops, &keys_manager, &secp_ctx).unwrap();
				/// 
				/// // Send a custom onion message to a blinded path.
				/// # let intermediate_hops = [hop_node_id1, hop_node_id2];
				/// let reply_path = None;
				/// # let your_custom_message = YourCustomMessage {};
				/// let message = OnionMessageContents::Custom(your_custom_message);
				/// onion_messenger.send_onion_message(&intermediate_hops, Destination::BlindedPath(blinded_path), message, reply_path);
				/// ```
				/// 
				/// [offers]: <https://github.com/lightning/bolts/pull/798>
				/// [`OnionMessenger`]: crate::onion_message::OnionMessenger
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

					internal init(cType: LDKOnionMessenger, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
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
					public init(entropySource: EntropySource, nodeSigner: NodeSigner, logger: Logger, customHandler: CustomOnionMessageHandler) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = OnionMessenger_new(entropySource.activate().cType!, nodeSigner.activate().cType!, logger.activate().cType!, customHandler.activate().cType!)

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = OnionMessenger(cType: nativeCallResult, instantiationContext: "OnionMessenger.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "OnionMessenger.swift::\(#function):\(#line)")
				
			
					}
		
					/// Send an onion message with contents `message` to `destination`, routing it through `intermediate_nodes`.
					/// See [`OnionMessenger`] for example usage.
					/// 
					/// Note that reply_path (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func sendOnionMessage(intermediateNodes: [[UInt8]], destination: Destination, message: OnionMessageContents, replyPath: BlindedPath) -> Result_NoneSendErrorZ {
						// native call variable prep
						
						let intermediateNodesVector = Vec_PublicKeyZ(array: intermediateNodes, instantiationContext: "OnionMessenger.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOnionMessenger>) in
				OnionMessenger_send_onion_message(thisArgPointer, intermediateNodesVector.cType!, destination.danglingClone().cType!, message.danglingClone().cType!, replyPath.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						
						// intermediateNodesVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_NoneSendErrorZ(cType: nativeCallResult, instantiationContext: "OnionMessenger.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

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
						let returnValue = NativelyImplementedOnionMessageHandler(cType: nativeCallResult, instantiationContext: "OnionMessenger.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// Constructs a new OnionMessageProvider which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned OnionMessageProvider must be freed before this_arg is
					public func asOnionMessageProvider() -> OnionMessageProvider {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOnionMessenger>) in
				OnionMessenger_as_OnionMessageProvider(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedOnionMessageProvider(cType: nativeCallResult, instantiationContext: "OnionMessenger.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> OnionMessenger {
						self.dangling = shouldDangle
						return self
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
								Bindings.print("Freeing OnionMessenger \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing OnionMessenger \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		