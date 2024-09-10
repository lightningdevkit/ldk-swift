#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A blinded path to be used for sending or receiving a message, hiding the identity of the
/// recipient.
public typealias BlindedMessagePath = Bindings.BlindedMessagePath

extension Bindings {


	/// A blinded path to be used for sending or receiving a message, hiding the identity of the
	/// recipient.
	public class BlindedMessagePath: NativeTypeWrapper {

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

		internal var cType: LDKBlindedMessagePath?

		internal init(cType: LDKBlindedMessagePath, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKBlindedMessagePath, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKBlindedMessagePath, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the BlindedMessagePath, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = BlindedMessagePath_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the BlindedMessagePath
		internal func clone() -> BlindedMessagePath {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBlindedMessagePath>) in
					BlindedMessagePath_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = BlindedMessagePath(
				cType: nativeCallResult, instantiationContext: "BlindedMessagePath.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the BlindedMessagePath.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKBlindedMessagePath>) in
					BlindedMessagePath_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two BlindedMessagePaths contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: BlindedMessagePath, b: BlindedMessagePath) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKBlindedMessagePath>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKBlindedMessagePath>) in
						BlindedMessagePath_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the BlindedMessagePath object into a byte array which can be read by BlindedMessagePath_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKBlindedMessagePath>) in
					BlindedMessagePath_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "BlindedMessagePath.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a BlindedMessagePath from a byte array, created by BlindedMessagePath_write
		public class func read(ser: [UInt8]) -> Result_BlindedMessagePathDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "BlindedMessagePath.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = BlindedMessagePath_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_BlindedMessagePathDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "BlindedMessagePath.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Create a one-hop blinded path for a message.
		public class func oneHop(recipientNodeId: [UInt8], context: MessageContext, entropySource: EntropySource)
			-> Result_BlindedMessagePathNoneZ
		{
			// native call variable prep

			let recipientNodeIdPrimitiveWrapper = PublicKey(
				value: recipientNodeId, instantiationContext: "BlindedMessagePath.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = BlindedMessagePath_one_hop(
				recipientNodeIdPrimitiveWrapper.cType!, context.danglingClone().cType!, entropySource.activate().cType!)

			// cleanup

			// for elided types, we need this
			recipientNodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_BlindedMessagePathNoneZ(
				cType: nativeCallResult, instantiationContext: "BlindedMessagePath.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Create a path for an onion message, to be forwarded along `node_pks`. The last node
		/// pubkey in `node_pks` will be the destination node.
		///
		/// Errors if no hops are provided or if `node_pk`(s) are invalid.
		public class func new(
			intermediateNodes: [MessageForwardNode], recipientNodeId: [UInt8], context: MessageContext,
			entropySource: EntropySource
		) -> Result_BlindedMessagePathNoneZ {
			// native call variable prep

			let intermediateNodesVector = Vec_MessageForwardNodeZ(
				array: intermediateNodes, instantiationContext: "BlindedMessagePath.swift::\(#function):\(#line)"
			)
			.dangle()

			let recipientNodeIdPrimitiveWrapper = PublicKey(
				value: recipientNodeId, instantiationContext: "BlindedMessagePath.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = BlindedMessagePath_new(
				intermediateNodesVector.cType!, recipientNodeIdPrimitiveWrapper.cType!, context.danglingClone().cType!,
				entropySource.activate().cType!)

			// cleanup

			// intermediateNodesVector.noOpRetain()

			// for elided types, we need this
			recipientNodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_BlindedMessagePathNoneZ(
				cType: nativeCallResult, instantiationContext: "BlindedMessagePath.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Attempts to a use a compact representation for the [`IntroductionNode`] by using a directed
		/// short channel id from a channel in `network_graph` leading to the introduction node.
		///
		/// While this may result in a smaller encoding, there is a trade off in that the path may
		/// become invalid if the channel is closed or hasn't been propagated via gossip. Therefore,
		/// calling this may not be suitable for long-lived blinded paths.
		public func useCompactIntroductionNode(networkGraph: ReadOnlyNetworkGraph) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisArgPointer: UnsafeMutablePointer<LDKBlindedMessagePath>) in

					withUnsafePointer(to: networkGraph.cType!) {
						(networkGraphPointer: UnsafePointer<LDKReadOnlyNetworkGraph>) in
						BlindedMessagePath_use_compact_introduction_node(thisArgPointer, networkGraphPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns the introduction [`NodeId`] of the blinded path, if it is publicly reachable (i.e.,
		/// it is found in the network graph).
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func publicIntroductionNodeId(networkGraph: ReadOnlyNetworkGraph) -> NodeId? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBlindedMessagePath>) in

					withUnsafePointer(to: networkGraph.cType!) {
						(networkGraphPointer: UnsafePointer<LDKReadOnlyNetworkGraph>) in
						BlindedMessagePath_public_introduction_node_id(thisArgPointer, networkGraphPointer)
					}

				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKNodeId

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = NodeId(
				cType: nativeCallResult, instantiationContext: "BlindedMessagePath.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The [`IntroductionNode`] of the blinded path.
		public func introductionNode() -> IntroductionNode {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBlindedMessagePath>) in
					BlindedMessagePath_introduction_node(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = IntroductionNode(
				cType: nativeCallResult, instantiationContext: "BlindedMessagePath.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Used by the [`IntroductionNode`] to decrypt its [`encrypted_payload`] to forward the message.
		///
		/// [`encrypted_payload`]: BlindedHop::encrypted_payload
		public func blindingPoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBlindedMessagePath>) in
					BlindedMessagePath_blinding_point(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "BlindedMessagePath.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The [`BlindedHop`]s within the blinded path.
		public func blindedHops() -> [BlindedHop] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBlindedMessagePath>) in
					BlindedMessagePath_blinded_hops(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_BlindedHopZ(
				cType: nativeCallResult, instantiationContext: "BlindedMessagePath.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Advance the blinded onion message path by one hop, making the second hop into the new
		/// introduction node.
		///
		/// Will only modify `self` when returning `Ok`.
		public func advancePathByOne(nodeSigner: NodeSigner, nodeIdLookup: NodeIdLookUp) -> Result_NoneNoneZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisArgPointer: UnsafeMutablePointer<LDKBlindedMessagePath>) in

					withUnsafePointer(to: nodeSigner.activate().cType!) {
						(nodeSignerPointer: UnsafePointer<LDKNodeSigner>) in

						withUnsafePointer(to: nodeIdLookup.activate().cType!) {
							(nodeIdLookupPointer: UnsafePointer<LDKNodeIdLookUp>) in
							BlindedMessagePath_advance_path_by_one(
								thisArgPointer, nodeSignerPointer, nodeIdLookupPointer)
						}

					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NoneNoneZ(
				cType: nativeCallResult, instantiationContext: "BlindedMessagePath.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


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


		internal func danglingClone() -> BlindedMessagePath {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> BlindedMessagePath {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> BlindedMessagePath {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> BlindedMessagePath {
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
						"Freeing BlindedMessagePath \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing BlindedMessagePath \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

