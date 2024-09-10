#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// An intermediate node, its outbound channel, and relay parameters.
public typealias PaymentForwardNode = Bindings.PaymentForwardNode

extension Bindings {


	/// An intermediate node, its outbound channel, and relay parameters.
	public class PaymentForwardNode: NativeTypeWrapper {

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

		internal var cType: LDKPaymentForwardNode?

		internal init(cType: LDKPaymentForwardNode, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKPaymentForwardNode, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKPaymentForwardNode, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the PaymentForwardNode, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = PaymentForwardNode_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The TLVs for this node's [`BlindedHop`], where the fee parameters contained within are also
		/// used for [`BlindedPayInfo`] construction.
		public func getTlvs() -> ForwardTlvs {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPaymentForwardNode>) in
					PaymentForwardNode_get_tlvs(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ForwardTlvs(
				cType: nativeCallResult, instantiationContext: "PaymentForwardNode.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The TLVs for this node's [`BlindedHop`], where the fee parameters contained within are also
		/// used for [`BlindedPayInfo`] construction.
		public func setTlvs(val: ForwardTlvs) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKPaymentForwardNode>) in
					PaymentForwardNode_set_tlvs(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPaymentForwardNode>) in
					PaymentForwardNode_get_node_id(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "PaymentForwardNode.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// This node's pubkey.
		public func setNodeId(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "PaymentForwardNode.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKPaymentForwardNode>) in
					PaymentForwardNode_set_node_id(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum value, in msat, that may be accepted by this node.
		public func getHtlcMaximumMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPaymentForwardNode>) in
					PaymentForwardNode_get_htlc_maximum_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum value, in msat, that may be accepted by this node.
		public func setHtlcMaximumMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKPaymentForwardNode>) in
					PaymentForwardNode_set_htlc_maximum_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new PaymentForwardNode given each field
		public init(tlvsArg: ForwardTlvs, nodeIdArg: [UInt8], htlcMaximumMsatArg: UInt64) {
			// native call variable prep

			let nodeIdArgPrimitiveWrapper = PublicKey(
				value: nodeIdArg, instantiationContext: "PaymentForwardNode.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = PaymentForwardNode_new(
				tlvsArg.dynamicallyDangledClone().cType!, nodeIdArgPrimitiveWrapper.cType!, htlcMaximumMsatArg)

			// cleanup

			// for elided types, we need this
			nodeIdArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = PaymentForwardNode(cType: nativeCallResult, instantiationContext: "PaymentForwardNode.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "PaymentForwardNode.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the PaymentForwardNode
		internal func clone() -> PaymentForwardNode {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKPaymentForwardNode>) in
					PaymentForwardNode_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PaymentForwardNode(
				cType: nativeCallResult, instantiationContext: "PaymentForwardNode.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> PaymentForwardNode {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> PaymentForwardNode {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> PaymentForwardNode {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> PaymentForwardNode {
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
						"Freeing PaymentForwardNode \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing PaymentForwardNode \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

