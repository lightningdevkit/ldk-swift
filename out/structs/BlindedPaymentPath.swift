#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A blinded path to be used for sending or receiving a payment, hiding the identity of the
/// recipient.
public typealias BlindedPaymentPath = Bindings.BlindedPaymentPath

extension Bindings {


	/// A blinded path to be used for sending or receiving a payment, hiding the identity of the
	/// recipient.
	public class BlindedPaymentPath: NativeTypeWrapper {

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

		internal var cType: LDKBlindedPaymentPath?

		internal init(cType: LDKBlindedPaymentPath, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKBlindedPaymentPath, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKBlindedPaymentPath, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the BlindedPaymentPath, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = BlindedPaymentPath_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The [`BlindedPayInfo`] used to pay this blinded path.
		public func getPayinfo() -> BlindedPayInfo {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBlindedPaymentPath>) in
					BlindedPaymentPath_get_payinfo(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = BlindedPayInfo(
				cType: nativeCallResult, instantiationContext: "BlindedPaymentPath.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The [`BlindedPayInfo`] used to pay this blinded path.
		public func setPayinfo(val: BlindedPayInfo) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKBlindedPaymentPath>) in
					BlindedPaymentPath_set_payinfo(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the BlindedPaymentPath
		internal func clone() -> BlindedPaymentPath {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBlindedPaymentPath>) in
					BlindedPaymentPath_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = BlindedPaymentPath(
				cType: nativeCallResult, instantiationContext: "BlindedPaymentPath.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the BlindedPaymentPath.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKBlindedPaymentPath>) in
					BlindedPaymentPath_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two BlindedPaymentPaths contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: BlindedPaymentPath, b: BlindedPaymentPath) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKBlindedPaymentPath>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKBlindedPaymentPath>) in
						BlindedPaymentPath_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Create a one-hop blinded path for a payment.
		public class func oneHop(
			payeeNodeId: [UInt8], payeeTlvs: ReceiveTlvs, minFinalCltvExpiryDelta: UInt16, entropySource: EntropySource
		) -> Result_BlindedPaymentPathNoneZ {
			// native call variable prep

			let payeeNodeIdPrimitiveWrapper = PublicKey(
				value: payeeNodeId, instantiationContext: "BlindedPaymentPath.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = BlindedPaymentPath_one_hop(
				payeeNodeIdPrimitiveWrapper.cType!, payeeTlvs.dynamicallyDangledClone().cType!, minFinalCltvExpiryDelta,
				entropySource.activate().cType!)

			// cleanup

			// for elided types, we need this
			payeeNodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_BlindedPaymentPathNoneZ(
				cType: nativeCallResult, instantiationContext: "BlindedPaymentPath.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Create a blinded path for a payment, to be forwarded along `intermediate_nodes`.
		///
		/// Errors if:
		/// * a provided node id is invalid
		/// * [`BlindedPayInfo`] calculation results in an integer overflow
		/// * any unknown features are required in the provided [`ForwardTlvs`]
		public class func new(
			intermediateNodes: [PaymentForwardNode], payeeNodeId: [UInt8], payeeTlvs: ReceiveTlvs,
			htlcMaximumMsat: UInt64, minFinalCltvExpiryDelta: UInt16, entropySource: EntropySource
		) -> Result_BlindedPaymentPathNoneZ {
			// native call variable prep

			let intermediateNodesVector = Vec_PaymentForwardNodeZ(
				array: intermediateNodes, instantiationContext: "BlindedPaymentPath.swift::\(#function):\(#line)"
			)
			.dangle()

			let payeeNodeIdPrimitiveWrapper = PublicKey(
				value: payeeNodeId, instantiationContext: "BlindedPaymentPath.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = BlindedPaymentPath_new(
				intermediateNodesVector.cType!, payeeNodeIdPrimitiveWrapper.cType!,
				payeeTlvs.dynamicallyDangledClone().cType!, htlcMaximumMsat, minFinalCltvExpiryDelta,
				entropySource.activate().cType!)

			// cleanup

			// intermediateNodesVector.noOpRetain()

			// for elided types, we need this
			payeeNodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_BlindedPaymentPathNoneZ(
				cType: nativeCallResult, instantiationContext: "BlindedPaymentPath.swift::\(#function):\(#line)")


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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBlindedPaymentPath>) in

					withUnsafePointer(to: networkGraph.cType!) {
						(networkGraphPointer: UnsafePointer<LDKReadOnlyNetworkGraph>) in
						BlindedPaymentPath_public_introduction_node_id(thisArgPointer, networkGraphPointer)
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
				cType: nativeCallResult, instantiationContext: "BlindedPaymentPath.swift::\(#function):\(#line)",
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBlindedPaymentPath>) in
					BlindedPaymentPath_introduction_node(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = IntroductionNode(
				cType: nativeCallResult, instantiationContext: "BlindedPaymentPath.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Used by the [`IntroductionNode`] to decrypt its [`encrypted_payload`] to forward the payment.
		///
		/// [`encrypted_payload`]: BlindedHop::encrypted_payload
		public func blindingPoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBlindedPaymentPath>) in
					BlindedPaymentPath_blinding_point(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "BlindedPaymentPath.swift::\(#function):\(#line)",
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBlindedPaymentPath>) in
					BlindedPaymentPath_blinded_hops(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_BlindedHopZ(
				cType: nativeCallResult, instantiationContext: "BlindedPaymentPath.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Advance the blinded onion payment path by one hop, making the second hop into the new
		/// introduction node.
		///
		/// Will only modify `self` when returning `Ok`.
		public func advancePathByOne(nodeSigner: NodeSigner, nodeIdLookup: NodeIdLookUp) -> Result_NoneNoneZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisArgPointer: UnsafeMutablePointer<LDKBlindedPaymentPath>) in

					withUnsafePointer(to: nodeSigner.activate().cType!) {
						(nodeSignerPointer: UnsafePointer<LDKNodeSigner>) in

						withUnsafePointer(to: nodeIdLookup.activate().cType!) {
							(nodeIdLookupPointer: UnsafePointer<LDKNodeIdLookUp>) in
							BlindedPaymentPath_advance_path_by_one(
								thisArgPointer, nodeSignerPointer, nodeIdLookupPointer)
						}

					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NoneNoneZ(
				cType: nativeCallResult, instantiationContext: "BlindedPaymentPath.swift::\(#function):\(#line)",
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


		internal func danglingClone() -> BlindedPaymentPath {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> BlindedPaymentPath {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> BlindedPaymentPath {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> BlindedPaymentPath {
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
						"Freeing BlindedPaymentPath \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing BlindedPaymentPath \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

