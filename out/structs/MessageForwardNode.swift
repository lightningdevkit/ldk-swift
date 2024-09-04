#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// An intermediate node, and possibly a short channel id leading to the next node.
public typealias MessageForwardNode = Bindings.MessageForwardNode

extension Bindings {


	/// An intermediate node, and possibly a short channel id leading to the next node.
	public class MessageForwardNode: NativeTypeWrapper {

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

		internal var cType: LDKMessageForwardNode?

		internal init(cType: LDKMessageForwardNode, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKMessageForwardNode, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKMessageForwardNode, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the MessageForwardNode, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = MessageForwardNode_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// This node's pubkey.
		public func getNodeId() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKMessageForwardNode>) in
					MessageForwardNode_get_node_id(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "MessageForwardNode.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// This node's pubkey.
		public func setNodeId(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "MessageForwardNode.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKMessageForwardNode>) in
					MessageForwardNode_set_node_id(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The channel between `node_id` and the next hop. If set, the constructed [`BlindedHop`]'s
		/// `encrypted_payload` will use this instead of the next [`MessageForwardNode::node_id`] for a
		/// more compact representation.
		public func getShortChannelId() -> UInt64? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKMessageForwardNode>) in
					MessageForwardNode_get_short_channel_id(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "MessageForwardNode.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// The channel between `node_id` and the next hop. If set, the constructed [`BlindedHop`]'s
		/// `encrypted_payload` will use this instead of the next [`MessageForwardNode::node_id`] for a
		/// more compact representation.
		public func setShortChannelId(val: UInt64?) {
			// native call variable prep

			let valOption = Option_u64Z(
				some: val, instantiationContext: "MessageForwardNode.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKMessageForwardNode>) in
					MessageForwardNode_set_short_channel_id(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new MessageForwardNode given each field
		public init(nodeIdArg: [UInt8], shortChannelIdArg: UInt64?) {
			// native call variable prep

			let nodeIdArgPrimitiveWrapper = PublicKey(
				value: nodeIdArg, instantiationContext: "MessageForwardNode.swift::\(#function):\(#line)")

			let shortChannelIdArgOption = Option_u64Z(
				some: shortChannelIdArg, instantiationContext: "MessageForwardNode.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = MessageForwardNode_new(
				nodeIdArgPrimitiveWrapper.cType!, shortChannelIdArgOption.cType!)

			// cleanup

			// for elided types, we need this
			nodeIdArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = MessageForwardNode(cType: nativeCallResult, instantiationContext: "MessageForwardNode.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "MessageForwardNode.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the MessageForwardNode
		internal func clone() -> MessageForwardNode {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKMessageForwardNode>) in
					MessageForwardNode_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = MessageForwardNode(
				cType: nativeCallResult, instantiationContext: "MessageForwardNode.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the MessageForwardNode.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKMessageForwardNode>) in
					MessageForwardNode_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two MessageForwardNodes contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: MessageForwardNode, b: MessageForwardNode) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKMessageForwardNode>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKMessageForwardNode>) in
						MessageForwardNode_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


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


		internal func danglingClone() -> MessageForwardNode {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> MessageForwardNode {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> MessageForwardNode {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> MessageForwardNode {
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
						"Freeing MessageForwardNode \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing MessageForwardNode \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

