#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// The best known block as identified by its hash and height.
public typealias BestBlock = Bindings.BestBlock

extension Bindings {


	/// The best known block as identified by its hash and height.
	public class BestBlock: NativeTypeWrapper {

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

		internal var cType: LDKBestBlock?

		internal init(cType: LDKBestBlock, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKBestBlock, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKBestBlock, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the BestBlock, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = BestBlock_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the BestBlock
		internal func clone() -> BestBlock {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBestBlock>) in
					BestBlock_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = BestBlock(
				cType: nativeCallResult, instantiationContext: "BestBlock.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two BestBlocks contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: BestBlock, b: BestBlock) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKBestBlock>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKBestBlock>) in
						BestBlock_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a `BestBlock` that represents the genesis block at height 0 of the given
		/// network.
		public class func initWithNetwork(network: Network) -> BestBlock {
			// native call variable prep


			// native method call
			let nativeCallResult = BestBlock_from_network(network.getCValue())

			// cleanup


			// return value (do some wrapping)
			let returnValue = BestBlock(
				cType: nativeCallResult, instantiationContext: "BestBlock.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Returns a `BestBlock` as identified by the given block hash and height.
		public init(blockHash: [UInt8], height: UInt32) {
			// native call variable prep

			let blockHashPrimitiveWrapper = ThirtyTwoBytes(
				value: blockHash, instantiationContext: "BestBlock.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = BestBlock_new(blockHashPrimitiveWrapper.cType!, height)

			// cleanup

			// for elided types, we need this
			blockHashPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = BestBlock(cType: nativeCallResult, instantiationContext: "BestBlock.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: "BestBlock.swift::\(#function):\(#line)")


		}

		/// Returns the best block hash.
		public func blockHash() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBestBlock>) in
					BestBlock_block_hash(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ThirtyTwoBytes(
				cType: nativeCallResult, instantiationContext: "BestBlock.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Returns the best block height.
		public func height() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBestBlock>) in
					BestBlock_height(thisArgPointer)
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


		internal func dangle(_ shouldDangle: Bool = true) -> BestBlock {
			self.dangling = shouldDangle
			return self
		}


		internal func danglingClone() -> BestBlock {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> BestBlock {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> BestBlock {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> BestBlock {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing BestBlock \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing BestBlock \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

