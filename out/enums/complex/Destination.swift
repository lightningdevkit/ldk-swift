import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias Destination = Bindings.Destination

extension Bindings {

	/// The destination of an onion message.
	public class Destination: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKDestination?

		internal init(cType: LDKDestination, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKDestination, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKDestination, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum DestinationType {

			/// We're sending this onion message to a node.
			case Node

			/// We're sending this onion message to a blinded path.
			case BlindedPath

		}

		public func getValueType() -> DestinationType {
			switch self.cType!.tag {
				case LDKDestination_Node:
					return .Node

				case LDKDestination_BlindedPath:
					return .BlindedPath

				default:
					Bindings.print("Error: Invalid value type for Destination! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the Destination
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = Destination_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the Destination
		internal func clone() -> Destination {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKDestination>) in
					Destination_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Destination(
				cType: nativeCallResult, instantiationContext: "Destination.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Node-variant Destination
		public class func initWithNode(a: [UInt8]) -> Destination {
			// native call variable prep

			let aPrimitiveWrapper = PublicKey(
				value: a, instantiationContext: "Destination.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Destination_node(aPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			aPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Destination(
				cType: nativeCallResult, instantiationContext: "Destination.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new BlindedPath-variant Destination
		public class func initWithBlindedPath(a: Bindings.BlindedMessagePath) -> Destination {
			// native call variable prep


			// native method call
			let nativeCallResult = Destination_blinded_path(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Destination(
				cType: nativeCallResult, instantiationContext: "Destination.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the Destination.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKDestination>) in
					Destination_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two Destinations contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: Destination, b: Destination) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKDestination>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKDestination>) in
						Destination_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Attempts to resolve the [`IntroductionNode::DirectedShortChannelId`] of a
		/// [`Destination::BlindedPath`] to a [`IntroductionNode::NodeId`], if applicable, using the
		/// provided [`ReadOnlyNetworkGraph`].
		public func resolve(networkGraph: Bindings.ReadOnlyNetworkGraph) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKDestination>) in

					withUnsafePointer(to: networkGraph.cType!) {
						(networkGraphPointer: UnsafePointer<LDKReadOnlyNetworkGraph>) in
						Destination_resolve(thisArgPointer, networkGraphPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func getValueAsNode() -> [UInt8]? {
			if self.cType?.tag != LDKDestination_Node {
				return nil
			}

			return PublicKey(
				cType: self.cType!.node, instantiationContext: "Destination.swift::\(#function):\(#line)", anchor: self
			)
			.getValue()
		}

		public func getValueAsBlindedPath() -> Bindings.BlindedMessagePath? {
			if self.cType?.tag != LDKDestination_BlindedPath {
				return nil
			}

			return BlindedMessagePath(
				cType: self.cType!.blinded_path, instantiationContext: "Destination.swift::\(#function):\(#line)",
				anchor: self)
		}


		internal func danglingClone() -> Destination {
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
					Bindings.print("Freeing Destination \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Destination \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
