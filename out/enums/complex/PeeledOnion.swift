import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias PeeledOnion = Bindings.PeeledOnion

extension Bindings {

	/// A processed incoming onion message, containing either a Forward (another onion message)
	/// or a Receive payload with decrypted contents.
	public class PeeledOnion: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKPeeledOnion?

		internal init(cType: LDKPeeledOnion, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKPeeledOnion, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKPeeledOnion, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum PeeledOnionType {

			/// Forwarded onion, with the next node id and a new onion
			case Forward

			/// Received onion message, with decrypted contents, path_id, and reply path
			case Receive

		}

		public func getValueType() -> PeeledOnionType {
			switch self.cType!.tag {
				case LDKPeeledOnion_Forward:
					return .Forward

				case LDKPeeledOnion_Receive:
					return .Receive

				default:
					Bindings.print("Error: Invalid value type for PeeledOnion! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the PeeledOnion
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = PeeledOnion_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the PeeledOnion
		internal func clone() -> PeeledOnion {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKPeeledOnion>) in
					PeeledOnion_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PeeledOnion(
				cType: nativeCallResult, instantiationContext: "PeeledOnion.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Forward-variant PeeledOnion
		public class func initForward(a: [UInt8], b: Bindings.OnionMessage) -> PeeledOnion {
			// native call variable prep

			let aPrimitiveWrapper = PublicKey(
				value: a, instantiationContext: "PeeledOnion.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = PeeledOnion_forward(aPrimitiveWrapper.cType!, b.dynamicallyDangledClone().cType!)

			// cleanup

			// for elided types, we need this
			aPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = PeeledOnion(
				cType: nativeCallResult, instantiationContext: "PeeledOnion.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Receive-variant PeeledOnion
		public class func initWithReceive(a: ParsedOnionMessageContents, b: [UInt8], c: Bindings.BlindedPath)
			-> PeeledOnion
		{
			// native call variable prep

			let bPrimitiveWrapper = ThirtyTwoBytes(
				value: b, instantiationContext: "PeeledOnion.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = PeeledOnion_receive(
				a.danglingClone().cType!, bPrimitiveWrapper.cType!, c.dynamicallyDangledClone().cType!)

			// cleanup

			// for elided types, we need this
			bPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = PeeledOnion(
				cType: nativeCallResult, instantiationContext: "PeeledOnion.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValueAsForward() -> Forward? {
			if self.cType?.tag != LDKPeeledOnion_Forward {
				return nil
			}

			return PeeledOnion_LDKForward_Body(
				cType: self.cType!.forward, instantiationContext: "PeeledOnion.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsReceive() -> Receive? {
			if self.cType?.tag != LDKPeeledOnion_Receive {
				return nil
			}

			return PeeledOnion_LDKReceive_Body(
				cType: self.cType!.receive, instantiationContext: "PeeledOnion.swift::\(#function):\(#line)",
				anchor: self)
		}


		internal func danglingClone() -> PeeledOnion {
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
					Bindings.print("Freeing PeeledOnion \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing PeeledOnion \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


		///
		internal typealias PeeledOnion_LDKForward_Body = Forward


		///
		public class Forward: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKPeeledOnion_LDKForward_Body?

			internal init(cType: LDKPeeledOnion_LDKForward_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKPeeledOnion_LDKForward_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKPeeledOnion_LDKForward_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			///
			public func get0() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = PublicKey(
					cType: self.cType!._0, instantiationContext: "PeeledOnion.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			///
			public func get1() -> Bindings.OnionMessage {
				// return value (do some wrapping)
				let returnValue = Bindings.OnionMessage(
					cType: self.cType!._1, instantiationContext: "PeeledOnion.swift::\(#function):\(#line)",
					anchor: self)

				return returnValue
			}


		}


		///
		internal typealias PeeledOnion_LDKReceive_Body = Receive


		///
		public class Receive: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKPeeledOnion_LDKReceive_Body?

			internal init(cType: LDKPeeledOnion_LDKReceive_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKPeeledOnion_LDKReceive_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKPeeledOnion_LDKReceive_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			///
			public func get0() -> ParsedOnionMessageContents {
				// return value (do some wrapping)
				let returnValue = ParsedOnionMessageContents(
					cType: self.cType!._0, instantiationContext: "PeeledOnion.swift::\(#function):\(#line)",
					anchor: self)

				return returnValue
			}

			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func get1() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!._1, instantiationContext: "PeeledOnion.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func get2() -> Bindings.BlindedPath {
				// return value (do some wrapping)
				let returnValue = Bindings.BlindedPath(
					cType: self.cType!._2, instantiationContext: "PeeledOnion.swift::\(#function):\(#line)",
					anchor: self)

				return returnValue
			}


		}


	}

}
