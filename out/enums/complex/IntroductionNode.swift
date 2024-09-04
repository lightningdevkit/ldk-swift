import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias IntroductionNode = Bindings.IntroductionNode

extension Bindings {

	/// The unblinded node in a blinded path.
	public class IntroductionNode: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKIntroductionNode?

		internal init(cType: LDKIntroductionNode, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKIntroductionNode, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKIntroductionNode, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum IntroductionNodeType {

			/// The node id of the introduction node.
			case NodeId

			/// The short channel id of the channel leading to the introduction node. The [`Direction`]
			/// identifies which side of the channel is the introduction node.
			case DirectedShortChannelId

		}

		public func getValueType() -> IntroductionNodeType {
			switch self.cType!.tag {
				case LDKIntroductionNode_NodeId:
					return .NodeId

				case LDKIntroductionNode_DirectedShortChannelId:
					return .DirectedShortChannelId

				default:
					Bindings.print("Error: Invalid value type for IntroductionNode! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the IntroductionNode
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = IntroductionNode_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the IntroductionNode
		internal func clone() -> IntroductionNode {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKIntroductionNode>) in
					IntroductionNode_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = IntroductionNode(
				cType: nativeCallResult, instantiationContext: "IntroductionNode.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new NodeId-variant IntroductionNode
		public class func initWithNodeId(a: [UInt8]) -> IntroductionNode {
			// native call variable prep

			let aPrimitiveWrapper = PublicKey(
				value: a, instantiationContext: "IntroductionNode.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = IntroductionNode_node_id(aPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			aPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = IntroductionNode(
				cType: nativeCallResult, instantiationContext: "IntroductionNode.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new DirectedShortChannelId-variant IntroductionNode
		public class func initWithDirectedShortChannelId(a: Direction, b: UInt64) -> IntroductionNode {
			// native call variable prep


			// native method call
			let nativeCallResult = IntroductionNode_directed_short_channel_id(a.getCValue(), b)

			// cleanup


			// return value (do some wrapping)
			let returnValue = IntroductionNode(
				cType: nativeCallResult, instantiationContext: "IntroductionNode.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the IntroductionNode.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKIntroductionNode>) in
					IntroductionNode_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two IntroductionNodes contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: IntroductionNode, b: IntroductionNode) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKIntroductionNode>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKIntroductionNode>) in
						IntroductionNode_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func getValueAsNodeId() -> [UInt8]? {
			if self.cType?.tag != LDKIntroductionNode_NodeId {
				return nil
			}

			return PublicKey(
				cType: self.cType!.node_id, instantiationContext: "IntroductionNode.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()
		}

		public func getValueAsDirectedShortChannelId() -> DirectedShortChannelId? {
			if self.cType?.tag != LDKIntroductionNode_DirectedShortChannelId {
				return nil
			}

			return IntroductionNode_LDKDirectedShortChannelId_Body(
				cType: self.cType!.directed_short_channel_id,
				instantiationContext: "IntroductionNode.swift::\(#function):\(#line)", anchor: self)
		}


		internal func danglingClone() -> IntroductionNode {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing IntroductionNode \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing IntroductionNode \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


		///
		internal typealias IntroductionNode_LDKDirectedShortChannelId_Body = DirectedShortChannelId


		///
		public class DirectedShortChannelId: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKIntroductionNode_LDKDirectedShortChannelId_Body?

			internal init(cType: LDKIntroductionNode_LDKDirectedShortChannelId_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKIntroductionNode_LDKDirectedShortChannelId_Body, instantiationContext: String,
				anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKIntroductionNode_LDKDirectedShortChannelId_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			///
			public func get0() -> Direction {
				// return value (do some wrapping)
				let returnValue = Direction(value: self.cType!._0)

				return returnValue
			}

			///
			public func get1() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!._1

				return returnValue
			}


		}


	}

}
