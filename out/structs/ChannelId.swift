#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A unique 32-byte identifier for a channel.
/// Depending on how the ID is generated, several varieties are distinguished
/// (but all are stored as 32 bytes):
/// _v1_ and _temporary_.
/// A _v1_ channel ID is generated based on funding tx outpoint (txid & index).
/// A _temporary_ ID is generated randomly.
/// (Later revocation-point-based _v2_ is a possibility.)
/// The variety (context) is not stored, it is relevant only at creation.
public typealias ChannelId = Bindings.ChannelId

extension Bindings {


	/// A unique 32-byte identifier for a channel.
	/// Depending on how the ID is generated, several varieties are distinguished
	/// (but all are stored as 32 bytes):
	/// _v1_ and _temporary_.
	/// A _v1_ channel ID is generated based on funding tx outpoint (txid & index).
	/// A _temporary_ ID is generated randomly.
	/// (Later revocation-point-based _v2_ is a possibility.)
	/// The variety (context) is not stored, it is relevant only at creation.
	public class ChannelId: NativeTypeWrapper {

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

		internal var cType: LDKChannelId?

		internal init(cType: LDKChannelId, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKChannelId, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKChannelId, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the ChannelId, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ChannelId_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		///
		public func getA() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelId>) in
					ChannelId_get_a(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		///
		public func setA(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ThirtyTwoBytes(
				value: val, instantiationContext: "ChannelId.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelId>) in
					ChannelId_set_a(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new ChannelId given each field
		public class func initWith(aArg: [UInt8]) -> ChannelId {
			// native call variable prep

			let aArgPrimitiveWrapper = ThirtyTwoBytes(
				value: aArg, instantiationContext: "ChannelId.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = ChannelId_new(aArgPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			aArgPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = ChannelId(
				cType: nativeCallResult, instantiationContext: "ChannelId.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a copy of the ChannelId
		internal func clone() -> ChannelId {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKChannelId>) in
					ChannelId_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelId(
				cType: nativeCallResult, instantiationContext: "ChannelId.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two ChannelIds contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: ChannelId, b: ChannelId) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKChannelId>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKChannelId>) in
						ChannelId_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the ChannelId.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKChannelId>) in
					ChannelId_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Create _v1_ channel ID based on a funding TX ID and output index
		public class func initWithV1FromFundingTxid(txid: [UInt8], outputIndex: UInt16) -> ChannelId {
			// native call variable prep

			let tupledTxid = Bindings.arrayToUInt8Tuple32(array: txid)


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: tupledTxid) { (tupledTxidPointer: UnsafePointer<UInt8Tuple32>) in
					ChannelId_v1_from_funding_txid(tupledTxidPointer, outputIndex)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelId(
				cType: nativeCallResult, instantiationContext: "ChannelId.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Create _v1_ channel ID from a funding tx outpoint
		public class func initWithV1FromFundingOutpoint(outpoint: OutPoint) -> ChannelId {
			// native call variable prep


			// native method call
			let nativeCallResult = ChannelId_v1_from_funding_outpoint(outpoint.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelId(
				cType: nativeCallResult, instantiationContext: "ChannelId.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Create a _temporary_ channel ID randomly, based on an entropy source.
		public class func initWithTemporaryFromEntropySource(entropySource: EntropySource) -> ChannelId {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: entropySource.activate().cType!) {
					(entropySourcePointer: UnsafePointer<LDKEntropySource>) in
					ChannelId_temporary_from_entropy_source(entropySourcePointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelId(
				cType: nativeCallResult, instantiationContext: "ChannelId.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generic constructor; create a new channel ID from the provided data.
		/// Use a more specific `*_from_*` constructor when possible.
		public class func initWithBytes(data: [UInt8]) -> ChannelId {
			// native call variable prep

			let dataPrimitiveWrapper = ThirtyTwoBytes(
				value: data, instantiationContext: "ChannelId.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = ChannelId_from_bytes(dataPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			dataPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = ChannelId(
				cType: nativeCallResult, instantiationContext: "ChannelId.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Create a channel ID consisting of all-zeros data (e.g. when uninitialized or a placeholder).
		public class func initWithZero() -> ChannelId {
			// native call variable prep


			// native method call
			let nativeCallResult = ChannelId_new_zero()

			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelId(
				cType: nativeCallResult, instantiationContext: "ChannelId.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Check whether ID is consisting of all zeros (uninitialized)
		public func isZero() -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelId>) in
					ChannelId_is_zero(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Create _v2_ channel ID by concatenating the holder revocation basepoint with the counterparty
		/// revocation basepoint and hashing the result. The basepoints will be concatenated in increasing
		/// sorted order.
		public class func initWithV2FromRevocationBasepoints(ours: RevocationBasepoint, theirs: RevocationBasepoint)
			-> ChannelId
		{
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: ours.cType!) { (oursPointer: UnsafePointer<LDKRevocationBasepoint>) in

					withUnsafePointer(to: theirs.cType!) { (theirsPointer: UnsafePointer<LDKRevocationBasepoint>) in
						ChannelId_v2_from_revocation_basepoints(oursPointer, theirsPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelId(
				cType: nativeCallResult, instantiationContext: "ChannelId.swift::\(#function):\(#line)")


			try! returnValue.addAnchor(anchor: ours)
			try! returnValue.addAnchor(anchor: theirs)
			return returnValue
		}

		/// Create temporary _v2_ channel ID by concatenating a zeroed out basepoint with the holder
		/// revocation basepoint and hashing the result.
		public class func initWithTemporaryV2FromRevocationBasepoint(ourRevocationBasepoint: RevocationBasepoint)
			-> ChannelId
		{
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: ourRevocationBasepoint.cType!) {
					(ourRevocationBasepointPointer: UnsafePointer<LDKRevocationBasepoint>) in
					ChannelId_temporary_v2_from_revocation_basepoint(ourRevocationBasepointPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelId(
				cType: nativeCallResult, instantiationContext: "ChannelId.swift::\(#function):\(#line)")


			try! returnValue.addAnchor(anchor: ourRevocationBasepoint)
			return returnValue
		}

		/// Serialize the ChannelId object into a byte array which can be read by ChannelId_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKChannelId>) in
					ChannelId_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "ChannelId.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a ChannelId from a byte array, created by ChannelId_write
		public class func read(ser: [UInt8]) -> Result_ChannelIdDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "ChannelId.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = ChannelId_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_ChannelIdDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelId.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> ChannelId {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> ChannelId {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> ChannelId {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> ChannelId {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing ChannelId \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ChannelId \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

