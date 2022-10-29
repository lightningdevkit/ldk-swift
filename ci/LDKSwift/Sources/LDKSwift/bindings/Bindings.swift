//
//  Bindings.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 3/23/21.
//

import Foundation
// #if canImport(os)
//     import os
// #endif

#if SWIFT_PACKAGE
import LDKHeaders
#endif

#if os(Linux)
    import Glibc
#else
    import Darwin.C
#endif

public typealias LDKTransactionOutputs = LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ
public typealias TransactionOutputs = C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ
public typealias LDKTxid = LDKThirtyTwoBytes
// public typealias LDKPaymentPreimage = LDKThirtyTwoBytes
public typealias Txid = [UInt8]

open class NativeTypeWrapper: Hashable {

    enum AnchorError: Error {
        case cyclicReference
    }

    private static var globalInstanceCounter: UInt = 0
    internal let globalInstanceNumber: UInt
    internal var dangling = false
    internal private(set) var anchors: Set<NativeTypeWrapper> = []
    internal var pointerDebugDescription: String? = nil

    init(conflictAvoidingVariableName: UInt) {
        Self.globalInstanceCounter += 1
        self.globalInstanceNumber = Self.globalInstanceCounter
    }

    internal func addAnchor(anchor: NativeTypeWrapper) throws {
        if self.hasAnchor(candidate: anchor) {
            throw AnchorError.cyclicReference
        }
        self.anchors.insert(anchor)
    }

    internal func hasAnchor(candidate: NativeTypeWrapper) -> Bool {
		if self.anchors.count == 0 {
			return false
		}
		if self.anchors.contains(candidate) {
			return true
		}
		for currentAnchor in self.anchors {
			if currentAnchor.hasAnchor(candidate: candidate) {
				return true
			}
		}
		return false
	}

    public static func == (lhs: NativeTypeWrapper, rhs: NativeTypeWrapper) -> Bool {
        return (lhs.globalInstanceNumber == rhs.globalInstanceNumber)
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(globalInstanceNumber)
    }

}

open class NativeTraitWrapper: NativeTypeWrapper {

    public func activate() -> Self {
        Bindings.cacheInstance(instance: self)
        return self
    }

    public func activateOnce() -> Self {
        Bindings.cacheInstance(instance: self)
        return self
    }

}

public class Bindings {

	internal static var minimumPrintSeverity: PrintSeverity = .WARNING
	// #if canImport(os)
    //     internal static let logger = os.Logger(subsystem: Bundle.main.bundleIdentifier!, category: "ldk")
    // #endif

    public enum PrintSeverity: UInt {
        case DEBUG = 0
        case WARNING = 1
        case ERROR = 2
    }

    internal class func print(_ string: String, severity: PrintSeverity = .DEBUG) {
        if severity.rawValue >= Self.minimumPrintSeverity.rawValue {

            // Swift.print(string)
			NSLog(string)
			fflush(stdout)

			// if #available(iOS 14.0, *) {
			// 	#if canImport(os)
			// 	if severity == Self.PrintSeverity.DEBUG {
			// 		logger.debug("\(string)")
			// 	}else if severity == Self.PrintSeverity.WARNING {
			// 		logger.warning("\(string)")
			// 	}else if severity == Self.PrintSeverity.ERROR {
			// 		logger.error("\(string)")
			// 	}else {
			// 		logger.log("\(string)")
			// 	}
			// 	#else
			// 	Swift.print(string)
			// 	#endif
			// } else {
			// 	// Fallback on earlier versions
			// 	Swift.print(string)
			// }
        }
    }

    public class func setLogThreshold(severity: PrintSeverity){
        Self.minimumPrintSeverity = severity
    }

	/* BYTE_ARRAY_METHODS_START */

	public class func new_LDKBigEndianScalar(array: [UInt8]) -> LDKBigEndianScalar {
		let byteType = LDKBigEndianScalar(big_endian_bytes: (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31]))
		// let wrapper = LDKBigEndianScalarWrapper(pointer: byteType)
		return byteType
	}

	public class func LDKBigEndianScalar_to_array(nativeType: LDKBigEndianScalar) -> [UInt8] {
		let array = [nativeType.big_endian_bytes.0, nativeType.big_endian_bytes.1, nativeType.big_endian_bytes.2, nativeType.big_endian_bytes.3, nativeType.big_endian_bytes.4, nativeType.big_endian_bytes.5, nativeType.big_endian_bytes.6, nativeType.big_endian_bytes.7, nativeType.big_endian_bytes.8, nativeType.big_endian_bytes.9, nativeType.big_endian_bytes.10, nativeType.big_endian_bytes.11, nativeType.big_endian_bytes.12, nativeType.big_endian_bytes.13, nativeType.big_endian_bytes.14, nativeType.big_endian_bytes.15, nativeType.big_endian_bytes.16, nativeType.big_endian_bytes.17, nativeType.big_endian_bytes.18, nativeType.big_endian_bytes.19, nativeType.big_endian_bytes.20, nativeType.big_endian_bytes.21, nativeType.big_endian_bytes.22, nativeType.big_endian_bytes.23, nativeType.big_endian_bytes.24, nativeType.big_endian_bytes.25, nativeType.big_endian_bytes.26, nativeType.big_endian_bytes.27, nativeType.big_endian_bytes.28, nativeType.big_endian_bytes.29, nativeType.big_endian_bytes.30, nativeType.big_endian_bytes.31]
		return array
	}
	/*
	public class LDKBigEndianScalarWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt
		internal private(set) var dangling = false

		public var cOpaqueStruct: LDKBigEndianScalar?

		public init(pointer: LDKBigEndianScalar){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
		}

		internal func dangle() -> LDKBigEndianScalarWrapper {
			self.dangling = true
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKBigEndianScalarWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.big_endian_bytes.deallocate()
			} else {
				print("Not freeing LDKBigEndianScalarWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
	*/

			public class func array_to_tuple32(array: [UInt8]) -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
				return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31])
			}

			public class func tuple32_to_array(nativeType: (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)) -> [UInt8] {
				let array = [nativeType.0, nativeType.1, nativeType.2, nativeType.3, nativeType.4, nativeType.5, nativeType.6, nativeType.7, nativeType.8, nativeType.9, nativeType.10, nativeType.11, nativeType.12, nativeType.13, nativeType.14, nativeType.15, nativeType.16, nativeType.17, nativeType.18, nativeType.19, nativeType.20, nativeType.21, nativeType.22, nativeType.23, nativeType.24, nativeType.25, nativeType.26, nativeType.27, nativeType.28, nativeType.29, nativeType.30, nativeType.31]
				return array
			}
		

	public class func new_LDKFourBytes(array: [UInt8]) -> LDKFourBytes {
		let byteType = LDKFourBytes(data: (array[0], array[1], array[2], array[3]))
		// let wrapper = LDKFourBytesWrapper(pointer: byteType)
		return byteType
	}

	public class func LDKFourBytes_to_array(nativeType: LDKFourBytes) -> [UInt8] {
		let array = [nativeType.data.0, nativeType.data.1, nativeType.data.2, nativeType.data.3]
		return array
	}
	/*
	public class LDKFourBytesWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt
		internal private(set) var dangling = false

		public var cOpaqueStruct: LDKFourBytes?

		public init(pointer: LDKFourBytes){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
		}

		internal func dangle() -> LDKFourBytesWrapper {
			self.dangling = true
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKFourBytesWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKFourBytesWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
	*/

			public class func array_to_tuple4(array: [UInt8]) -> (UInt8,UInt8,UInt8,UInt8) {
				return (array[0], array[1], array[2], array[3])
			}

			public class func tuple4_to_array(nativeType: (UInt8,UInt8,UInt8,UInt8)) -> [UInt8] {
				let array = [nativeType.0, nativeType.1, nativeType.2, nativeType.3]
				return array
			}
		

	public class func new_LDKPublicKey(array: [UInt8]) -> LDKPublicKey {
		let byteType = LDKPublicKey(compressed_form: (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31], array[32]))
		// let wrapper = LDKPublicKeyWrapper(pointer: byteType)
		return byteType
	}

	public class func LDKPublicKey_to_array(nativeType: LDKPublicKey) -> [UInt8] {
		let array = [nativeType.compressed_form.0, nativeType.compressed_form.1, nativeType.compressed_form.2, nativeType.compressed_form.3, nativeType.compressed_form.4, nativeType.compressed_form.5, nativeType.compressed_form.6, nativeType.compressed_form.7, nativeType.compressed_form.8, nativeType.compressed_form.9, nativeType.compressed_form.10, nativeType.compressed_form.11, nativeType.compressed_form.12, nativeType.compressed_form.13, nativeType.compressed_form.14, nativeType.compressed_form.15, nativeType.compressed_form.16, nativeType.compressed_form.17, nativeType.compressed_form.18, nativeType.compressed_form.19, nativeType.compressed_form.20, nativeType.compressed_form.21, nativeType.compressed_form.22, nativeType.compressed_form.23, nativeType.compressed_form.24, nativeType.compressed_form.25, nativeType.compressed_form.26, nativeType.compressed_form.27, nativeType.compressed_form.28, nativeType.compressed_form.29, nativeType.compressed_form.30, nativeType.compressed_form.31, nativeType.compressed_form.32]
		return array
	}
	/*
	public class LDKPublicKeyWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt
		internal private(set) var dangling = false

		public var cOpaqueStruct: LDKPublicKey?

		public init(pointer: LDKPublicKey){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
		}

		internal func dangle() -> LDKPublicKeyWrapper {
			self.dangling = true
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKPublicKeyWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.compressed_form.deallocate()
			} else {
				print("Not freeing LDKPublicKeyWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
	*/

			public class func array_to_tuple33(array: [UInt8]) -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
				return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31], array[32])
			}

			public class func tuple33_to_array(nativeType: (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)) -> [UInt8] {
				let array = [nativeType.0, nativeType.1, nativeType.2, nativeType.3, nativeType.4, nativeType.5, nativeType.6, nativeType.7, nativeType.8, nativeType.9, nativeType.10, nativeType.11, nativeType.12, nativeType.13, nativeType.14, nativeType.15, nativeType.16, nativeType.17, nativeType.18, nativeType.19, nativeType.20, nativeType.21, nativeType.22, nativeType.23, nativeType.24, nativeType.25, nativeType.26, nativeType.27, nativeType.28, nativeType.29, nativeType.30, nativeType.31, nativeType.32]
				return array
			}
		

	public class func new_LDKRecoverableSignature(array: [UInt8]) -> LDKRecoverableSignature {
		let byteType = LDKRecoverableSignature(serialized_form: (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31], array[32], array[33], array[34], array[35], array[36], array[37], array[38], array[39], array[40], array[41], array[42], array[43], array[44], array[45], array[46], array[47], array[48], array[49], array[50], array[51], array[52], array[53], array[54], array[55], array[56], array[57], array[58], array[59], array[60], array[61], array[62], array[63], array[64], array[65], array[66], array[67]))
		// let wrapper = LDKRecoverableSignatureWrapper(pointer: byteType)
		return byteType
	}

	public class func LDKRecoverableSignature_to_array(nativeType: LDKRecoverableSignature) -> [UInt8] {
		let array = [nativeType.serialized_form.0, nativeType.serialized_form.1, nativeType.serialized_form.2, nativeType.serialized_form.3, nativeType.serialized_form.4, nativeType.serialized_form.5, nativeType.serialized_form.6, nativeType.serialized_form.7, nativeType.serialized_form.8, nativeType.serialized_form.9, nativeType.serialized_form.10, nativeType.serialized_form.11, nativeType.serialized_form.12, nativeType.serialized_form.13, nativeType.serialized_form.14, nativeType.serialized_form.15, nativeType.serialized_form.16, nativeType.serialized_form.17, nativeType.serialized_form.18, nativeType.serialized_form.19, nativeType.serialized_form.20, nativeType.serialized_form.21, nativeType.serialized_form.22, nativeType.serialized_form.23, nativeType.serialized_form.24, nativeType.serialized_form.25, nativeType.serialized_form.26, nativeType.serialized_form.27, nativeType.serialized_form.28, nativeType.serialized_form.29, nativeType.serialized_form.30, nativeType.serialized_form.31, nativeType.serialized_form.32, nativeType.serialized_form.33, nativeType.serialized_form.34, nativeType.serialized_form.35, nativeType.serialized_form.36, nativeType.serialized_form.37, nativeType.serialized_form.38, nativeType.serialized_form.39, nativeType.serialized_form.40, nativeType.serialized_form.41, nativeType.serialized_form.42, nativeType.serialized_form.43, nativeType.serialized_form.44, nativeType.serialized_form.45, nativeType.serialized_form.46, nativeType.serialized_form.47, nativeType.serialized_form.48, nativeType.serialized_form.49, nativeType.serialized_form.50, nativeType.serialized_form.51, nativeType.serialized_form.52, nativeType.serialized_form.53, nativeType.serialized_form.54, nativeType.serialized_form.55, nativeType.serialized_form.56, nativeType.serialized_form.57, nativeType.serialized_form.58, nativeType.serialized_form.59, nativeType.serialized_form.60, nativeType.serialized_form.61, nativeType.serialized_form.62, nativeType.serialized_form.63, nativeType.serialized_form.64, nativeType.serialized_form.65, nativeType.serialized_form.66, nativeType.serialized_form.67]
		return array
	}
	/*
	public class LDKRecoverableSignatureWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt
		internal private(set) var dangling = false

		public var cOpaqueStruct: LDKRecoverableSignature?

		public init(pointer: LDKRecoverableSignature){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
		}

		internal func dangle() -> LDKRecoverableSignatureWrapper {
			self.dangling = true
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKRecoverableSignatureWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.serialized_form.deallocate()
			} else {
				print("Not freeing LDKRecoverableSignatureWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
	*/

			public class func array_to_tuple68(array: [UInt8]) -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
				return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31], array[32], array[33], array[34], array[35], array[36], array[37], array[38], array[39], array[40], array[41], array[42], array[43], array[44], array[45], array[46], array[47], array[48], array[49], array[50], array[51], array[52], array[53], array[54], array[55], array[56], array[57], array[58], array[59], array[60], array[61], array[62], array[63], array[64], array[65], array[66], array[67])
			}

			public class func tuple68_to_array(nativeType: (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)) -> [UInt8] {
				let array = [nativeType.0, nativeType.1, nativeType.2, nativeType.3, nativeType.4, nativeType.5, nativeType.6, nativeType.7, nativeType.8, nativeType.9, nativeType.10, nativeType.11, nativeType.12, nativeType.13, nativeType.14, nativeType.15, nativeType.16, nativeType.17, nativeType.18, nativeType.19, nativeType.20, nativeType.21, nativeType.22, nativeType.23, nativeType.24, nativeType.25, nativeType.26, nativeType.27, nativeType.28, nativeType.29, nativeType.30, nativeType.31, nativeType.32, nativeType.33, nativeType.34, nativeType.35, nativeType.36, nativeType.37, nativeType.38, nativeType.39, nativeType.40, nativeType.41, nativeType.42, nativeType.43, nativeType.44, nativeType.45, nativeType.46, nativeType.47, nativeType.48, nativeType.49, nativeType.50, nativeType.51, nativeType.52, nativeType.53, nativeType.54, nativeType.55, nativeType.56, nativeType.57, nativeType.58, nativeType.59, nativeType.60, nativeType.61, nativeType.62, nativeType.63, nativeType.64, nativeType.65, nativeType.66, nativeType.67]
				return array
			}
		

	public class func new_LDKSecretKey(array: [UInt8]) -> LDKSecretKey {
		let byteType = LDKSecretKey(bytes: (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31]))
		// let wrapper = LDKSecretKeyWrapper(pointer: byteType)
		return byteType
	}

	public class func LDKSecretKey_to_array(nativeType: LDKSecretKey) -> [UInt8] {
		let array = [nativeType.bytes.0, nativeType.bytes.1, nativeType.bytes.2, nativeType.bytes.3, nativeType.bytes.4, nativeType.bytes.5, nativeType.bytes.6, nativeType.bytes.7, nativeType.bytes.8, nativeType.bytes.9, nativeType.bytes.10, nativeType.bytes.11, nativeType.bytes.12, nativeType.bytes.13, nativeType.bytes.14, nativeType.bytes.15, nativeType.bytes.16, nativeType.bytes.17, nativeType.bytes.18, nativeType.bytes.19, nativeType.bytes.20, nativeType.bytes.21, nativeType.bytes.22, nativeType.bytes.23, nativeType.bytes.24, nativeType.bytes.25, nativeType.bytes.26, nativeType.bytes.27, nativeType.bytes.28, nativeType.bytes.29, nativeType.bytes.30, nativeType.bytes.31]
		return array
	}
	/*
	public class LDKSecretKeyWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt
		internal private(set) var dangling = false

		public var cOpaqueStruct: LDKSecretKey?

		public init(pointer: LDKSecretKey){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
		}

		internal func dangle() -> LDKSecretKeyWrapper {
			self.dangling = true
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKSecretKeyWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.bytes.deallocate()
			} else {
				print("Not freeing LDKSecretKeyWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
	*/

	public class func new_LDKSignature(array: [UInt8]) -> LDKSignature {
		let byteType = LDKSignature(compact_form: (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31], array[32], array[33], array[34], array[35], array[36], array[37], array[38], array[39], array[40], array[41], array[42], array[43], array[44], array[45], array[46], array[47], array[48], array[49], array[50], array[51], array[52], array[53], array[54], array[55], array[56], array[57], array[58], array[59], array[60], array[61], array[62], array[63]))
		// let wrapper = LDKSignatureWrapper(pointer: byteType)
		return byteType
	}

	public class func LDKSignature_to_array(nativeType: LDKSignature) -> [UInt8] {
		let array = [nativeType.compact_form.0, nativeType.compact_form.1, nativeType.compact_form.2, nativeType.compact_form.3, nativeType.compact_form.4, nativeType.compact_form.5, nativeType.compact_form.6, nativeType.compact_form.7, nativeType.compact_form.8, nativeType.compact_form.9, nativeType.compact_form.10, nativeType.compact_form.11, nativeType.compact_form.12, nativeType.compact_form.13, nativeType.compact_form.14, nativeType.compact_form.15, nativeType.compact_form.16, nativeType.compact_form.17, nativeType.compact_form.18, nativeType.compact_form.19, nativeType.compact_form.20, nativeType.compact_form.21, nativeType.compact_form.22, nativeType.compact_form.23, nativeType.compact_form.24, nativeType.compact_form.25, nativeType.compact_form.26, nativeType.compact_form.27, nativeType.compact_form.28, nativeType.compact_form.29, nativeType.compact_form.30, nativeType.compact_form.31, nativeType.compact_form.32, nativeType.compact_form.33, nativeType.compact_form.34, nativeType.compact_form.35, nativeType.compact_form.36, nativeType.compact_form.37, nativeType.compact_form.38, nativeType.compact_form.39, nativeType.compact_form.40, nativeType.compact_form.41, nativeType.compact_form.42, nativeType.compact_form.43, nativeType.compact_form.44, nativeType.compact_form.45, nativeType.compact_form.46, nativeType.compact_form.47, nativeType.compact_form.48, nativeType.compact_form.49, nativeType.compact_form.50, nativeType.compact_form.51, nativeType.compact_form.52, nativeType.compact_form.53, nativeType.compact_form.54, nativeType.compact_form.55, nativeType.compact_form.56, nativeType.compact_form.57, nativeType.compact_form.58, nativeType.compact_form.59, nativeType.compact_form.60, nativeType.compact_form.61, nativeType.compact_form.62, nativeType.compact_form.63]
		return array
	}
	/*
	public class LDKSignatureWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt
		internal private(set) var dangling = false

		public var cOpaqueStruct: LDKSignature?

		public init(pointer: LDKSignature){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
		}

		internal func dangle() -> LDKSignatureWrapper {
			self.dangling = true
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKSignatureWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.compact_form.deallocate()
			} else {
				print("Not freeing LDKSignatureWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
	*/

			public class func array_to_tuple64(array: [UInt8]) -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
				return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31], array[32], array[33], array[34], array[35], array[36], array[37], array[38], array[39], array[40], array[41], array[42], array[43], array[44], array[45], array[46], array[47], array[48], array[49], array[50], array[51], array[52], array[53], array[54], array[55], array[56], array[57], array[58], array[59], array[60], array[61], array[62], array[63])
			}

			public class func tuple64_to_array(nativeType: (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)) -> [UInt8] {
				let array = [nativeType.0, nativeType.1, nativeType.2, nativeType.3, nativeType.4, nativeType.5, nativeType.6, nativeType.7, nativeType.8, nativeType.9, nativeType.10, nativeType.11, nativeType.12, nativeType.13, nativeType.14, nativeType.15, nativeType.16, nativeType.17, nativeType.18, nativeType.19, nativeType.20, nativeType.21, nativeType.22, nativeType.23, nativeType.24, nativeType.25, nativeType.26, nativeType.27, nativeType.28, nativeType.29, nativeType.30, nativeType.31, nativeType.32, nativeType.33, nativeType.34, nativeType.35, nativeType.36, nativeType.37, nativeType.38, nativeType.39, nativeType.40, nativeType.41, nativeType.42, nativeType.43, nativeType.44, nativeType.45, nativeType.46, nativeType.47, nativeType.48, nativeType.49, nativeType.50, nativeType.51, nativeType.52, nativeType.53, nativeType.54, nativeType.55, nativeType.56, nativeType.57, nativeType.58, nativeType.59, nativeType.60, nativeType.61, nativeType.62, nativeType.63]
				return array
			}
		

	public class func new_LDKSixteenBytes(array: [UInt8]) -> LDKSixteenBytes {
		let byteType = LDKSixteenBytes(data: (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15]))
		// let wrapper = LDKSixteenBytesWrapper(pointer: byteType)
		return byteType
	}

	public class func LDKSixteenBytes_to_array(nativeType: LDKSixteenBytes) -> [UInt8] {
		let array = [nativeType.data.0, nativeType.data.1, nativeType.data.2, nativeType.data.3, nativeType.data.4, nativeType.data.5, nativeType.data.6, nativeType.data.7, nativeType.data.8, nativeType.data.9, nativeType.data.10, nativeType.data.11, nativeType.data.12, nativeType.data.13, nativeType.data.14, nativeType.data.15]
		return array
	}
	/*
	public class LDKSixteenBytesWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt
		internal private(set) var dangling = false

		public var cOpaqueStruct: LDKSixteenBytes?

		public init(pointer: LDKSixteenBytes){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
		}

		internal func dangle() -> LDKSixteenBytesWrapper {
			self.dangling = true
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKSixteenBytesWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKSixteenBytesWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
	*/

			public class func array_to_tuple16(array: [UInt8]) -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
				return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15])
			}

			public class func tuple16_to_array(nativeType: (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)) -> [UInt8] {
				let array = [nativeType.0, nativeType.1, nativeType.2, nativeType.3, nativeType.4, nativeType.5, nativeType.6, nativeType.7, nativeType.8, nativeType.9, nativeType.10, nativeType.11, nativeType.12, nativeType.13, nativeType.14, nativeType.15]
				return array
			}
		

	public class func new_LDKThirtyTwoBytes(array: [UInt8]) -> LDKThirtyTwoBytes {
		let byteType = LDKThirtyTwoBytes(data: (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31]))
		// let wrapper = LDKThirtyTwoBytesWrapper(pointer: byteType)
		return byteType
	}

	public class func LDKThirtyTwoBytes_to_array(nativeType: LDKThirtyTwoBytes) -> [UInt8] {
		let array = [nativeType.data.0, nativeType.data.1, nativeType.data.2, nativeType.data.3, nativeType.data.4, nativeType.data.5, nativeType.data.6, nativeType.data.7, nativeType.data.8, nativeType.data.9, nativeType.data.10, nativeType.data.11, nativeType.data.12, nativeType.data.13, nativeType.data.14, nativeType.data.15, nativeType.data.16, nativeType.data.17, nativeType.data.18, nativeType.data.19, nativeType.data.20, nativeType.data.21, nativeType.data.22, nativeType.data.23, nativeType.data.24, nativeType.data.25, nativeType.data.26, nativeType.data.27, nativeType.data.28, nativeType.data.29, nativeType.data.30, nativeType.data.31]
		return array
	}
	/*
	public class LDKThirtyTwoBytesWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt
		internal private(set) var dangling = false

		public var cOpaqueStruct: LDKThirtyTwoBytes?

		public init(pointer: LDKThirtyTwoBytes){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
		}

		internal func dangle() -> LDKThirtyTwoBytesWrapper {
			self.dangling = true
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKThirtyTwoBytesWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKThirtyTwoBytesWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
	*/

	public class func new_LDKThreeBytes(array: [UInt8]) -> LDKThreeBytes {
		let byteType = LDKThreeBytes(data: (array[0], array[1], array[2]))
		// let wrapper = LDKThreeBytesWrapper(pointer: byteType)
		return byteType
	}

	public class func LDKThreeBytes_to_array(nativeType: LDKThreeBytes) -> [UInt8] {
		let array = [nativeType.data.0, nativeType.data.1, nativeType.data.2]
		return array
	}
	/*
	public class LDKThreeBytesWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt
		internal private(set) var dangling = false

		public var cOpaqueStruct: LDKThreeBytes?

		public init(pointer: LDKThreeBytes){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
		}

		internal func dangle() -> LDKThreeBytesWrapper {
			self.dangling = true
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKThreeBytesWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKThreeBytesWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
	*/

			public class func array_to_tuple3(array: [UInt8]) -> (UInt8,UInt8,UInt8) {
				return (array[0], array[1], array[2])
			}

			public class func tuple3_to_array(nativeType: (UInt8,UInt8,UInt8)) -> [UInt8] {
				let array = [nativeType.0, nativeType.1, nativeType.2]
				return array
			}
		

	public class func new_LDKTwelveBytes(array: [UInt8]) -> LDKTwelveBytes {
		let byteType = LDKTwelveBytes(data: (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11]))
		// let wrapper = LDKTwelveBytesWrapper(pointer: byteType)
		return byteType
	}

	public class func LDKTwelveBytes_to_array(nativeType: LDKTwelveBytes) -> [UInt8] {
		let array = [nativeType.data.0, nativeType.data.1, nativeType.data.2, nativeType.data.3, nativeType.data.4, nativeType.data.5, nativeType.data.6, nativeType.data.7, nativeType.data.8, nativeType.data.9, nativeType.data.10, nativeType.data.11]
		return array
	}
	/*
	public class LDKTwelveBytesWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt
		internal private(set) var dangling = false

		public var cOpaqueStruct: LDKTwelveBytes?

		public init(pointer: LDKTwelveBytes){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
		}

		internal func dangle() -> LDKTwelveBytesWrapper {
			self.dangling = true
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKTwelveBytesWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKTwelveBytesWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
	*/

			public class func array_to_tuple12(array: [UInt8]) -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
				return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11])
			}

			public class func tuple12_to_array(nativeType: (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)) -> [UInt8] {
				let array = [nativeType.0, nativeType.1, nativeType.2, nativeType.3, nativeType.4, nativeType.5, nativeType.6, nativeType.7, nativeType.8, nativeType.9, nativeType.10, nativeType.11]
				return array
			}
		

	public class func new_LDKTwentyBytes(array: [UInt8]) -> LDKTwentyBytes {
		let byteType = LDKTwentyBytes(data: (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19]))
		// let wrapper = LDKTwentyBytesWrapper(pointer: byteType)
		return byteType
	}

	public class func LDKTwentyBytes_to_array(nativeType: LDKTwentyBytes) -> [UInt8] {
		let array = [nativeType.data.0, nativeType.data.1, nativeType.data.2, nativeType.data.3, nativeType.data.4, nativeType.data.5, nativeType.data.6, nativeType.data.7, nativeType.data.8, nativeType.data.9, nativeType.data.10, nativeType.data.11, nativeType.data.12, nativeType.data.13, nativeType.data.14, nativeType.data.15, nativeType.data.16, nativeType.data.17, nativeType.data.18, nativeType.data.19]
		return array
	}
	/*
	public class LDKTwentyBytesWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt
		internal private(set) var dangling = false

		public var cOpaqueStruct: LDKTwentyBytes?

		public init(pointer: LDKTwentyBytes){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
		}

		internal func dangle() -> LDKTwentyBytesWrapper {
			self.dangling = true
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKTwentyBytesWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKTwentyBytesWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
	*/

			public class func array_to_tuple20(array: [UInt8]) -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
				return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19])
			}

			public class func tuple20_to_array(nativeType: (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)) -> [UInt8] {
				let array = [nativeType.0, nativeType.1, nativeType.2, nativeType.3, nativeType.4, nativeType.5, nativeType.6, nativeType.7, nativeType.8, nativeType.9, nativeType.10, nativeType.11, nativeType.12, nativeType.13, nativeType.14, nativeType.15, nativeType.16, nativeType.17, nativeType.18, nativeType.19]
				return array
			}
		

	public class func new_LDKWitnessVersion(array: UInt8) -> LDKWitnessVersion {
		let byteType = LDKWitnessVersion(_0: array)
		// let wrapper = LDKWitnessVersionWrapper(pointer: byteType)
		return byteType
	}

	public class func LDKWitnessVersion_to_array(nativeType: LDKWitnessVersion) -> UInt8 {
		let array = nativeType._0
		return array
	}
	/*
	public class LDKWitnessVersionWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt
		internal private(set) var dangling = false

		public var cOpaqueStruct: LDKWitnessVersion?

		public init(pointer: LDKWitnessVersion){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
		}

		internal func dangle() -> LDKWitnessVersionWrapper {
			self.dangling = true
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKWitnessVersionWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!._0.deallocate()
			} else {
				print("Not freeing LDKWitnessVersionWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
	*/

	public class func new_LDKu5(array: UInt8) -> LDKu5 {
		let byteType = LDKu5(_0: array)
		// let wrapper = LDKu5Wrapper(pointer: byteType)
		return byteType
	}

	public class func LDKu5_to_array(nativeType: LDKu5) -> UInt8 {
		let array = nativeType._0
		return array
	}
	/*
	public class LDKu5Wrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt
		internal private(set) var dangling = false

		public var cOpaqueStruct: LDKu5?

		public init(pointer: LDKu5){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
		}

		internal func dangle() -> LDKu5Wrapper {
			self.dangling = true
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKu5Wrapper \(self.instanceNumber).")
				self.cOpaqueStruct!._0.deallocate()
			} else {
				print("Not freeing LDKu5Wrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
	*/

			public class func array_to_tuple80(array: [UInt8]) -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
				return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31], array[32], array[33], array[34], array[35], array[36], array[37], array[38], array[39], array[40], array[41], array[42], array[43], array[44], array[45], array[46], array[47], array[48], array[49], array[50], array[51], array[52], array[53], array[54], array[55], array[56], array[57], array[58], array[59], array[60], array[61], array[62], array[63], array[64], array[65], array[66], array[67], array[68], array[69], array[70], array[71], array[72], array[73], array[74], array[75], array[76], array[77], array[78], array[79])
			}

			public class func tuple80_to_array(nativeType: (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)) -> [UInt8] {
				let array = [nativeType.0, nativeType.1, nativeType.2, nativeType.3, nativeType.4, nativeType.5, nativeType.6, nativeType.7, nativeType.8, nativeType.9, nativeType.10, nativeType.11, nativeType.12, nativeType.13, nativeType.14, nativeType.15, nativeType.16, nativeType.17, nativeType.18, nativeType.19, nativeType.20, nativeType.21, nativeType.22, nativeType.23, nativeType.24, nativeType.25, nativeType.26, nativeType.27, nativeType.28, nativeType.29, nativeType.30, nativeType.31, nativeType.32, nativeType.33, nativeType.34, nativeType.35, nativeType.36, nativeType.37, nativeType.38, nativeType.39, nativeType.40, nativeType.41, nativeType.42, nativeType.43, nativeType.44, nativeType.45, nativeType.46, nativeType.47, nativeType.48, nativeType.49, nativeType.50, nativeType.51, nativeType.52, nativeType.53, nativeType.54, nativeType.55, nativeType.56, nativeType.57, nativeType.58, nativeType.59, nativeType.60, nativeType.61, nativeType.62, nativeType.63, nativeType.64, nativeType.65, nativeType.66, nativeType.67, nativeType.68, nativeType.69, nativeType.70, nativeType.71, nativeType.72, nativeType.73, nativeType.74, nativeType.75, nativeType.76, nativeType.77, nativeType.78, nativeType.79]
				return array
			}
		

	/* BYTE_ARRAY_METHODS_END */

	/* VECTOR_METHODS_START */

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_APIErrorZWrapper(array: [LDKAPIError]) -> LDKCVec_APIErrorZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKAPIError>) -> UnsafeMutablePointer<LDKAPIError> in
            let mutablePointer = UnsafeMutablePointer<LDKAPIError>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKAPIError>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_APIErrorZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_APIErrorZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_APIErrorZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_APIErrorZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_APIErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_APIErrorZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_APIErrorZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_APIErrorZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_APIErrorZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_APIErrorZ_to_array(nativeType: LDKCVec_APIErrorZ, callerContext: String, deallocate: Bool = true) -> [LDKAPIError] {
		var array = [LDKAPIError]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in APIError_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_APIErrorZ (called from \(callerContext))")
						CVec_APIErrorZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKAPIErrorArray(array: [APIError]) -> [LDKAPIError] {
							return array.map { entry -> LDKAPIError in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKAPIErrorArray(array: [LDKAPIError]) -> [APIError] {
							return array.map { entry -> APIError in
								APIError(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKAPIErrorArray(array: [LDKAPIError]) -> [APIError] {
							return array.map { entry -> APIError in
								APIError(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKAPIErrorArray(array: [LDKAPIError]) -> [LDKAPIError] {
								return array.map { entry -> LDKAPIError in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									APIError(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_BalanceZWrapper(array: [LDKBalance]) -> LDKCVec_BalanceZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKBalance>) -> UnsafeMutablePointer<LDKBalance> in
            let mutablePointer = UnsafeMutablePointer<LDKBalance>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKBalance>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_BalanceZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_BalanceZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_BalanceZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_BalanceZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_BalanceZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_BalanceZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_BalanceZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_BalanceZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_BalanceZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_BalanceZ_to_array(nativeType: LDKCVec_BalanceZ, callerContext: String, deallocate: Bool = true) -> [LDKBalance] {
		var array = [LDKBalance]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in Balance_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_BalanceZ (called from \(callerContext))")
						CVec_BalanceZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKBalanceArray(array: [Balance]) -> [LDKBalance] {
							return array.map { entry -> LDKBalance in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKBalanceArray(array: [LDKBalance]) -> [Balance] {
							return array.map { entry -> Balance in
								Balance(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKBalanceArray(array: [LDKBalance]) -> [Balance] {
							return array.map { entry -> Balance in
								Balance(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKBalanceArray(array: [LDKBalance]) -> [LDKBalance] {
								return array.map { entry -> LDKBalance in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									Balance(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_C2Tuple_BlockHashChannelMonitorZZWrapper(array: [LDKC2Tuple_BlockHashChannelMonitorZ]) -> LDKCVec_C2Tuple_BlockHashChannelMonitorZZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKC2Tuple_BlockHashChannelMonitorZ>) -> UnsafeMutablePointer<LDKC2Tuple_BlockHashChannelMonitorZ> in
            let mutablePointer = UnsafeMutablePointer<LDKC2Tuple_BlockHashChannelMonitorZ>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKC2Tuple_BlockHashChannelMonitorZ>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_C2Tuple_BlockHashChannelMonitorZZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_C2Tuple_BlockHashChannelMonitorZZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_C2Tuple_BlockHashChannelMonitorZZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_C2Tuple_BlockHashChannelMonitorZZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_C2Tuple_BlockHashChannelMonitorZZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_C2Tuple_BlockHashChannelMonitorZZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_C2Tuple_BlockHashChannelMonitorZZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_C2Tuple_BlockHashChannelMonitorZZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_C2Tuple_BlockHashChannelMonitorZZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_C2Tuple_BlockHashChannelMonitorZZ_to_array(nativeType: LDKCVec_C2Tuple_BlockHashChannelMonitorZZ, callerContext: String, deallocate: Bool = true) -> [LDKC2Tuple_BlockHashChannelMonitorZ] {
		var array = [LDKC2Tuple_BlockHashChannelMonitorZ]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in C2Tuple_BlockHashChannelMonitorZ_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_C2Tuple_BlockHashChannelMonitorZZ (called from \(callerContext))")
						CVec_C2Tuple_BlockHashChannelMonitorZZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKC2Tuple_BlockHashChannelMonitorZArray(array: [C2Tuple_BlockHashChannelMonitorZ]) -> [LDKC2Tuple_BlockHashChannelMonitorZ] {
							return array.map { entry -> LDKC2Tuple_BlockHashChannelMonitorZ in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKC2Tuple_BlockHashChannelMonitorZArray(array: [LDKC2Tuple_BlockHashChannelMonitorZ]) -> [C2Tuple_BlockHashChannelMonitorZ] {
							return array.map { entry -> C2Tuple_BlockHashChannelMonitorZ in
								C2Tuple_BlockHashChannelMonitorZ(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKC2Tuple_BlockHashChannelMonitorZArray(array: [LDKC2Tuple_BlockHashChannelMonitorZ]) -> [C2Tuple_BlockHashChannelMonitorZ] {
							return array.map { entry -> C2Tuple_BlockHashChannelMonitorZ in
								C2Tuple_BlockHashChannelMonitorZ(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKC2Tuple_BlockHashChannelMonitorZArray(array: [LDKC2Tuple_BlockHashChannelMonitorZ]) -> [LDKC2Tuple_BlockHashChannelMonitorZ] {
								return array.map { entry -> LDKC2Tuple_BlockHashChannelMonitorZ in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									C2Tuple_BlockHashChannelMonitorZ(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_C2Tuple_PublicKeyTypeZZWrapper(array: [LDKC2Tuple_PublicKeyTypeZ]) -> LDKCVec_C2Tuple_PublicKeyTypeZZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKC2Tuple_PublicKeyTypeZ>) -> UnsafeMutablePointer<LDKC2Tuple_PublicKeyTypeZ> in
            let mutablePointer = UnsafeMutablePointer<LDKC2Tuple_PublicKeyTypeZ>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKC2Tuple_PublicKeyTypeZ>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_C2Tuple_PublicKeyTypeZZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_C2Tuple_PublicKeyTypeZZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_C2Tuple_PublicKeyTypeZZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_C2Tuple_PublicKeyTypeZZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_C2Tuple_PublicKeyTypeZZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_C2Tuple_PublicKeyTypeZZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_C2Tuple_PublicKeyTypeZZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_C2Tuple_PublicKeyTypeZZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_C2Tuple_PublicKeyTypeZZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_C2Tuple_PublicKeyTypeZZ_to_array(nativeType: LDKCVec_C2Tuple_PublicKeyTypeZZ, callerContext: String, deallocate: Bool = true) -> [LDKC2Tuple_PublicKeyTypeZ] {
		var array = [LDKC2Tuple_PublicKeyTypeZ]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in C2Tuple_PublicKeyTypeZ_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_C2Tuple_PublicKeyTypeZZ (called from \(callerContext))")
						CVec_C2Tuple_PublicKeyTypeZZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKC2Tuple_PublicKeyTypeZArray(array: [C2Tuple_PublicKeyTypeZ]) -> [LDKC2Tuple_PublicKeyTypeZ] {
							return array.map { entry -> LDKC2Tuple_PublicKeyTypeZ in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKC2Tuple_PublicKeyTypeZArray(array: [LDKC2Tuple_PublicKeyTypeZ]) -> [C2Tuple_PublicKeyTypeZ] {
							return array.map { entry -> C2Tuple_PublicKeyTypeZ in
								C2Tuple_PublicKeyTypeZ(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKC2Tuple_PublicKeyTypeZArray(array: [LDKC2Tuple_PublicKeyTypeZ]) -> [C2Tuple_PublicKeyTypeZ] {
							return array.map { entry -> C2Tuple_PublicKeyTypeZ in
								C2Tuple_PublicKeyTypeZ(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKC2Tuple_PublicKeyTypeZArray(array: [LDKC2Tuple_PublicKeyTypeZ]) -> [LDKC2Tuple_PublicKeyTypeZ] {
								return array.map { entry -> LDKC2Tuple_PublicKeyTypeZ in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									C2Tuple_PublicKeyTypeZ(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZWrapper(array: [LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ]) -> LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ>) -> UnsafeMutablePointer<LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ> in
            let mutablePointer = UnsafeMutablePointer<LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ_to_array(nativeType: LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ, callerContext: String, deallocate: Bool = true) -> [LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ] {
		var array = [LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ (called from \(callerContext))")
						CVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZArray(array: [C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ]) -> [LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ] {
							return array.map { entry -> LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZArray(array: [LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ]) -> [C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ] {
							return array.map { entry -> C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ in
								C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZArray(array: [LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ]) -> [C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ] {
							return array.map { entry -> C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ in
								C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZArray(array: [LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ]) -> [LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ] {
								return array.map { entry -> LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_C2Tuple_u32ScriptZZWrapper(array: [LDKC2Tuple_u32ScriptZ]) -> LDKCVec_C2Tuple_u32ScriptZZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKC2Tuple_u32ScriptZ>) -> UnsafeMutablePointer<LDKC2Tuple_u32ScriptZ> in
            let mutablePointer = UnsafeMutablePointer<LDKC2Tuple_u32ScriptZ>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKC2Tuple_u32ScriptZ>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_C2Tuple_u32ScriptZZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_C2Tuple_u32ScriptZZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_C2Tuple_u32ScriptZZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_C2Tuple_u32ScriptZZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_C2Tuple_u32ScriptZZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_C2Tuple_u32ScriptZZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_C2Tuple_u32ScriptZZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_C2Tuple_u32ScriptZZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_C2Tuple_u32ScriptZZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_C2Tuple_u32ScriptZZ_to_array(nativeType: LDKCVec_C2Tuple_u32ScriptZZ, callerContext: String, deallocate: Bool = true) -> [LDKC2Tuple_u32ScriptZ] {
		var array = [LDKC2Tuple_u32ScriptZ]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in C2Tuple_u32ScriptZ_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_C2Tuple_u32ScriptZZ (called from \(callerContext))")
						CVec_C2Tuple_u32ScriptZZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKC2Tuple_u32ScriptZArray(array: [C2Tuple_u32ScriptZ]) -> [LDKC2Tuple_u32ScriptZ] {
							return array.map { entry -> LDKC2Tuple_u32ScriptZ in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKC2Tuple_u32ScriptZArray(array: [LDKC2Tuple_u32ScriptZ]) -> [C2Tuple_u32ScriptZ] {
							return array.map { entry -> C2Tuple_u32ScriptZ in
								C2Tuple_u32ScriptZ(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKC2Tuple_u32ScriptZArray(array: [LDKC2Tuple_u32ScriptZ]) -> [C2Tuple_u32ScriptZ] {
							return array.map { entry -> C2Tuple_u32ScriptZ in
								C2Tuple_u32ScriptZ(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKC2Tuple_u32ScriptZArray(array: [LDKC2Tuple_u32ScriptZ]) -> [LDKC2Tuple_u32ScriptZ] {
								return array.map { entry -> LDKC2Tuple_u32ScriptZ in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									C2Tuple_u32ScriptZ(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_C2Tuple_u32TxOutZZWrapper(array: [LDKC2Tuple_u32TxOutZ]) -> LDKCVec_C2Tuple_u32TxOutZZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKC2Tuple_u32TxOutZ>) -> UnsafeMutablePointer<LDKC2Tuple_u32TxOutZ> in
            let mutablePointer = UnsafeMutablePointer<LDKC2Tuple_u32TxOutZ>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKC2Tuple_u32TxOutZ>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_C2Tuple_u32TxOutZZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_C2Tuple_u32TxOutZZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_C2Tuple_u32TxOutZZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_C2Tuple_u32TxOutZZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_C2Tuple_u32TxOutZZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_C2Tuple_u32TxOutZZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_C2Tuple_u32TxOutZZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_C2Tuple_u32TxOutZZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_C2Tuple_u32TxOutZZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_C2Tuple_u32TxOutZZ_to_array(nativeType: LDKCVec_C2Tuple_u32TxOutZZ, callerContext: String, deallocate: Bool = true) -> [LDKC2Tuple_u32TxOutZ] {
		var array = [LDKC2Tuple_u32TxOutZ]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in C2Tuple_u32TxOutZ_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_C2Tuple_u32TxOutZZ (called from \(callerContext))")
						CVec_C2Tuple_u32TxOutZZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKC2Tuple_u32TxOutZArray(array: [C2Tuple_u32TxOutZ]) -> [LDKC2Tuple_u32TxOutZ] {
							return array.map { entry -> LDKC2Tuple_u32TxOutZ in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKC2Tuple_u32TxOutZArray(array: [LDKC2Tuple_u32TxOutZ]) -> [C2Tuple_u32TxOutZ] {
							return array.map { entry -> C2Tuple_u32TxOutZ in
								C2Tuple_u32TxOutZ(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKC2Tuple_u32TxOutZArray(array: [LDKC2Tuple_u32TxOutZ]) -> [C2Tuple_u32TxOutZ] {
							return array.map { entry -> C2Tuple_u32TxOutZ in
								C2Tuple_u32TxOutZ(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKC2Tuple_u32TxOutZArray(array: [LDKC2Tuple_u32TxOutZ]) -> [LDKC2Tuple_u32TxOutZ] {
								return array.map { entry -> LDKC2Tuple_u32TxOutZ in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									C2Tuple_u32TxOutZ(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_C2Tuple_usizeTransactionZZWrapper(array: [LDKC2Tuple_usizeTransactionZ]) -> LDKCVec_C2Tuple_usizeTransactionZZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKC2Tuple_usizeTransactionZ>) -> UnsafeMutablePointer<LDKC2Tuple_usizeTransactionZ> in
            let mutablePointer = UnsafeMutablePointer<LDKC2Tuple_usizeTransactionZ>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKC2Tuple_usizeTransactionZ>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_C2Tuple_usizeTransactionZZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_C2Tuple_usizeTransactionZZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_C2Tuple_usizeTransactionZZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_C2Tuple_usizeTransactionZZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_C2Tuple_usizeTransactionZZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_C2Tuple_usizeTransactionZZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_C2Tuple_usizeTransactionZZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_C2Tuple_usizeTransactionZZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_C2Tuple_usizeTransactionZZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_C2Tuple_usizeTransactionZZ_to_array(nativeType: LDKCVec_C2Tuple_usizeTransactionZZ, callerContext: String, deallocate: Bool = true) -> [LDKC2Tuple_usizeTransactionZ] {
		var array = [LDKC2Tuple_usizeTransactionZ]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in C2Tuple_usizeTransactionZ_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_C2Tuple_usizeTransactionZZ (called from \(callerContext))")
						CVec_C2Tuple_usizeTransactionZZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKC2Tuple_usizeTransactionZArray(array: [C2Tuple_usizeTransactionZ]) -> [LDKC2Tuple_usizeTransactionZ] {
							return array.map { entry -> LDKC2Tuple_usizeTransactionZ in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKC2Tuple_usizeTransactionZArray(array: [LDKC2Tuple_usizeTransactionZ]) -> [C2Tuple_usizeTransactionZ] {
							return array.map { entry -> C2Tuple_usizeTransactionZ in
								C2Tuple_usizeTransactionZ(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKC2Tuple_usizeTransactionZArray(array: [LDKC2Tuple_usizeTransactionZ]) -> [C2Tuple_usizeTransactionZ] {
							return array.map { entry -> C2Tuple_usizeTransactionZ in
								C2Tuple_usizeTransactionZ(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKC2Tuple_usizeTransactionZArray(array: [LDKC2Tuple_usizeTransactionZ]) -> [LDKC2Tuple_usizeTransactionZ] {
								return array.map { entry -> LDKC2Tuple_usizeTransactionZ in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									C2Tuple_usizeTransactionZ(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZWrapper(array: [LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ]) -> LDKCVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ>) -> UnsafeMutablePointer<LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ> in
            let mutablePointer = UnsafeMutablePointer<LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ_to_array(nativeType: LDKCVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ, callerContext: String, deallocate: Bool = true) -> [LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ] {
		var array = [LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ (called from \(callerContext))")
						CVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZArray(array: [C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ]) -> [LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ] {
							return array.map { entry -> LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZArray(array: [LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ]) -> [C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ] {
							return array.map { entry -> C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ in
								C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZArray(array: [LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ]) -> [C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ] {
							return array.map { entry -> C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ in
								C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZArray(array: [LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ]) -> [LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ] {
								return array.map { entry -> LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_CResult_NoneAPIErrorZZWrapper(array: [LDKCResult_NoneAPIErrorZ]) -> LDKCVec_CResult_NoneAPIErrorZZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKCResult_NoneAPIErrorZ>) -> UnsafeMutablePointer<LDKCResult_NoneAPIErrorZ> in
            let mutablePointer = UnsafeMutablePointer<LDKCResult_NoneAPIErrorZ>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKCResult_NoneAPIErrorZ>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_CResult_NoneAPIErrorZZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_CResult_NoneAPIErrorZZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_CResult_NoneAPIErrorZZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_CResult_NoneAPIErrorZZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_CResult_NoneAPIErrorZZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_CResult_NoneAPIErrorZZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_CResult_NoneAPIErrorZZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_CResult_NoneAPIErrorZZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_CResult_NoneAPIErrorZZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_CResult_NoneAPIErrorZZ_to_array(nativeType: LDKCVec_CResult_NoneAPIErrorZZ, callerContext: String, deallocate: Bool = true) -> [LDKCResult_NoneAPIErrorZ] {
		var array = [LDKCResult_NoneAPIErrorZ]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in CResult_NoneAPIErrorZ_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_CResult_NoneAPIErrorZZ (called from \(callerContext))")
						CVec_CResult_NoneAPIErrorZZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKCResult_NoneAPIErrorZArray(array: [Result_NoneAPIErrorZ]) -> [LDKCResult_NoneAPIErrorZ] {
							return array.map { entry -> LDKCResult_NoneAPIErrorZ in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKCResult_NoneAPIErrorZArray(array: [LDKCResult_NoneAPIErrorZ]) -> [Result_NoneAPIErrorZ] {
							return array.map { entry -> Result_NoneAPIErrorZ in
								Result_NoneAPIErrorZ(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKCResult_NoneAPIErrorZArray(array: [LDKCResult_NoneAPIErrorZ]) -> [Result_NoneAPIErrorZ] {
							return array.map { entry -> Result_NoneAPIErrorZ in
								Result_NoneAPIErrorZ(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKCResult_NoneAPIErrorZArray(array: [LDKCResult_NoneAPIErrorZ]) -> [LDKCResult_NoneAPIErrorZ] {
								return array.map { entry -> LDKCResult_NoneAPIErrorZ in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									Result_NoneAPIErrorZ(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_CVec_RouteHopZZWrapper(array: [[LDKRouteHop]]) -> LDKCVec_CVec_RouteHopZZWrapper {
		
					var lowerDimension = [LDKCVec_RouteHopZ]()
					var subdimensionWrapper = [LDKCVec_RouteHopZWrapper]()
					for currentEntry in array {
						let convertedEntry = Self.new_LDKCVec_RouteHopZWrapper(array: currentEntry)
						lowerDimension.append(convertedEntry.cOpaqueStruct!)
						subdimensionWrapper.append(convertedEntry)
					}
				

		/*
        let dataContainer = lowerDimension.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKCVec_RouteHopZ>) -> UnsafeMutablePointer<LDKCVec_RouteHopZ> in
            let mutablePointer = UnsafeMutablePointer<LDKCVec_RouteHopZ>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKCVec_RouteHopZ>.allocate(capacity: array.count)
		dataContainer.initialize(from: lowerDimension, count: array.count)

        let vector = LDKCVec_CVec_RouteHopZZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_CVec_RouteHopZZWrapper(pointer: vector, subdimensionWrapper: subdimensionWrapper)
        return wrapper
    }

    public class LDKCVec_CVec_RouteHopZZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_CVec_RouteHopZZ?
		internal var subdimensionWrapper: [LDKCVec_RouteHopZWrapper]? = nil

		public init(pointer: LDKCVec_CVec_RouteHopZZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_CVec_RouteHopZZ, subdimensionWrapper: [LDKCVec_RouteHopZWrapper]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_CVec_RouteHopZZWrapper {
			self.dangling = true
			
					if dangleSubdimensions {
						if let wrappers = self.subdimensionWrapper {
							for currentWrapper in wrappers {
								currentWrapper.dangle()
							}
						}
					}
				
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_CVec_RouteHopZZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_CVec_RouteHopZZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_CVec_RouteHopZZ_to_array(nativeType: LDKCVec_CVec_RouteHopZZ, callerContext: String, deallocate: Bool = true) -> [[LDKRouteHop]] {
		var array = [[LDKRouteHop]]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			let convertedEntry = Self.LDKCVec_RouteHopZ_to_array(nativeType: currentEntry, callerContext: "\(callerContext) > LDKCVec_CVec_RouteHopZZ_to_array", deallocate: deallocate)
			array.append(convertedEntry)
		}
		
					if deallocate {
						print("Deallocating LDKCVec_CVec_RouteHopZZ (called from \(callerContext))")
						CVec_CVec_RouteHopZZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_CVec_u8ZZWrapper(array: [[UInt8]]) -> LDKCVec_CVec_u8ZZWrapper {
		
					var lowerDimension = [LDKCVec_u8Z]()
					var subdimensionWrapper = [LDKCVec_u8ZWrapper]()
					for currentEntry in array {
						let convertedEntry = Self.new_LDKCVec_u8ZWrapper(array: currentEntry)
						lowerDimension.append(convertedEntry.cOpaqueStruct!)
						subdimensionWrapper.append(convertedEntry)
					}
				

		/*
        let dataContainer = lowerDimension.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKCVec_u8Z>) -> UnsafeMutablePointer<LDKCVec_u8Z> in
            let mutablePointer = UnsafeMutablePointer<LDKCVec_u8Z>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKCVec_u8Z>.allocate(capacity: array.count)
		dataContainer.initialize(from: lowerDimension, count: array.count)

        let vector = LDKCVec_CVec_u8ZZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_CVec_u8ZZWrapper(pointer: vector, subdimensionWrapper: subdimensionWrapper)
        return wrapper
    }

    public class LDKCVec_CVec_u8ZZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_CVec_u8ZZ?
		internal var subdimensionWrapper: [LDKCVec_u8ZWrapper]? = nil

		public init(pointer: LDKCVec_CVec_u8ZZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_CVec_u8ZZ, subdimensionWrapper: [LDKCVec_u8ZWrapper]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_CVec_u8ZZWrapper {
			self.dangling = true
			
					if dangleSubdimensions {
						if let wrappers = self.subdimensionWrapper {
							for currentWrapper in wrappers {
								currentWrapper.dangle()
							}
						}
					}
				
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_CVec_u8ZZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_CVec_u8ZZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_CVec_u8ZZ_to_array(nativeType: LDKCVec_CVec_u8ZZ, callerContext: String, deallocate: Bool = true) -> [[UInt8]] {
		var array = [[UInt8]]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			let convertedEntry = Self.LDKCVec_u8Z_to_array(nativeType: currentEntry, callerContext: "\(callerContext) > LDKCVec_CVec_u8ZZ_to_array", deallocate: deallocate)
			array.append(convertedEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						print("Deallocating LDKCVec_CVec_u8ZZ (called from \(callerContext))")
						nativeType.data.deallocate()
					} else {
						print("Not deallocating LDKCVec_CVec_u8ZZ (called from \(callerContext))")
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_ChannelDetailsZWrapper(array: [LDKChannelDetails]) -> LDKCVec_ChannelDetailsZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKChannelDetails>) -> UnsafeMutablePointer<LDKChannelDetails> in
            let mutablePointer = UnsafeMutablePointer<LDKChannelDetails>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_ChannelDetailsZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_ChannelDetailsZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_ChannelDetailsZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_ChannelDetailsZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_ChannelDetailsZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_ChannelDetailsZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_ChannelDetailsZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_ChannelDetailsZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_ChannelDetailsZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_ChannelDetailsZ_to_array(nativeType: LDKCVec_ChannelDetailsZ, callerContext: String, deallocate: Bool = true) -> [LDKChannelDetails] {
		var array = [LDKChannelDetails]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in ChannelDetails_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_ChannelDetailsZ (called from \(callerContext))")
						CVec_ChannelDetailsZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKChannelDetailsArray(array: [ChannelDetails]) -> [LDKChannelDetails] {
							return array.map { entry -> LDKChannelDetails in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKChannelDetailsArray(array: [LDKChannelDetails]) -> [ChannelDetails] {
							return array.map { entry -> ChannelDetails in
								ChannelDetails(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKChannelDetailsArray(array: [LDKChannelDetails]) -> [ChannelDetails] {
							return array.map { entry -> ChannelDetails in
								ChannelDetails(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKChannelDetailsArray(array: [LDKChannelDetails]) -> [LDKChannelDetails] {
								return array.map { entry -> LDKChannelDetails in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									ChannelDetails(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_ChannelMonitorZWrapper(array: [LDKChannelMonitor]) -> LDKCVec_ChannelMonitorZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKChannelMonitor>) -> UnsafeMutablePointer<LDKChannelMonitor> in
            let mutablePointer = UnsafeMutablePointer<LDKChannelMonitor>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKChannelMonitor>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_ChannelMonitorZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_ChannelMonitorZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_ChannelMonitorZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_ChannelMonitorZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_ChannelMonitorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_ChannelMonitorZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_ChannelMonitorZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_ChannelMonitorZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_ChannelMonitorZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_ChannelMonitorZ_to_array(nativeType: LDKCVec_ChannelMonitorZ, callerContext: String, deallocate: Bool = true) -> [LDKChannelMonitor] {
		var array = [LDKChannelMonitor]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in ChannelMonitor_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_ChannelMonitorZ (called from \(callerContext))")
						CVec_ChannelMonitorZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKChannelMonitorArray(array: [ChannelMonitor]) -> [LDKChannelMonitor] {
							return array.map { entry -> LDKChannelMonitor in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKChannelMonitorArray(array: [LDKChannelMonitor]) -> [ChannelMonitor] {
							return array.map { entry -> ChannelMonitor in
								ChannelMonitor(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKChannelMonitorArray(array: [LDKChannelMonitor]) -> [ChannelMonitor] {
							return array.map { entry -> ChannelMonitor in
								ChannelMonitor(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKChannelMonitorArray(array: [LDKChannelMonitor]) -> [LDKChannelMonitor] {
								return array.map { entry -> LDKChannelMonitor in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									ChannelMonitor(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_EventZWrapper(array: [LDKEvent]) -> LDKCVec_EventZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKEvent>) -> UnsafeMutablePointer<LDKEvent> in
            let mutablePointer = UnsafeMutablePointer<LDKEvent>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKEvent>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_EventZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_EventZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_EventZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_EventZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_EventZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_EventZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_EventZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_EventZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_EventZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_EventZ_to_array(nativeType: LDKCVec_EventZ, callerContext: String, deallocate: Bool = true) -> [LDKEvent] {
		var array = [LDKEvent]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in Event_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_EventZ (called from \(callerContext))")
						CVec_EventZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKEventArray(array: [Event]) -> [LDKEvent] {
							return array.map { entry -> LDKEvent in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKEventArray(array: [LDKEvent]) -> [Event] {
							return array.map { entry -> Event in
								Event(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKEventArray(array: [LDKEvent]) -> [Event] {
							return array.map { entry -> Event in
								Event(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKEventArray(array: [LDKEvent]) -> [LDKEvent] {
								return array.map { entry -> LDKEvent in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									Event(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_MessageSendEventZWrapper(array: [LDKMessageSendEvent]) -> LDKCVec_MessageSendEventZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKMessageSendEvent>) -> UnsafeMutablePointer<LDKMessageSendEvent> in
            let mutablePointer = UnsafeMutablePointer<LDKMessageSendEvent>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKMessageSendEvent>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_MessageSendEventZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_MessageSendEventZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_MessageSendEventZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_MessageSendEventZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_MessageSendEventZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_MessageSendEventZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_MessageSendEventZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_MessageSendEventZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_MessageSendEventZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_MessageSendEventZ_to_array(nativeType: LDKCVec_MessageSendEventZ, callerContext: String, deallocate: Bool = true) -> [LDKMessageSendEvent] {
		var array = [LDKMessageSendEvent]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in MessageSendEvent_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_MessageSendEventZ (called from \(callerContext))")
						CVec_MessageSendEventZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKMessageSendEventArray(array: [MessageSendEvent]) -> [LDKMessageSendEvent] {
							return array.map { entry -> LDKMessageSendEvent in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKMessageSendEventArray(array: [LDKMessageSendEvent]) -> [MessageSendEvent] {
							return array.map { entry -> MessageSendEvent in
								MessageSendEvent(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKMessageSendEventArray(array: [LDKMessageSendEvent]) -> [MessageSendEvent] {
							return array.map { entry -> MessageSendEvent in
								MessageSendEvent(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKMessageSendEventArray(array: [LDKMessageSendEvent]) -> [LDKMessageSendEvent] {
								return array.map { entry -> LDKMessageSendEvent in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									MessageSendEvent(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_MonitorEventZWrapper(array: [LDKMonitorEvent]) -> LDKCVec_MonitorEventZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKMonitorEvent>) -> UnsafeMutablePointer<LDKMonitorEvent> in
            let mutablePointer = UnsafeMutablePointer<LDKMonitorEvent>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKMonitorEvent>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_MonitorEventZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_MonitorEventZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_MonitorEventZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_MonitorEventZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_MonitorEventZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_MonitorEventZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_MonitorEventZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_MonitorEventZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_MonitorEventZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_MonitorEventZ_to_array(nativeType: LDKCVec_MonitorEventZ, callerContext: String, deallocate: Bool = true) -> [LDKMonitorEvent] {
		var array = [LDKMonitorEvent]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in MonitorEvent_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_MonitorEventZ (called from \(callerContext))")
						CVec_MonitorEventZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKMonitorEventArray(array: [MonitorEvent]) -> [LDKMonitorEvent] {
							return array.map { entry -> LDKMonitorEvent in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKMonitorEventArray(array: [LDKMonitorEvent]) -> [MonitorEvent] {
							return array.map { entry -> MonitorEvent in
								MonitorEvent(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKMonitorEventArray(array: [LDKMonitorEvent]) -> [MonitorEvent] {
							return array.map { entry -> MonitorEvent in
								MonitorEvent(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKMonitorEventArray(array: [LDKMonitorEvent]) -> [LDKMonitorEvent] {
								return array.map { entry -> LDKMonitorEvent in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									MonitorEvent(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_NetAddressZWrapper(array: [LDKNetAddress]) -> LDKCVec_NetAddressZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKNetAddress>) -> UnsafeMutablePointer<LDKNetAddress> in
            let mutablePointer = UnsafeMutablePointer<LDKNetAddress>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKNetAddress>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_NetAddressZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_NetAddressZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_NetAddressZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_NetAddressZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_NetAddressZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_NetAddressZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_NetAddressZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_NetAddressZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_NetAddressZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_NetAddressZ_to_array(nativeType: LDKCVec_NetAddressZ, callerContext: String, deallocate: Bool = true) -> [LDKNetAddress] {
		var array = [LDKNetAddress]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in NetAddress_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_NetAddressZ (called from \(callerContext))")
						CVec_NetAddressZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKNetAddressArray(array: [NetAddress]) -> [LDKNetAddress] {
							return array.map { entry -> LDKNetAddress in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKNetAddressArray(array: [LDKNetAddress]) -> [NetAddress] {
							return array.map { entry -> NetAddress in
								NetAddress(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKNetAddressArray(array: [LDKNetAddress]) -> [NetAddress] {
							return array.map { entry -> NetAddress in
								NetAddress(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKNetAddressArray(array: [LDKNetAddress]) -> [LDKNetAddress] {
								return array.map { entry -> LDKNetAddress in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									NetAddress(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_NodeIdZWrapper(array: [LDKNodeId]) -> LDKCVec_NodeIdZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKNodeId>) -> UnsafeMutablePointer<LDKNodeId> in
            let mutablePointer = UnsafeMutablePointer<LDKNodeId>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKNodeId>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_NodeIdZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_NodeIdZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_NodeIdZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_NodeIdZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_NodeIdZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_NodeIdZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_NodeIdZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_NodeIdZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_NodeIdZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_NodeIdZ_to_array(nativeType: LDKCVec_NodeIdZ, callerContext: String, deallocate: Bool = true) -> [LDKNodeId] {
		var array = [LDKNodeId]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in NodeId_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_NodeIdZ (called from \(callerContext))")
						CVec_NodeIdZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKNodeIdArray(array: [NodeId]) -> [LDKNodeId] {
							return array.map { entry -> LDKNodeId in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKNodeIdArray(array: [LDKNodeId]) -> [NodeId] {
							return array.map { entry -> NodeId in
								NodeId(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKNodeIdArray(array: [LDKNodeId]) -> [NodeId] {
							return array.map { entry -> NodeId in
								NodeId(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKNodeIdArray(array: [LDKNodeId]) -> [LDKNodeId] {
								return array.map { entry -> LDKNodeId in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									NodeId(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_OutPointZWrapper(array: [LDKOutPoint]) -> LDKCVec_OutPointZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKOutPoint>) -> UnsafeMutablePointer<LDKOutPoint> in
            let mutablePointer = UnsafeMutablePointer<LDKOutPoint>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKOutPoint>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_OutPointZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_OutPointZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_OutPointZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_OutPointZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_OutPointZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_OutPointZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_OutPointZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_OutPointZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_OutPointZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_OutPointZ_to_array(nativeType: LDKCVec_OutPointZ, callerContext: String, deallocate: Bool = true) -> [LDKOutPoint] {
		var array = [LDKOutPoint]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in OutPoint_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_OutPointZ (called from \(callerContext))")
						CVec_OutPointZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKOutPointArray(array: [OutPoint]) -> [LDKOutPoint] {
							return array.map { entry -> LDKOutPoint in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKOutPointArray(array: [LDKOutPoint]) -> [OutPoint] {
							return array.map { entry -> OutPoint in
								OutPoint(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKOutPointArray(array: [LDKOutPoint]) -> [OutPoint] {
							return array.map { entry -> OutPoint in
								OutPoint(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKOutPointArray(array: [LDKOutPoint]) -> [LDKOutPoint] {
								return array.map { entry -> LDKOutPoint in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									OutPoint(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_PaymentPreimageZWrapper(array: [[UInt8]]) -> LDKCVec_PaymentPreimageZWrapper {
		
					var lowerDimension = [LDKThirtyTwoBytes]()
					// var subdimensionWrapper = [LDKThirtyTwoBytesWrapper]()
					for currentEntry in array {
						let convertedEntry = Self.new_LDKThirtyTwoBytes(array: currentEntry)
						lowerDimension.append(convertedEntry)
						// subdimensionWrapper.append(convertedEntry)
					}
				

		/*
        let dataContainer = lowerDimension.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKThirtyTwoBytes>) -> UnsafeMutablePointer<LDKThirtyTwoBytes> in
            let mutablePointer = UnsafeMutablePointer<LDKThirtyTwoBytes>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKThirtyTwoBytes>.allocate(capacity: array.count)
		dataContainer.initialize(from: lowerDimension, count: array.count)

        let vector = LDKCVec_PaymentPreimageZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_PaymentPreimageZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_PaymentPreimageZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_PaymentPreimageZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_PaymentPreimageZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_PaymentPreimageZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_PaymentPreimageZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_PaymentPreimageZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_PaymentPreimageZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_PaymentPreimageZ_to_array(nativeType: LDKCVec_PaymentPreimageZ, callerContext: String, deallocate: Bool = true) -> [[UInt8]] {
		var array = [[UInt8]]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			let convertedEntry = Self.LDKThirtyTwoBytes_to_array(nativeType: currentEntry)
			array.append(convertedEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						print("Deallocating LDKCVec_PaymentPreimageZ (called from \(callerContext))")
						nativeType.data.deallocate()
					} else {
						print("Not deallocating LDKCVec_PaymentPreimageZ (called from \(callerContext))")
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_PhantomRouteHintsZWrapper(array: [LDKPhantomRouteHints]) -> LDKCVec_PhantomRouteHintsZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKPhantomRouteHints>) -> UnsafeMutablePointer<LDKPhantomRouteHints> in
            let mutablePointer = UnsafeMutablePointer<LDKPhantomRouteHints>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKPhantomRouteHints>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_PhantomRouteHintsZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_PhantomRouteHintsZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_PhantomRouteHintsZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_PhantomRouteHintsZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_PhantomRouteHintsZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_PhantomRouteHintsZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_PhantomRouteHintsZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_PhantomRouteHintsZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_PhantomRouteHintsZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_PhantomRouteHintsZ_to_array(nativeType: LDKCVec_PhantomRouteHintsZ, callerContext: String, deallocate: Bool = true) -> [LDKPhantomRouteHints] {
		var array = [LDKPhantomRouteHints]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in PhantomRouteHints_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_PhantomRouteHintsZ (called from \(callerContext))")
						CVec_PhantomRouteHintsZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKPhantomRouteHintsArray(array: [PhantomRouteHints]) -> [LDKPhantomRouteHints] {
							return array.map { entry -> LDKPhantomRouteHints in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKPhantomRouteHintsArray(array: [LDKPhantomRouteHints]) -> [PhantomRouteHints] {
							return array.map { entry -> PhantomRouteHints in
								PhantomRouteHints(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKPhantomRouteHintsArray(array: [LDKPhantomRouteHints]) -> [PhantomRouteHints] {
							return array.map { entry -> PhantomRouteHints in
								PhantomRouteHints(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKPhantomRouteHintsArray(array: [LDKPhantomRouteHints]) -> [LDKPhantomRouteHints] {
								return array.map { entry -> LDKPhantomRouteHints in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									PhantomRouteHints(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_PrivateRouteZWrapper(array: [LDKPrivateRoute]) -> LDKCVec_PrivateRouteZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKPrivateRoute>) -> UnsafeMutablePointer<LDKPrivateRoute> in
            let mutablePointer = UnsafeMutablePointer<LDKPrivateRoute>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKPrivateRoute>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_PrivateRouteZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_PrivateRouteZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_PrivateRouteZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_PrivateRouteZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_PrivateRouteZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_PrivateRouteZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_PrivateRouteZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_PrivateRouteZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_PrivateRouteZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_PrivateRouteZ_to_array(nativeType: LDKCVec_PrivateRouteZ, callerContext: String, deallocate: Bool = true) -> [LDKPrivateRoute] {
		var array = [LDKPrivateRoute]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in PrivateRoute_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_PrivateRouteZ (called from \(callerContext))")
						CVec_PrivateRouteZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKPrivateRouteArray(array: [PrivateRoute]) -> [LDKPrivateRoute] {
							return array.map { entry -> LDKPrivateRoute in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKPrivateRouteArray(array: [LDKPrivateRoute]) -> [PrivateRoute] {
							return array.map { entry -> PrivateRoute in
								PrivateRoute(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKPrivateRouteArray(array: [LDKPrivateRoute]) -> [PrivateRoute] {
							return array.map { entry -> PrivateRoute in
								PrivateRoute(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKPrivateRouteArray(array: [LDKPrivateRoute]) -> [LDKPrivateRoute] {
								return array.map { entry -> LDKPrivateRoute in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									PrivateRoute(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_PublicKeyZWrapper(array: [[UInt8]]) -> LDKCVec_PublicKeyZWrapper {
		
					var lowerDimension = [LDKPublicKey]()
					// var subdimensionWrapper = [LDKPublicKeyWrapper]()
					for currentEntry in array {
						let convertedEntry = Self.new_LDKPublicKey(array: currentEntry)
						lowerDimension.append(convertedEntry)
						// subdimensionWrapper.append(convertedEntry)
					}
				

		/*
        let dataContainer = lowerDimension.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKPublicKey>) -> UnsafeMutablePointer<LDKPublicKey> in
            let mutablePointer = UnsafeMutablePointer<LDKPublicKey>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKPublicKey>.allocate(capacity: array.count)
		dataContainer.initialize(from: lowerDimension, count: array.count)

        let vector = LDKCVec_PublicKeyZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_PublicKeyZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_PublicKeyZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_PublicKeyZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_PublicKeyZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_PublicKeyZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_PublicKeyZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_PublicKeyZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_PublicKeyZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_PublicKeyZ_to_array(nativeType: LDKCVec_PublicKeyZ, callerContext: String, deallocate: Bool = true) -> [[UInt8]] {
		var array = [[UInt8]]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			let convertedEntry = Self.LDKPublicKey_to_array(nativeType: currentEntry)
			array.append(convertedEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						print("Deallocating LDKCVec_PublicKeyZ (called from \(callerContext))")
						nativeType.data.deallocate()
					} else {
						print("Not deallocating LDKCVec_PublicKeyZ (called from \(callerContext))")
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_RouteHintHopZWrapper(array: [LDKRouteHintHop]) -> LDKCVec_RouteHintHopZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKRouteHintHop>) -> UnsafeMutablePointer<LDKRouteHintHop> in
            let mutablePointer = UnsafeMutablePointer<LDKRouteHintHop>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKRouteHintHop>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_RouteHintHopZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_RouteHintHopZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_RouteHintHopZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_RouteHintHopZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_RouteHintHopZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_RouteHintHopZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_RouteHintHopZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_RouteHintHopZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_RouteHintHopZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_RouteHintHopZ_to_array(nativeType: LDKCVec_RouteHintHopZ, callerContext: String, deallocate: Bool = true) -> [LDKRouteHintHop] {
		var array = [LDKRouteHintHop]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in RouteHintHop_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_RouteHintHopZ (called from \(callerContext))")
						CVec_RouteHintHopZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKRouteHintHopArray(array: [RouteHintHop]) -> [LDKRouteHintHop] {
							return array.map { entry -> LDKRouteHintHop in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKRouteHintHopArray(array: [LDKRouteHintHop]) -> [RouteHintHop] {
							return array.map { entry -> RouteHintHop in
								RouteHintHop(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKRouteHintHopArray(array: [LDKRouteHintHop]) -> [RouteHintHop] {
							return array.map { entry -> RouteHintHop in
								RouteHintHop(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKRouteHintHopArray(array: [LDKRouteHintHop]) -> [LDKRouteHintHop] {
								return array.map { entry -> LDKRouteHintHop in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									RouteHintHop(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_RouteHintZWrapper(array: [LDKRouteHint]) -> LDKCVec_RouteHintZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKRouteHint>) -> UnsafeMutablePointer<LDKRouteHint> in
            let mutablePointer = UnsafeMutablePointer<LDKRouteHint>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKRouteHint>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_RouteHintZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_RouteHintZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_RouteHintZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_RouteHintZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_RouteHintZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_RouteHintZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_RouteHintZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_RouteHintZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_RouteHintZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_RouteHintZ_to_array(nativeType: LDKCVec_RouteHintZ, callerContext: String, deallocate: Bool = true) -> [LDKRouteHint] {
		var array = [LDKRouteHint]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in RouteHint_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_RouteHintZ (called from \(callerContext))")
						CVec_RouteHintZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKRouteHintArray(array: [RouteHint]) -> [LDKRouteHint] {
							return array.map { entry -> LDKRouteHint in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKRouteHintArray(array: [LDKRouteHint]) -> [RouteHint] {
							return array.map { entry -> RouteHint in
								RouteHint(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKRouteHintArray(array: [LDKRouteHint]) -> [RouteHint] {
							return array.map { entry -> RouteHint in
								RouteHint(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKRouteHintArray(array: [LDKRouteHint]) -> [LDKRouteHint] {
								return array.map { entry -> LDKRouteHint in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									RouteHint(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_RouteHopZWrapper(array: [LDKRouteHop]) -> LDKCVec_RouteHopZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKRouteHop>) -> UnsafeMutablePointer<LDKRouteHop> in
            let mutablePointer = UnsafeMutablePointer<LDKRouteHop>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKRouteHop>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_RouteHopZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_RouteHopZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_RouteHopZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_RouteHopZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_RouteHopZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_RouteHopZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_RouteHopZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_RouteHopZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_RouteHopZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_RouteHopZ_to_array(nativeType: LDKCVec_RouteHopZ, callerContext: String, deallocate: Bool = true) -> [LDKRouteHop] {
		var array = [LDKRouteHop]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in RouteHop_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_RouteHopZ (called from \(callerContext))")
						CVec_RouteHopZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKRouteHopArray(array: [RouteHop]) -> [LDKRouteHop] {
							return array.map { entry -> LDKRouteHop in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKRouteHopArray(array: [LDKRouteHop]) -> [RouteHop] {
							return array.map { entry -> RouteHop in
								RouteHop(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKRouteHopArray(array: [LDKRouteHop]) -> [RouteHop] {
							return array.map { entry -> RouteHop in
								RouteHop(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKRouteHopArray(array: [LDKRouteHop]) -> [LDKRouteHop] {
								return array.map { entry -> LDKRouteHop in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									RouteHop(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_SignatureZWrapper(array: [[UInt8]]) -> LDKCVec_SignatureZWrapper {
		
					var lowerDimension = [LDKSignature]()
					// var subdimensionWrapper = [LDKSignatureWrapper]()
					for currentEntry in array {
						let convertedEntry = Self.new_LDKSignature(array: currentEntry)
						lowerDimension.append(convertedEntry)
						// subdimensionWrapper.append(convertedEntry)
					}
				

		/*
        let dataContainer = lowerDimension.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKSignature>) -> UnsafeMutablePointer<LDKSignature> in
            let mutablePointer = UnsafeMutablePointer<LDKSignature>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKSignature>.allocate(capacity: array.count)
		dataContainer.initialize(from: lowerDimension, count: array.count)

        let vector = LDKCVec_SignatureZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_SignatureZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_SignatureZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_SignatureZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_SignatureZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_SignatureZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_SignatureZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_SignatureZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_SignatureZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_SignatureZ_to_array(nativeType: LDKCVec_SignatureZ, callerContext: String, deallocate: Bool = true) -> [[UInt8]] {
		var array = [[UInt8]]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			let convertedEntry = Self.LDKSignature_to_array(nativeType: currentEntry)
			array.append(convertedEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						print("Deallocating LDKCVec_SignatureZ (called from \(callerContext))")
						nativeType.data.deallocate()
					} else {
						print("Not deallocating LDKCVec_SignatureZ (called from \(callerContext))")
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_SpendableOutputDescriptorZWrapper(array: [LDKSpendableOutputDescriptor]) -> LDKCVec_SpendableOutputDescriptorZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKSpendableOutputDescriptor>) -> UnsafeMutablePointer<LDKSpendableOutputDescriptor> in
            let mutablePointer = UnsafeMutablePointer<LDKSpendableOutputDescriptor>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKSpendableOutputDescriptor>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_SpendableOutputDescriptorZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_SpendableOutputDescriptorZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_SpendableOutputDescriptorZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_SpendableOutputDescriptorZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_SpendableOutputDescriptorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_SpendableOutputDescriptorZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_SpendableOutputDescriptorZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_SpendableOutputDescriptorZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_SpendableOutputDescriptorZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_SpendableOutputDescriptorZ_to_array(nativeType: LDKCVec_SpendableOutputDescriptorZ, callerContext: String, deallocate: Bool = true) -> [LDKSpendableOutputDescriptor] {
		var array = [LDKSpendableOutputDescriptor]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in SpendableOutputDescriptor_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_SpendableOutputDescriptorZ (called from \(callerContext))")
						CVec_SpendableOutputDescriptorZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKSpendableOutputDescriptorArray(array: [SpendableOutputDescriptor]) -> [LDKSpendableOutputDescriptor] {
							return array.map { entry -> LDKSpendableOutputDescriptor in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKSpendableOutputDescriptorArray(array: [LDKSpendableOutputDescriptor]) -> [SpendableOutputDescriptor] {
							return array.map { entry -> SpendableOutputDescriptor in
								SpendableOutputDescriptor(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKSpendableOutputDescriptorArray(array: [LDKSpendableOutputDescriptor]) -> [SpendableOutputDescriptor] {
							return array.map { entry -> SpendableOutputDescriptor in
								SpendableOutputDescriptor(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKSpendableOutputDescriptorArray(array: [LDKSpendableOutputDescriptor]) -> [LDKSpendableOutputDescriptor] {
								return array.map { entry -> LDKSpendableOutputDescriptor in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									SpendableOutputDescriptor(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_ThirtyTwoBytesZWrapper(array: [[UInt8]]) -> LDKCVec_ThirtyTwoBytesZWrapper {
		
					var lowerDimension = [LDKThirtyTwoBytes]()
					// var subdimensionWrapper = [LDKThirtyTwoBytesWrapper]()
					for currentEntry in array {
						let convertedEntry = Self.new_LDKThirtyTwoBytes(array: currentEntry)
						lowerDimension.append(convertedEntry)
						// subdimensionWrapper.append(convertedEntry)
					}
				

		/*
        let dataContainer = lowerDimension.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKThirtyTwoBytes>) -> UnsafeMutablePointer<LDKThirtyTwoBytes> in
            let mutablePointer = UnsafeMutablePointer<LDKThirtyTwoBytes>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKThirtyTwoBytes>.allocate(capacity: array.count)
		dataContainer.initialize(from: lowerDimension, count: array.count)

        let vector = LDKCVec_ThirtyTwoBytesZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_ThirtyTwoBytesZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_ThirtyTwoBytesZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_ThirtyTwoBytesZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_ThirtyTwoBytesZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_ThirtyTwoBytesZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_ThirtyTwoBytesZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_ThirtyTwoBytesZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_ThirtyTwoBytesZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_ThirtyTwoBytesZ_to_array(nativeType: LDKCVec_ThirtyTwoBytesZ, callerContext: String, deallocate: Bool = true) -> [[UInt8]] {
		var array = [[UInt8]]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			let convertedEntry = Self.LDKThirtyTwoBytes_to_array(nativeType: currentEntry)
			array.append(convertedEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						print("Deallocating LDKCVec_ThirtyTwoBytesZ (called from \(callerContext))")
						nativeType.data.deallocate()
					} else {
						print("Not deallocating LDKCVec_ThirtyTwoBytesZ (called from \(callerContext))")
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_TransactionOutputsZWrapper(array: [LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ]) -> LDKCVec_TransactionOutputsZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ>) -> UnsafeMutablePointer<LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ> in
            let mutablePointer = UnsafeMutablePointer<LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_TransactionOutputsZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_TransactionOutputsZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_TransactionOutputsZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_TransactionOutputsZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_TransactionOutputsZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_TransactionOutputsZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_TransactionOutputsZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_TransactionOutputsZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_TransactionOutputsZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_TransactionOutputsZ_to_array(nativeType: LDKCVec_TransactionOutputsZ, callerContext: String, deallocate: Bool = true) -> [LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ] {
		var array = [LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_TransactionOutputsZ (called from \(callerContext))")
						CVec_TransactionOutputsZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZArray(array: [C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ]) -> [LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ] {
							return array.map { entry -> LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZArray(array: [LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ]) -> [C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ] {
							return array.map { entry -> C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ in
								C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZArray(array: [LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ]) -> [C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ] {
							return array.map { entry -> C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ in
								C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZArray(array: [LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ]) -> [LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ] {
								return array.map { entry -> LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_TransactionZWrapper(array: [[UInt8]]) -> LDKCVec_TransactionZWrapper {
		
					var lowerDimension = [LDKTransaction]()
					var subdimensionWrapper = [LDKTransactionWrapper]()
					for currentEntry in array {
						let convertedEntry = Self.new_LDKTransactionWrapper(array: currentEntry)
						lowerDimension.append(convertedEntry.cOpaqueStruct!)
						subdimensionWrapper.append(convertedEntry)
					}
				

		/*
        let dataContainer = lowerDimension.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKTransaction>) -> UnsafeMutablePointer<LDKTransaction> in
            let mutablePointer = UnsafeMutablePointer<LDKTransaction>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKTransaction>.allocate(capacity: array.count)
		dataContainer.initialize(from: lowerDimension, count: array.count)

        let vector = LDKCVec_TransactionZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_TransactionZWrapper(pointer: vector, subdimensionWrapper: subdimensionWrapper)
        return wrapper
    }

    public class LDKCVec_TransactionZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_TransactionZ?
		internal var subdimensionWrapper: [LDKTransactionWrapper]? = nil

		public init(pointer: LDKCVec_TransactionZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_TransactionZ, subdimensionWrapper: [LDKTransactionWrapper]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_TransactionZWrapper {
			self.dangling = true
			
					if dangleSubdimensions {
						if let wrappers = self.subdimensionWrapper {
							for currentWrapper in wrappers {
								currentWrapper.dangle()
							}
						}
					}
				
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_TransactionZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_TransactionZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_TransactionZ_to_array(nativeType: LDKCVec_TransactionZ, callerContext: String, deallocate: Bool = true) -> [[UInt8]] {
		var array = [[UInt8]]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			let convertedEntry = Self.LDKTransaction_to_array(nativeType: currentEntry, callerContext: "\(callerContext) > LDKCVec_TransactionZ_to_array", deallocate: deallocate)
			array.append(convertedEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						print("Deallocating LDKCVec_TransactionZ (called from \(callerContext))")
						nativeType.data.deallocate()
					} else {
						print("Not deallocating LDKCVec_TransactionZ (called from \(callerContext))")
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_TxOutZWrapper(array: [LDKTxOut]) -> LDKCVec_TxOutZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKTxOut>) -> UnsafeMutablePointer<LDKTxOut> in
            let mutablePointer = UnsafeMutablePointer<LDKTxOut>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKTxOut>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_TxOutZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_TxOutZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_TxOutZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_TxOutZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_TxOutZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_TxOutZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_TxOutZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_TxOutZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_TxOutZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_TxOutZ_to_array(nativeType: LDKCVec_TxOutZ, callerContext: String, deallocate: Bool = true) -> [LDKTxOut] {
		var array = [LDKTxOut]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in TxOut_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_TxOutZ (called from \(callerContext))")
						CVec_TxOutZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKTxOutArray(array: [TxOut]) -> [LDKTxOut] {
							return array.map { entry -> LDKTxOut in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKTxOutArray(array: [LDKTxOut]) -> [TxOut] {
							return array.map { entry -> TxOut in
								TxOut(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKTxOutArray(array: [LDKTxOut]) -> [TxOut] {
							return array.map { entry -> TxOut in
								TxOut(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKTxOutArray(array: [LDKTxOut]) -> [LDKTxOut] {
								return array.map { entry -> LDKTxOut in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									TxOut(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_TxidZWrapper(array: [[UInt8]]) -> LDKCVec_TxidZWrapper {
		
					var lowerDimension = [LDKThirtyTwoBytes]()
					// var subdimensionWrapper = [LDKThirtyTwoBytesWrapper]()
					for currentEntry in array {
						let convertedEntry = Self.new_LDKThirtyTwoBytes(array: currentEntry)
						lowerDimension.append(convertedEntry)
						// subdimensionWrapper.append(convertedEntry)
					}
				

		/*
        let dataContainer = lowerDimension.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKThirtyTwoBytes>) -> UnsafeMutablePointer<LDKThirtyTwoBytes> in
            let mutablePointer = UnsafeMutablePointer<LDKThirtyTwoBytes>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKThirtyTwoBytes>.allocate(capacity: array.count)
		dataContainer.initialize(from: lowerDimension, count: array.count)

        let vector = LDKCVec_TxidZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_TxidZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_TxidZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_TxidZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_TxidZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_TxidZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_TxidZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_TxidZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_TxidZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_TxidZ_to_array(nativeType: LDKCVec_TxidZ, callerContext: String, deallocate: Bool = true) -> [[UInt8]] {
		var array = [[UInt8]]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			let convertedEntry = Self.LDKThirtyTwoBytes_to_array(nativeType: currentEntry)
			array.append(convertedEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						print("Deallocating LDKCVec_TxidZ (called from \(callerContext))")
						nativeType.data.deallocate()
					} else {
						print("Not deallocating LDKCVec_TxidZ (called from \(callerContext))")
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_UpdateAddHTLCZWrapper(array: [LDKUpdateAddHTLC]) -> LDKCVec_UpdateAddHTLCZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKUpdateAddHTLC>) -> UnsafeMutablePointer<LDKUpdateAddHTLC> in
            let mutablePointer = UnsafeMutablePointer<LDKUpdateAddHTLC>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKUpdateAddHTLC>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_UpdateAddHTLCZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_UpdateAddHTLCZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_UpdateAddHTLCZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_UpdateAddHTLCZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_UpdateAddHTLCZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_UpdateAddHTLCZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_UpdateAddHTLCZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_UpdateAddHTLCZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_UpdateAddHTLCZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_UpdateAddHTLCZ_to_array(nativeType: LDKCVec_UpdateAddHTLCZ, callerContext: String, deallocate: Bool = true) -> [LDKUpdateAddHTLC] {
		var array = [LDKUpdateAddHTLC]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in UpdateAddHTLC_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_UpdateAddHTLCZ (called from \(callerContext))")
						CVec_UpdateAddHTLCZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKUpdateAddHTLCArray(array: [UpdateAddHTLC]) -> [LDKUpdateAddHTLC] {
							return array.map { entry -> LDKUpdateAddHTLC in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKUpdateAddHTLCArray(array: [LDKUpdateAddHTLC]) -> [UpdateAddHTLC] {
							return array.map { entry -> UpdateAddHTLC in
								UpdateAddHTLC(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKUpdateAddHTLCArray(array: [LDKUpdateAddHTLC]) -> [UpdateAddHTLC] {
							return array.map { entry -> UpdateAddHTLC in
								UpdateAddHTLC(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKUpdateAddHTLCArray(array: [LDKUpdateAddHTLC]) -> [LDKUpdateAddHTLC] {
								return array.map { entry -> LDKUpdateAddHTLC in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									UpdateAddHTLC(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_UpdateFailHTLCZWrapper(array: [LDKUpdateFailHTLC]) -> LDKCVec_UpdateFailHTLCZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKUpdateFailHTLC>) -> UnsafeMutablePointer<LDKUpdateFailHTLC> in
            let mutablePointer = UnsafeMutablePointer<LDKUpdateFailHTLC>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKUpdateFailHTLC>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_UpdateFailHTLCZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_UpdateFailHTLCZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_UpdateFailHTLCZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_UpdateFailHTLCZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_UpdateFailHTLCZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_UpdateFailHTLCZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_UpdateFailHTLCZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_UpdateFailHTLCZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_UpdateFailHTLCZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_UpdateFailHTLCZ_to_array(nativeType: LDKCVec_UpdateFailHTLCZ, callerContext: String, deallocate: Bool = true) -> [LDKUpdateFailHTLC] {
		var array = [LDKUpdateFailHTLC]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in UpdateFailHTLC_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_UpdateFailHTLCZ (called from \(callerContext))")
						CVec_UpdateFailHTLCZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKUpdateFailHTLCArray(array: [UpdateFailHTLC]) -> [LDKUpdateFailHTLC] {
							return array.map { entry -> LDKUpdateFailHTLC in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKUpdateFailHTLCArray(array: [LDKUpdateFailHTLC]) -> [UpdateFailHTLC] {
							return array.map { entry -> UpdateFailHTLC in
								UpdateFailHTLC(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKUpdateFailHTLCArray(array: [LDKUpdateFailHTLC]) -> [UpdateFailHTLC] {
							return array.map { entry -> UpdateFailHTLC in
								UpdateFailHTLC(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKUpdateFailHTLCArray(array: [LDKUpdateFailHTLC]) -> [LDKUpdateFailHTLC] {
								return array.map { entry -> LDKUpdateFailHTLC in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									UpdateFailHTLC(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_UpdateFailMalformedHTLCZWrapper(array: [LDKUpdateFailMalformedHTLC]) -> LDKCVec_UpdateFailMalformedHTLCZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKUpdateFailMalformedHTLC>) -> UnsafeMutablePointer<LDKUpdateFailMalformedHTLC> in
            let mutablePointer = UnsafeMutablePointer<LDKUpdateFailMalformedHTLC>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKUpdateFailMalformedHTLC>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_UpdateFailMalformedHTLCZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_UpdateFailMalformedHTLCZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_UpdateFailMalformedHTLCZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_UpdateFailMalformedHTLCZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_UpdateFailMalformedHTLCZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_UpdateFailMalformedHTLCZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_UpdateFailMalformedHTLCZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_UpdateFailMalformedHTLCZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_UpdateFailMalformedHTLCZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_UpdateFailMalformedHTLCZ_to_array(nativeType: LDKCVec_UpdateFailMalformedHTLCZ, callerContext: String, deallocate: Bool = true) -> [LDKUpdateFailMalformedHTLC] {
		var array = [LDKUpdateFailMalformedHTLC]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in UpdateFailMalformedHTLC_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_UpdateFailMalformedHTLCZ (called from \(callerContext))")
						CVec_UpdateFailMalformedHTLCZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKUpdateFailMalformedHTLCArray(array: [UpdateFailMalformedHTLC]) -> [LDKUpdateFailMalformedHTLC] {
							return array.map { entry -> LDKUpdateFailMalformedHTLC in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKUpdateFailMalformedHTLCArray(array: [LDKUpdateFailMalformedHTLC]) -> [UpdateFailMalformedHTLC] {
							return array.map { entry -> UpdateFailMalformedHTLC in
								UpdateFailMalformedHTLC(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKUpdateFailMalformedHTLCArray(array: [LDKUpdateFailMalformedHTLC]) -> [UpdateFailMalformedHTLC] {
							return array.map { entry -> UpdateFailMalformedHTLC in
								UpdateFailMalformedHTLC(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKUpdateFailMalformedHTLCArray(array: [LDKUpdateFailMalformedHTLC]) -> [LDKUpdateFailMalformedHTLC] {
								return array.map { entry -> LDKUpdateFailMalformedHTLC in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									UpdateFailMalformedHTLC(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_UpdateFulfillHTLCZWrapper(array: [LDKUpdateFulfillHTLC]) -> LDKCVec_UpdateFulfillHTLCZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKUpdateFulfillHTLC>) -> UnsafeMutablePointer<LDKUpdateFulfillHTLC> in
            let mutablePointer = UnsafeMutablePointer<LDKUpdateFulfillHTLC>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKUpdateFulfillHTLC>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_UpdateFulfillHTLCZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_UpdateFulfillHTLCZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_UpdateFulfillHTLCZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_UpdateFulfillHTLCZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_UpdateFulfillHTLCZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_UpdateFulfillHTLCZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_UpdateFulfillHTLCZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_UpdateFulfillHTLCZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_UpdateFulfillHTLCZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_UpdateFulfillHTLCZ_to_array(nativeType: LDKCVec_UpdateFulfillHTLCZ, callerContext: String, deallocate: Bool = true) -> [LDKUpdateFulfillHTLC] {
		var array = [LDKUpdateFulfillHTLC]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			
						if deallocate {
							array.append(withUnsafePointer(to: currentEntry){ origPointer in UpdateFulfillHTLC_clone(origPointer) })
						} else {
							array.append(currentEntry)
						}
					
		}
		
					if deallocate {
						print("Deallocating LDKCVec_UpdateFulfillHTLCZ (called from \(callerContext))")
						CVec_UpdateFulfillHTLCZ_free(nativeType)
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKUpdateFulfillHTLCArray(array: [UpdateFulfillHTLC]) -> [LDKUpdateFulfillHTLC] {
							return array.map { entry -> LDKUpdateFulfillHTLC in
								entry.danglingClone().cOpaqueStruct!
							}
						}

						public class func wrapNativeLDKUpdateFulfillHTLCArray(array: [LDKUpdateFulfillHTLC]) -> [UpdateFulfillHTLC] {
							return array.map { entry -> UpdateFulfillHTLC in
								UpdateFulfillHTLC(pointer: entry)
							}
						}

						public class func wrapDanglingNativeLDKUpdateFulfillHTLCArray(array: [LDKUpdateFulfillHTLC]) -> [UpdateFulfillHTLC] {
							return array.map { entry -> UpdateFulfillHTLC in
								UpdateFulfillHTLC(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKUpdateFulfillHTLCArray(array: [LDKUpdateFulfillHTLC]) -> [LDKUpdateFulfillHTLC] {
								return array.map { entry -> LDKUpdateFulfillHTLC in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									UpdateFulfillHTLC(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
								}
							}
						

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_u5ZWrapper(array: [UInt8]) -> LDKCVec_u5ZWrapper {
		let lowerDimension = array.map { v in LDKu5(_0: v) }

		/*
        let dataContainer = lowerDimension.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKu5>) -> UnsafeMutablePointer<LDKu5> in
            let mutablePointer = UnsafeMutablePointer<LDKu5>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKu5>.allocate(capacity: array.count)
		dataContainer.initialize(from: lowerDimension, count: array.count)

        let vector = LDKCVec_u5Z(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_u5ZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_u5ZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_u5Z?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_u5Z){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_u5Z, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_u5ZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_u5ZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_u5ZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_u5Z_to_array(nativeType: LDKCVec_u5Z, callerContext: String, deallocate: Bool = true) -> [UInt8] {
		var array = [UInt8]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			let convertedEntry = currentEntry._0
			array.append(convertedEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						print("Deallocating LDKCVec_u5Z (called from \(callerContext))")
						nativeType.data.deallocate()
					} else {
						print("Not deallocating LDKCVec_u5Z (called from \(callerContext))")
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_u64ZWrapper(array: [UInt64]) -> LDKCVec_u64ZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<UInt64>) -> UnsafeMutablePointer<UInt64> in
            let mutablePointer = UnsafeMutablePointer<UInt64>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<UInt64>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_u64Z(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_u64ZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_u64ZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_u64Z?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_u64Z){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_u64Z, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_u64ZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_u64ZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_u64ZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_u64Z_to_array(nativeType: LDKCVec_u64Z, callerContext: String, deallocate: Bool = true) -> [UInt64] {
		var array = [UInt64]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						print("Deallocating LDKCVec_u64Z (called from \(callerContext))")
						nativeType.data.deallocate()
					} else {
						print("Not deallocating LDKCVec_u64Z (called from \(callerContext))")
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_u8ZWrapper(array: [UInt8]) -> LDKCVec_u8ZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<UInt8>) -> UnsafeMutablePointer<UInt8> in
            let mutablePointer = UnsafeMutablePointer<UInt8>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<UInt8>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_u8Z(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_u8ZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_u8ZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_u8Z?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_u8Z){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_u8Z, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_u8ZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_u8ZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_u8ZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_u8Z_to_array(nativeType: LDKCVec_u8Z, callerContext: String, deallocate: Bool = true) -> [UInt8] {
		var array = [UInt8]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						print("Deallocating LDKCVec_u8Z (called from \(callerContext))")
						nativeType.data.deallocate()
					} else {
						print("Not deallocating LDKCVec_u8Z (called from \(callerContext))")
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */

	/* SWIFT_TO_RUST_START */
	public class func new_LDKu8sliceWrapper(array: [UInt8]) -> LDKu8sliceWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<UInt8>) -> UnsafeMutablePointer<UInt8> in
            let mutablePointer = UnsafeMutablePointer<UInt8>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<UInt8>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKu8slice(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKu8sliceWrapper(pointer: vector)
        return wrapper
    }

    public class LDKu8sliceWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKu8slice?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKu8slice){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKu8slice, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKu8sliceWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKu8sliceWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKu8sliceWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKu8slice_to_array(nativeType: LDKu8slice) -> [UInt8] {
		var array = [UInt8]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		/* RUST_PRIMITIVE_CLEANUP */
		return array
	}
	/* RUST_TO_SWIFT_END */

	/* VECTOR_METHODS_END */

	/* STATIC_METHODS_START */
	public class func swift_ldk_get_compiled_version() -> String {
		
				
				return 
				Bindings.LDKStr_to_string(nativeType: _ldk_get_compiled_version(), callerContext: "Bindings::swift_ldk_get_compiled_version")
				
			
	}
	public class func swift_ldk_c_bindings_get_compiled_version() -> String {
		
				
				return 
				Bindings.LDKStr_to_string(nativeType: _ldk_c_bindings_get_compiled_version(), callerContext: "Bindings::swift_ldk_c_bindings_get_compiled_version")
				
			
	}
	public class func swift_CResult_BlindedRouteNoneZ_is_ok(o: Result_BlindedRouteNoneZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_BlindedRouteNoneZ>) in

				CResult_BlindedRouteNoneZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_BlindedRouteDecodeErrorZ_is_ok(o: Result_BlindedRouteDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_BlindedRouteDecodeErrorZ>) in

				CResult_BlindedRouteDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_BlindedHopDecodeErrorZ_is_ok(o: Result_BlindedHopDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_BlindedHopDecodeErrorZ>) in

				CResult_BlindedHopDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_NoneNoneZ_is_ok(o: Result_NoneNoneZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_NoneNoneZ>) in

				CResult_NoneNoneZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_CounterpartyCommitmentSecretsDecodeErrorZ_is_ok(o: Result_CounterpartyCommitmentSecretsDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_CounterpartyCommitmentSecretsDecodeErrorZ>) in

				CResult_CounterpartyCommitmentSecretsDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_SecretKeyErrorZ_is_ok(o: Result_SecretKeyErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_SecretKeyErrorZ>) in

				CResult_SecretKeyErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_PublicKeyErrorZ_is_ok(o: Result_PublicKeyErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_PublicKeyErrorZ>) in

				CResult_PublicKeyErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_TxCreationKeysDecodeErrorZ_is_ok(o: Result_TxCreationKeysDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_TxCreationKeysDecodeErrorZ>) in

				CResult_TxCreationKeysDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ChannelPublicKeysDecodeErrorZ_is_ok(o: Result_ChannelPublicKeysDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ChannelPublicKeysDecodeErrorZ>) in

				CResult_ChannelPublicKeysDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_TxCreationKeysErrorZ_is_ok(o: Result_TxCreationKeysErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_TxCreationKeysErrorZ>) in

				CResult_TxCreationKeysErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_HTLCOutputInCommitmentDecodeErrorZ_is_ok(o: Result_HTLCOutputInCommitmentDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_HTLCOutputInCommitmentDecodeErrorZ>) in

				CResult_HTLCOutputInCommitmentDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_CounterpartyChannelTransactionParametersDecodeErrorZ_is_ok(o: Result_CounterpartyChannelTransactionParametersDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_CounterpartyChannelTransactionParametersDecodeErrorZ>) in

				CResult_CounterpartyChannelTransactionParametersDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ChannelTransactionParametersDecodeErrorZ_is_ok(o: Result_ChannelTransactionParametersDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ChannelTransactionParametersDecodeErrorZ>) in

				CResult_ChannelTransactionParametersDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_HolderCommitmentTransactionDecodeErrorZ_is_ok(o: Result_HolderCommitmentTransactionDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_HolderCommitmentTransactionDecodeErrorZ>) in

				CResult_HolderCommitmentTransactionDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_BuiltCommitmentTransactionDecodeErrorZ_is_ok(o: Result_BuiltCommitmentTransactionDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_BuiltCommitmentTransactionDecodeErrorZ>) in

				CResult_BuiltCommitmentTransactionDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_TrustedClosingTransactionNoneZ_is_ok(o: Result_TrustedClosingTransactionNoneZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_TrustedClosingTransactionNoneZ>) in

				CResult_TrustedClosingTransactionNoneZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_CommitmentTransactionDecodeErrorZ_is_ok(o: Result_CommitmentTransactionDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_CommitmentTransactionDecodeErrorZ>) in

				CResult_CommitmentTransactionDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_TrustedCommitmentTransactionNoneZ_is_ok(o: Result_TrustedCommitmentTransactionNoneZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_TrustedCommitmentTransactionNoneZ>) in

				CResult_TrustedCommitmentTransactionNoneZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_CVec_SignatureZNoneZ_is_ok(o: Result_CVec_SignatureZNoneZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_CVec_SignatureZNoneZ>) in

				CResult_CVec_SignatureZNoneZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ShutdownScriptDecodeErrorZ_is_ok(o: Result_ShutdownScriptDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ShutdownScriptDecodeErrorZ>) in

				CResult_ShutdownScriptDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ShutdownScriptInvalidShutdownScriptZ_is_ok(o: Result_ShutdownScriptInvalidShutdownScriptZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ShutdownScriptInvalidShutdownScriptZ>) in

				CResult_ShutdownScriptInvalidShutdownScriptZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_NoneErrorZ_is_ok(o: Result_NoneErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_NoneErrorZ>) in

				CResult_NoneErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_RouteHopDecodeErrorZ_is_ok(o: Result_RouteHopDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_RouteHopDecodeErrorZ>) in

				CResult_RouteHopDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_RouteDecodeErrorZ_is_ok(o: Result_RouteDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_RouteDecodeErrorZ>) in

				CResult_RouteDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_RouteParametersDecodeErrorZ_is_ok(o: Result_RouteParametersDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_RouteParametersDecodeErrorZ>) in

				CResult_RouteParametersDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_PaymentParametersDecodeErrorZ_is_ok(o: Result_PaymentParametersDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_PaymentParametersDecodeErrorZ>) in

				CResult_PaymentParametersDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_RouteHintDecodeErrorZ_is_ok(o: Result_RouteHintDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_RouteHintDecodeErrorZ>) in

				CResult_RouteHintDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_RouteHintHopDecodeErrorZ_is_ok(o: Result_RouteHintHopDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_RouteHintHopDecodeErrorZ>) in

				CResult_RouteHintHopDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_RouteLightningErrorZ_is_ok(o: Result_RouteLightningErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_RouteLightningErrorZ>) in

				CResult_RouteLightningErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_PaymentPurposeDecodeErrorZ_is_ok(o: Result_PaymentPurposeDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_PaymentPurposeDecodeErrorZ>) in

				CResult_PaymentPurposeDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_COption_ClosureReasonZDecodeErrorZ_is_ok(o: Result_COption_ClosureReasonZDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_COption_ClosureReasonZDecodeErrorZ>) in

				CResult_COption_ClosureReasonZDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_COption_HTLCDestinationZDecodeErrorZ_is_ok(o: Result_COption_HTLCDestinationZDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_COption_HTLCDestinationZDecodeErrorZ>) in

				CResult_COption_HTLCDestinationZDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_COption_EventZDecodeErrorZ_is_ok(o: Result_COption_EventZDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_COption_EventZDecodeErrorZ>) in

				CResult_COption_EventZDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_TxOutAccessErrorZ_is_ok(o: Result_TxOutAccessErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_TxOutAccessErrorZ>) in

				CResult_TxOutAccessErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_FixedPenaltyScorerDecodeErrorZ_is_ok(o: Result_FixedPenaltyScorerDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_FixedPenaltyScorerDecodeErrorZ>) in

				CResult_FixedPenaltyScorerDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ProbabilisticScorerDecodeErrorZ_is_ok(o: Result_ProbabilisticScorerDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ProbabilisticScorerDecodeErrorZ>) in

				CResult_ProbabilisticScorerDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_InitFeaturesDecodeErrorZ_is_ok(o: Result_InitFeaturesDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_InitFeaturesDecodeErrorZ>) in

				CResult_InitFeaturesDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ChannelFeaturesDecodeErrorZ_is_ok(o: Result_ChannelFeaturesDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ChannelFeaturesDecodeErrorZ>) in

				CResult_ChannelFeaturesDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_NodeFeaturesDecodeErrorZ_is_ok(o: Result_NodeFeaturesDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_NodeFeaturesDecodeErrorZ>) in

				CResult_NodeFeaturesDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_InvoiceFeaturesDecodeErrorZ_is_ok(o: Result_InvoiceFeaturesDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_InvoiceFeaturesDecodeErrorZ>) in

				CResult_InvoiceFeaturesDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ChannelTypeFeaturesDecodeErrorZ_is_ok(o: Result_ChannelTypeFeaturesDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ChannelTypeFeaturesDecodeErrorZ>) in

				CResult_ChannelTypeFeaturesDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_NodeIdDecodeErrorZ_is_ok(o: Result_NodeIdDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_NodeIdDecodeErrorZ>) in

				CResult_NodeIdDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_COption_NetworkUpdateZDecodeErrorZ_is_ok(o: Result_COption_NetworkUpdateZDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_COption_NetworkUpdateZDecodeErrorZ>) in

				CResult_COption_NetworkUpdateZDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_boolLightningErrorZ_is_ok(o: Result_boolLightningErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_boolLightningErrorZ>) in

				CResult_boolLightningErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_NoneLightningErrorZ_is_ok(o: Result_NoneLightningErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_NoneLightningErrorZ>) in

				CResult_NoneLightningErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ChannelUpdateInfoDecodeErrorZ_is_ok(o: Result_ChannelUpdateInfoDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ChannelUpdateInfoDecodeErrorZ>) in

				CResult_ChannelUpdateInfoDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ChannelInfoDecodeErrorZ_is_ok(o: Result_ChannelInfoDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ChannelInfoDecodeErrorZ>) in

				CResult_ChannelInfoDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_RoutingFeesDecodeErrorZ_is_ok(o: Result_RoutingFeesDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_RoutingFeesDecodeErrorZ>) in

				CResult_RoutingFeesDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_NodeAnnouncementInfoDecodeErrorZ_is_ok(o: Result_NodeAnnouncementInfoDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_NodeAnnouncementInfoDecodeErrorZ>) in

				CResult_NodeAnnouncementInfoDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_NodeAliasDecodeErrorZ_is_ok(o: Result_NodeAliasDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_NodeAliasDecodeErrorZ>) in

				CResult_NodeAliasDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_NodeInfoDecodeErrorZ_is_ok(o: Result_NodeInfoDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_NodeInfoDecodeErrorZ>) in

				CResult_NodeInfoDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_NetworkGraphDecodeErrorZ_is_ok(o: Result_NetworkGraphDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_NetworkGraphDecodeErrorZ>) in

				CResult_NetworkGraphDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_DelayedPaymentOutputDescriptorDecodeErrorZ_is_ok(o: Result_DelayedPaymentOutputDescriptorDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_DelayedPaymentOutputDescriptorDecodeErrorZ>) in

				CResult_DelayedPaymentOutputDescriptorDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_StaticPaymentOutputDescriptorDecodeErrorZ_is_ok(o: Result_StaticPaymentOutputDescriptorDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_StaticPaymentOutputDescriptorDecodeErrorZ>) in

				CResult_StaticPaymentOutputDescriptorDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_SpendableOutputDescriptorDecodeErrorZ_is_ok(o: Result_SpendableOutputDescriptorDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_SpendableOutputDescriptorDecodeErrorZ>) in

				CResult_SpendableOutputDescriptorDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_C2Tuple_SignatureCVec_SignatureZZNoneZ_is_ok(o: Result_C2Tuple_SignatureCVec_SignatureZZNoneZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ>) in

				CResult_C2Tuple_SignatureCVec_SignatureZZNoneZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_SignatureNoneZ_is_ok(o: Result_SignatureNoneZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_SignatureNoneZ>) in

				CResult_SignatureNoneZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_C2Tuple_SignatureSignatureZNoneZ_is_ok(o: Result_C2Tuple_SignatureSignatureZNoneZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_C2Tuple_SignatureSignatureZNoneZ>) in

				CResult_C2Tuple_SignatureSignatureZNoneZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_SecretKeyNoneZ_is_ok(o: Result_SecretKeyNoneZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_SecretKeyNoneZ>) in

				CResult_SecretKeyNoneZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_PublicKeyNoneZ_is_ok(o: Result_PublicKeyNoneZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_PublicKeyNoneZ>) in

				CResult_PublicKeyNoneZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_SharedSecretNoneZ_is_ok(o: Result_SharedSecretNoneZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_SharedSecretNoneZ>) in

				CResult_SharedSecretNoneZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_SignDecodeErrorZ_is_ok(o: Result_SignDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_SignDecodeErrorZ>) in

				CResult_SignDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_RecoverableSignatureNoneZ_is_ok(o: Result_RecoverableSignatureNoneZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_RecoverableSignatureNoneZ>) in

				CResult_RecoverableSignatureNoneZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_CVec_CVec_u8ZZNoneZ_is_ok(o: Result_CVec_CVec_u8ZZNoneZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_CVec_CVec_u8ZZNoneZ>) in

				CResult_CVec_CVec_u8ZZNoneZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_InMemorySignerDecodeErrorZ_is_ok(o: Result_InMemorySignerDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_InMemorySignerDecodeErrorZ>) in

				CResult_InMemorySignerDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_TransactionNoneZ_is_ok(o: Result_TransactionNoneZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_TransactionNoneZ>) in

				CResult_TransactionNoneZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ_is_ok(o: Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ>) in

				CResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_NoneAPIErrorZ_is_ok(o: Result_NoneAPIErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_NoneAPIErrorZ>) in

				CResult_NoneAPIErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult__u832APIErrorZ_is_ok(o: Result__u832APIErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult__u832APIErrorZ>) in

				CResult__u832APIErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_PaymentIdPaymentSendFailureZ_is_ok(o: Result_PaymentIdPaymentSendFailureZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_PaymentIdPaymentSendFailureZ>) in

				CResult_PaymentIdPaymentSendFailureZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_NonePaymentSendFailureZ_is_ok(o: Result_NonePaymentSendFailureZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_NonePaymentSendFailureZ>) in

				CResult_NonePaymentSendFailureZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ_is_ok(o: Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ>) in

				CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_C2Tuple_PaymentHashPaymentSecretZNoneZ_is_ok(o: Result_C2Tuple_PaymentHashPaymentSecretZNoneZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_C2Tuple_PaymentHashPaymentSecretZNoneZ>) in

				CResult_C2Tuple_PaymentHashPaymentSecretZNoneZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ_is_ok(o: Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ>) in

				CResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_PaymentSecretNoneZ_is_ok(o: Result_PaymentSecretNoneZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_PaymentSecretNoneZ>) in

				CResult_PaymentSecretNoneZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_PaymentSecretAPIErrorZ_is_ok(o: Result_PaymentSecretAPIErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_PaymentSecretAPIErrorZ>) in

				CResult_PaymentSecretAPIErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_PaymentPreimageAPIErrorZ_is_ok(o: Result_PaymentPreimageAPIErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_PaymentPreimageAPIErrorZ>) in

				CResult_PaymentPreimageAPIErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_CounterpartyForwardingInfoDecodeErrorZ_is_ok(o: Result_CounterpartyForwardingInfoDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_CounterpartyForwardingInfoDecodeErrorZ>) in

				CResult_CounterpartyForwardingInfoDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ChannelCounterpartyDecodeErrorZ_is_ok(o: Result_ChannelCounterpartyDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ChannelCounterpartyDecodeErrorZ>) in

				CResult_ChannelCounterpartyDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ChannelDetailsDecodeErrorZ_is_ok(o: Result_ChannelDetailsDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ChannelDetailsDecodeErrorZ>) in

				CResult_ChannelDetailsDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_PhantomRouteHintsDecodeErrorZ_is_ok(o: Result_PhantomRouteHintsDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_PhantomRouteHintsDecodeErrorZ>) in

				CResult_PhantomRouteHintsDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ_is_ok(o: Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ>) in

				CResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ChannelConfigDecodeErrorZ_is_ok(o: Result_ChannelConfigDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ChannelConfigDecodeErrorZ>) in

				CResult_ChannelConfigDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_OutPointDecodeErrorZ_is_ok(o: Result_OutPointDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_OutPointDecodeErrorZ>) in

				CResult_OutPointDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_COption_TypeZDecodeErrorZ_is_ok(o: Result_COption_TypeZDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_COption_TypeZDecodeErrorZ>) in

				CResult_COption_TypeZDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_PaymentIdPaymentErrorZ_is_ok(o: Result_PaymentIdPaymentErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_PaymentIdPaymentErrorZ>) in

				CResult_PaymentIdPaymentErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_InFlightHtlcsDecodeErrorZ_is_ok(o: Result_InFlightHtlcsDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_InFlightHtlcsDecodeErrorZ>) in

				CResult_InFlightHtlcsDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_SiPrefixParseErrorZ_is_ok(o: Result_SiPrefixParseErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_SiPrefixParseErrorZ>) in

				CResult_SiPrefixParseErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_InvoiceParseOrSemanticErrorZ_is_ok(o: Result_InvoiceParseOrSemanticErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_InvoiceParseOrSemanticErrorZ>) in

				CResult_InvoiceParseOrSemanticErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_SignedRawInvoiceParseErrorZ_is_ok(o: Result_SignedRawInvoiceParseErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_SignedRawInvoiceParseErrorZ>) in

				CResult_SignedRawInvoiceParseErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_PayeePubKeyErrorZ_is_ok(o: Result_PayeePubKeyErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_PayeePubKeyErrorZ>) in

				CResult_PayeePubKeyErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_PositiveTimestampCreationErrorZ_is_ok(o: Result_PositiveTimestampCreationErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_PositiveTimestampCreationErrorZ>) in

				CResult_PositiveTimestampCreationErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_NoneSemanticErrorZ_is_ok(o: Result_NoneSemanticErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_NoneSemanticErrorZ>) in

				CResult_NoneSemanticErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_InvoiceSemanticErrorZ_is_ok(o: Result_InvoiceSemanticErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_InvoiceSemanticErrorZ>) in

				CResult_InvoiceSemanticErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_DescriptionCreationErrorZ_is_ok(o: Result_DescriptionCreationErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_DescriptionCreationErrorZ>) in

				CResult_DescriptionCreationErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_PrivateRouteCreationErrorZ_is_ok(o: Result_PrivateRouteCreationErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_PrivateRouteCreationErrorZ>) in

				CResult_PrivateRouteCreationErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_StringErrorZ_is_ok(o: Result_StringErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_StringErrorZ>) in

				CResult_StringErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ChannelMonitorUpdateDecodeErrorZ_is_ok(o: Result_ChannelMonitorUpdateDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ChannelMonitorUpdateDecodeErrorZ>) in

				CResult_ChannelMonitorUpdateDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_COption_MonitorEventZDecodeErrorZ_is_ok(o: Result_COption_MonitorEventZDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_COption_MonitorEventZDecodeErrorZ>) in

				CResult_COption_MonitorEventZDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_HTLCUpdateDecodeErrorZ_is_ok(o: Result_HTLCUpdateDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_HTLCUpdateDecodeErrorZ>) in

				CResult_HTLCUpdateDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ_is_ok(o: Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ>) in

				CResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_COption_CustomOnionMessageContentsZDecodeErrorZ_is_ok(o: Result_COption_CustomOnionMessageContentsZDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_COption_CustomOnionMessageContentsZDecodeErrorZ>) in

				CResult_COption_CustomOnionMessageContentsZDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_CVec_u8ZPeerHandleErrorZ_is_ok(o: Result_CVec_u8ZPeerHandleErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_CVec_u8ZPeerHandleErrorZ>) in

				CResult_CVec_u8ZPeerHandleErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_NonePeerHandleErrorZ_is_ok(o: Result_NonePeerHandleErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_NonePeerHandleErrorZ>) in

				CResult_NonePeerHandleErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_boolPeerHandleErrorZ_is_ok(o: Result_boolPeerHandleErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_boolPeerHandleErrorZ>) in

				CResult_boolPeerHandleErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_NoneSendErrorZ_is_ok(o: Result_NoneSendErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_NoneSendErrorZ>) in

				CResult_NoneSendErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_u32GraphSyncErrorZ_is_ok(o: Result_u32GraphSyncErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_u32GraphSyncErrorZ>) in

				CResult_u32GraphSyncErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_NetAddressDecodeErrorZ_is_ok(o: Result_NetAddressDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_NetAddressDecodeErrorZ>) in

				CResult_NetAddressDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_AcceptChannelDecodeErrorZ_is_ok(o: Result_AcceptChannelDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_AcceptChannelDecodeErrorZ>) in

				CResult_AcceptChannelDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_AnnouncementSignaturesDecodeErrorZ_is_ok(o: Result_AnnouncementSignaturesDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_AnnouncementSignaturesDecodeErrorZ>) in

				CResult_AnnouncementSignaturesDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ChannelReestablishDecodeErrorZ_is_ok(o: Result_ChannelReestablishDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ChannelReestablishDecodeErrorZ>) in

				CResult_ChannelReestablishDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ClosingSignedDecodeErrorZ_is_ok(o: Result_ClosingSignedDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ClosingSignedDecodeErrorZ>) in

				CResult_ClosingSignedDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ClosingSignedFeeRangeDecodeErrorZ_is_ok(o: Result_ClosingSignedFeeRangeDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ClosingSignedFeeRangeDecodeErrorZ>) in

				CResult_ClosingSignedFeeRangeDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_CommitmentSignedDecodeErrorZ_is_ok(o: Result_CommitmentSignedDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_CommitmentSignedDecodeErrorZ>) in

				CResult_CommitmentSignedDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_FundingCreatedDecodeErrorZ_is_ok(o: Result_FundingCreatedDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_FundingCreatedDecodeErrorZ>) in

				CResult_FundingCreatedDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_FundingSignedDecodeErrorZ_is_ok(o: Result_FundingSignedDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_FundingSignedDecodeErrorZ>) in

				CResult_FundingSignedDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ChannelReadyDecodeErrorZ_is_ok(o: Result_ChannelReadyDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ChannelReadyDecodeErrorZ>) in

				CResult_ChannelReadyDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_InitDecodeErrorZ_is_ok(o: Result_InitDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_InitDecodeErrorZ>) in

				CResult_InitDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_OpenChannelDecodeErrorZ_is_ok(o: Result_OpenChannelDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_OpenChannelDecodeErrorZ>) in

				CResult_OpenChannelDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_RevokeAndACKDecodeErrorZ_is_ok(o: Result_RevokeAndACKDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_RevokeAndACKDecodeErrorZ>) in

				CResult_RevokeAndACKDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ShutdownDecodeErrorZ_is_ok(o: Result_ShutdownDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ShutdownDecodeErrorZ>) in

				CResult_ShutdownDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_UpdateFailHTLCDecodeErrorZ_is_ok(o: Result_UpdateFailHTLCDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_UpdateFailHTLCDecodeErrorZ>) in

				CResult_UpdateFailHTLCDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_UpdateFailMalformedHTLCDecodeErrorZ_is_ok(o: Result_UpdateFailMalformedHTLCDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_UpdateFailMalformedHTLCDecodeErrorZ>) in

				CResult_UpdateFailMalformedHTLCDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_UpdateFeeDecodeErrorZ_is_ok(o: Result_UpdateFeeDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_UpdateFeeDecodeErrorZ>) in

				CResult_UpdateFeeDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_UpdateFulfillHTLCDecodeErrorZ_is_ok(o: Result_UpdateFulfillHTLCDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_UpdateFulfillHTLCDecodeErrorZ>) in

				CResult_UpdateFulfillHTLCDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_UpdateAddHTLCDecodeErrorZ_is_ok(o: Result_UpdateAddHTLCDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_UpdateAddHTLCDecodeErrorZ>) in

				CResult_UpdateAddHTLCDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_OnionMessageDecodeErrorZ_is_ok(o: Result_OnionMessageDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_OnionMessageDecodeErrorZ>) in

				CResult_OnionMessageDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_PingDecodeErrorZ_is_ok(o: Result_PingDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_PingDecodeErrorZ>) in

				CResult_PingDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_PongDecodeErrorZ_is_ok(o: Result_PongDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_PongDecodeErrorZ>) in

				CResult_PongDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_UnsignedChannelAnnouncementDecodeErrorZ_is_ok(o: Result_UnsignedChannelAnnouncementDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_UnsignedChannelAnnouncementDecodeErrorZ>) in

				CResult_UnsignedChannelAnnouncementDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ChannelAnnouncementDecodeErrorZ_is_ok(o: Result_ChannelAnnouncementDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ChannelAnnouncementDecodeErrorZ>) in

				CResult_ChannelAnnouncementDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_UnsignedChannelUpdateDecodeErrorZ_is_ok(o: Result_UnsignedChannelUpdateDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_UnsignedChannelUpdateDecodeErrorZ>) in

				CResult_UnsignedChannelUpdateDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ChannelUpdateDecodeErrorZ_is_ok(o: Result_ChannelUpdateDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ChannelUpdateDecodeErrorZ>) in

				CResult_ChannelUpdateDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ErrorMessageDecodeErrorZ_is_ok(o: Result_ErrorMessageDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ErrorMessageDecodeErrorZ>) in

				CResult_ErrorMessageDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_WarningMessageDecodeErrorZ_is_ok(o: Result_WarningMessageDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_WarningMessageDecodeErrorZ>) in

				CResult_WarningMessageDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_UnsignedNodeAnnouncementDecodeErrorZ_is_ok(o: Result_UnsignedNodeAnnouncementDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_UnsignedNodeAnnouncementDecodeErrorZ>) in

				CResult_UnsignedNodeAnnouncementDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_NodeAnnouncementDecodeErrorZ_is_ok(o: Result_NodeAnnouncementDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_NodeAnnouncementDecodeErrorZ>) in

				CResult_NodeAnnouncementDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_QueryShortChannelIdsDecodeErrorZ_is_ok(o: Result_QueryShortChannelIdsDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_QueryShortChannelIdsDecodeErrorZ>) in

				CResult_QueryShortChannelIdsDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ReplyShortChannelIdsEndDecodeErrorZ_is_ok(o: Result_ReplyShortChannelIdsEndDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ReplyShortChannelIdsEndDecodeErrorZ>) in

				CResult_ReplyShortChannelIdsEndDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_QueryChannelRangeDecodeErrorZ_is_ok(o: Result_QueryChannelRangeDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_QueryChannelRangeDecodeErrorZ>) in

				CResult_QueryChannelRangeDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_ReplyChannelRangeDecodeErrorZ_is_ok(o: Result_ReplyChannelRangeDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_ReplyChannelRangeDecodeErrorZ>) in

				CResult_ReplyChannelRangeDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_GossipTimestampFilterDecodeErrorZ_is_ok(o: Result_GossipTimestampFilterDecodeErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_GossipTimestampFilterDecodeErrorZ>) in

				CResult_GossipTimestampFilterDecodeErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_InvoiceSignOrCreationErrorZ_is_ok(o: Result_InvoiceSignOrCreationErrorZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_InvoiceSignOrCreationErrorZ>) in

				CResult_InvoiceSignOrCreationErrorZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_CResult_LockedChannelMonitorNoneZ_is_ok(o: Result_LockedChannelMonitorNoneZ) -> Bool {
		
				
				return withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKCResult_LockedChannelMonitorNoneZ>) in

				CResult_LockedChannelMonitorNoneZ_is_ok(oPointer)
				
}
			
	}
	public class func swift_sign(msg: [UInt8], sk: [UInt8]) -> Result_StringErrorZ {
		
				
						let msgWrapper = Bindings.new_LDKu8sliceWrapper(array: msg)
						defer {
							msgWrapper.noOpRetain()
						}
					
				return withUnsafePointer(to: Bindings.array_to_tuple32(array: sk)) { (skPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in

				Result_StringErrorZ(pointer: sign(msgWrapper.cOpaqueStruct!, skPointer))
				
}
			
	}
	public class func swift_recover_pk(msg: [UInt8], sig: String) -> Result_PublicKeyErrorZ {
		
				
						let msgWrapper = Bindings.new_LDKu8sliceWrapper(array: msg)
						defer {
							msgWrapper.noOpRetain()
						}
					
				return 
				Result_PublicKeyErrorZ(pointer: recover_pk(msgWrapper.cOpaqueStruct!, Bindings.new_LDKStr(string: sig, chars_is_owned: true)))
				
			
	}
	public class func swift_verify(msg: [UInt8], sig: String, pk: [UInt8]) -> Bool {
		
				
						let msgWrapper = Bindings.new_LDKu8sliceWrapper(array: msg)
						defer {
							msgWrapper.noOpRetain()
						}
					
				return 
				verify(msgWrapper.cOpaqueStruct!, Bindings.new_LDKStr(string: sig, chars_is_owned: true), Bindings.new_LDKPublicKey(array: pk))
				
			
	}
	public class func swift_construct_invoice_preimage(hrp_bytes: [UInt8], data_without_signature: [UInt8]) -> [UInt8] {
		
				
						let hrp_bytesWrapper = Bindings.new_LDKu8sliceWrapper(array: hrp_bytes)
						defer {
							hrp_bytesWrapper.noOpRetain()
						}
					
						let data_without_signatureWrapper = Bindings.new_LDKCVec_u5ZWrapper(array: data_without_signature)
						defer {
							data_without_signatureWrapper.noOpRetain()
						}
					
				return 
				Bindings.LDKCVec_u8Z_to_array(nativeType: construct_invoice_preimage(hrp_bytesWrapper.cOpaqueStruct!, data_without_signatureWrapper.dangle().cOpaqueStruct!), callerContext: "Bindings::swift_construct_invoice_preimage")
				
			
	}
	public class func swift_C2Tuple_BlockHashChannelMonitorZ_read(ser: [UInt8], arg: KeysInterface) -> Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ {
		
				
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
				return withUnsafePointer(to: arg.activateOnce().cOpaqueStruct!) { (argPointer: UnsafePointer<LDKKeysInterface>) in

				Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ(pointer: C2Tuple_BlockHashChannelMonitorZ_read(serWrapper.cOpaqueStruct!, argPointer))
				
}
			
	}
	public class func swift_provided_node_features() -> NodeFeatures {
		
				
				return 
				NodeFeatures(pointer: provided_node_features())
				
			
	}
	public class func swift_provided_channel_features() -> ChannelFeatures {
		
				
				return 
				ChannelFeatures(pointer: provided_channel_features())
				
			
	}
	public class func swift_provided_init_features() -> InitFeatures {
		
				
				return 
				InitFeatures(pointer: provided_init_features())
				
			
	}
	#warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public class func swift_C2Tuple_BlockHashChannelManagerZ_read(ser: [UInt8], arg: ChannelManagerReadArgs) -> Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ {
		
				
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
				return 
				Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ(pointer: C2Tuple_BlockHashChannelManagerZ_read(serWrapper.cOpaqueStruct!, arg.cOpaqueStruct!))
				
			
	}
	public class func swift_create(keys: ExpandedKey, min_value_msat: Option_u64Z, invoice_expiry_delta_secs: UInt32, keys_manager: KeysInterface, current_time: UInt64) -> Result_C2Tuple_PaymentHashPaymentSecretZNoneZ {
		
				
				return withUnsafePointer(to: keys.cOpaqueStruct!) { (keysPointer: UnsafePointer<LDKExpandedKey>) in
withUnsafePointer(to: keys_manager.activateOnce().cOpaqueStruct!) { (keys_managerPointer: UnsafePointer<LDKKeysInterface>) in

				Result_C2Tuple_PaymentHashPaymentSecretZNoneZ(pointer: create(keysPointer, min_value_msat.danglingClone().cOpaqueStruct!, invoice_expiry_delta_secs, keys_managerPointer, current_time))
				
}
}
			
	}
	public class func swift_create_from_hash(keys: ExpandedKey, min_value_msat: Option_u64Z, payment_hash: [UInt8], invoice_expiry_delta_secs: UInt32, current_time: UInt64) -> Result_PaymentSecretNoneZ {
		
				
				return withUnsafePointer(to: keys.cOpaqueStruct!) { (keysPointer: UnsafePointer<LDKExpandedKey>) in

				Result_PaymentSecretNoneZ(pointer: create_from_hash(keysPointer, min_value_msat.danglingClone().cOpaqueStruct!, Bindings.new_LDKThirtyTwoBytes(array: payment_hash), invoice_expiry_delta_secs, current_time))
				
}
			
	}
	public class func swift_htlc_success_tx_weight(opt_anchors: Bool) -> UInt64 {
		
				
				return 
				htlc_success_tx_weight(opt_anchors)
				
			
	}
	public class func swift_htlc_timeout_tx_weight(opt_anchors: Bool) -> UInt64 {
		
				
				return 
				htlc_timeout_tx_weight(opt_anchors)
				
			
	}
	public class func swift_build_commitment_secret(commitment_seed: [UInt8], idx: UInt64) -> [UInt8] {
		
				
				return withUnsafePointer(to: Bindings.array_to_tuple32(array: commitment_seed)) { (commitment_seedPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in

				Bindings.LDKThirtyTwoBytes_to_array(nativeType: build_commitment_secret(commitment_seedPointer, idx))
				
}
			
	}
	public class func swift_build_closing_transaction(to_holder_value_sat: UInt64, to_counterparty_value_sat: UInt64, to_holder_script: [UInt8], to_counterparty_script: [UInt8], funding_outpoint: OutPoint) -> [UInt8] {
		
				
						let to_holder_scriptWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: to_holder_script)
						defer {
							to_holder_scriptWrapper.noOpRetain()
						}
					
						let to_counterparty_scriptWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: to_counterparty_script)
						defer {
							to_counterparty_scriptWrapper.noOpRetain()
						}
					
				return 
				Bindings.LDKTransaction_to_array(nativeType: build_closing_transaction(to_holder_value_sat, to_counterparty_value_sat, to_holder_scriptWrapper.dangle().cOpaqueStruct!, to_counterparty_scriptWrapper.dangle().cOpaqueStruct!, funding_outpoint.danglingClone().cOpaqueStruct!), callerContext: "Bindings::swift_build_closing_transaction")
				
			
	}
	public class func swift_derive_private_key(per_commitment_point: [UInt8], base_secret: [UInt8]) -> Result_SecretKeyErrorZ {
		
				
				return withUnsafePointer(to: Bindings.array_to_tuple32(array: base_secret)) { (base_secretPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in

				Result_SecretKeyErrorZ(pointer: derive_private_key(Bindings.new_LDKPublicKey(array: per_commitment_point), base_secretPointer))
				
}
			
	}
	public class func swift_derive_public_key(per_commitment_point: [UInt8], base_point: [UInt8]) -> Result_PublicKeyErrorZ {
		
				
				return 
				Result_PublicKeyErrorZ(pointer: derive_public_key(Bindings.new_LDKPublicKey(array: per_commitment_point), Bindings.new_LDKPublicKey(array: base_point)))
				
			
	}
	public class func swift_derive_private_revocation_key(per_commitment_secret: [UInt8], countersignatory_revocation_base_secret: [UInt8]) -> Result_SecretKeyErrorZ {
		
				
				return withUnsafePointer(to: Bindings.array_to_tuple32(array: per_commitment_secret)) { (per_commitment_secretPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
withUnsafePointer(to: Bindings.array_to_tuple32(array: countersignatory_revocation_base_secret)) { (countersignatory_revocation_base_secretPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in

				Result_SecretKeyErrorZ(pointer: derive_private_revocation_key(per_commitment_secretPointer, countersignatory_revocation_base_secretPointer))
				
}
}
			
	}
	public class func swift_derive_public_revocation_key(per_commitment_point: [UInt8], countersignatory_revocation_base_point: [UInt8]) -> Result_PublicKeyErrorZ {
		
				
				return 
				Result_PublicKeyErrorZ(pointer: derive_public_revocation_key(Bindings.new_LDKPublicKey(array: per_commitment_point), Bindings.new_LDKPublicKey(array: countersignatory_revocation_base_point)))
				
			
	}
	public class func swift_get_revokeable_redeemscript(revocation_key: [UInt8], contest_delay: UInt16, broadcaster_delayed_payment_key: [UInt8]) -> [UInt8] {
		
				
				return 
				Bindings.LDKCVec_u8Z_to_array(nativeType: get_revokeable_redeemscript(Bindings.new_LDKPublicKey(array: revocation_key), contest_delay, Bindings.new_LDKPublicKey(array: broadcaster_delayed_payment_key)), callerContext: "Bindings::swift_get_revokeable_redeemscript")
				
			
	}
	public class func swift_get_htlc_redeemscript(htlc: HTLCOutputInCommitment, opt_anchors: Bool, keys: TxCreationKeys) -> [UInt8] {
		
				
				return withUnsafePointer(to: htlc.cOpaqueStruct!) { (htlcPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
withUnsafePointer(to: keys.cOpaqueStruct!) { (keysPointer: UnsafePointer<LDKTxCreationKeys>) in

				Bindings.LDKCVec_u8Z_to_array(nativeType: get_htlc_redeemscript(htlcPointer, opt_anchors, keysPointer), callerContext: "Bindings::swift_get_htlc_redeemscript")
				
}
}
			
	}
	public class func swift_make_funding_redeemscript(broadcaster: [UInt8], countersignatory: [UInt8]) -> [UInt8] {
		
				
				return 
				Bindings.LDKCVec_u8Z_to_array(nativeType: make_funding_redeemscript(Bindings.new_LDKPublicKey(array: broadcaster), Bindings.new_LDKPublicKey(array: countersignatory)), callerContext: "Bindings::swift_make_funding_redeemscript")
				
			
	}
	public class func swift_build_htlc_transaction(commitment_txid: [UInt8], feerate_per_kw: UInt32, contest_delay: UInt16, htlc: HTLCOutputInCommitment, opt_anchors: Bool, broadcaster_delayed_payment_key: [UInt8], revocation_key: [UInt8]) -> [UInt8] {
		
				
				return withUnsafePointer(to: Bindings.array_to_tuple32(array: commitment_txid)) { (commitment_txidPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
withUnsafePointer(to: htlc.cOpaqueStruct!) { (htlcPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in

				Bindings.LDKTransaction_to_array(nativeType: build_htlc_transaction(commitment_txidPointer, feerate_per_kw, contest_delay, htlcPointer, opt_anchors, Bindings.new_LDKPublicKey(array: broadcaster_delayed_payment_key), Bindings.new_LDKPublicKey(array: revocation_key)), callerContext: "Bindings::swift_build_htlc_transaction")
				
}
}
			
	}
	public class func swift_get_anchor_redeemscript(funding_pubkey: [UInt8]) -> [UInt8] {
		
				
				return 
				Bindings.LDKCVec_u8Z_to_array(nativeType: get_anchor_redeemscript(Bindings.new_LDKPublicKey(array: funding_pubkey)), callerContext: "Bindings::swift_get_anchor_redeemscript")
				
			
	}
	public class func swift_get_commitment_transaction_number_obscure_factor(broadcaster_payment_basepoint: [UInt8], countersignatory_payment_basepoint: [UInt8], outbound_from_broadcaster: Bool) -> UInt64 {
		
				
				return 
				get_commitment_transaction_number_obscure_factor(Bindings.new_LDKPublicKey(array: broadcaster_payment_basepoint), Bindings.new_LDKPublicKey(array: countersignatory_payment_basepoint), outbound_from_broadcaster)
				
			
	}
	public class func swift_find_route(our_node_pubkey: [UInt8], route_params: RouteParameters, network_graph: NetworkGraph, first_hops: [ChannelDetails]?, logger: Logger, scorer: Score, random_seed_bytes: [UInt8]) -> Result_RouteLightningErrorZ {
		
				
							var first_hopsPointer: UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>? = nil
							if let first_hopsUnwrapped = first_hops {
								
							let first_hopsUnwrapped = first_hopsUnwrapped.map { (first_hopsCurrentValue) in
							first_hopsCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
								first_hopsPointer = UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>.allocate(capacity: 1)
								first_hopsPointer!.initialize(to: Bindings.new_LDKCVec_ChannelDetailsZWrapper(array: first_hopsUnwrapped).cOpaqueStruct!)
							}
						
				return withUnsafePointer(to: route_params.cOpaqueStruct!) { (route_paramsPointer: UnsafePointer<LDKRouteParameters>) in
withUnsafePointer(to: network_graph.cOpaqueStruct!) { (network_graphPointer: UnsafePointer<LDKNetworkGraph>) in
withUnsafePointer(to: scorer.activateOnce().cOpaqueStruct!) { (scorerPointer: UnsafePointer<LDKScore>) in
withUnsafePointer(to: Bindings.array_to_tuple32(array: random_seed_bytes)) { (random_seed_bytesPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in

				Result_RouteLightningErrorZ(pointer: find_route(Bindings.new_LDKPublicKey(array: our_node_pubkey), route_paramsPointer, network_graphPointer, first_hopsPointer, logger.activate().cOpaqueStruct!, scorerPointer, random_seed_bytesPointer))
				
}
}
}
}
			
	}
	public class func swift_build_route_from_hops(our_node_pubkey: [UInt8], hops: [[UInt8]], route_params: RouteParameters, network_graph: NetworkGraph, logger: Logger, random_seed_bytes: [UInt8]) -> Result_RouteLightningErrorZ {
		
				
						let hopsWrapper = Bindings.new_LDKCVec_PublicKeyZWrapper(array: hops)
						defer {
							hopsWrapper.noOpRetain()
						}
					
				return withUnsafePointer(to: route_params.cOpaqueStruct!) { (route_paramsPointer: UnsafePointer<LDKRouteParameters>) in
withUnsafePointer(to: network_graph.cOpaqueStruct!) { (network_graphPointer: UnsafePointer<LDKNetworkGraph>) in
withUnsafePointer(to: Bindings.array_to_tuple32(array: random_seed_bytes)) { (random_seed_bytesPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in

				Result_RouteLightningErrorZ(pointer: build_route_from_hops(Bindings.new_LDKPublicKey(array: our_node_pubkey), hopsWrapper.dangle().cOpaqueStruct!, route_paramsPointer, network_graphPointer, logger.activate().cOpaqueStruct!, random_seed_bytesPointer))
				
}
}
}
			
	}
	public class func swift_create_phantom_invoice(amt_msat: Option_u64Z, payment_hash: [UInt8], description: String, invoice_expiry_delta_secs: UInt32, phantom_route_hints: [PhantomRouteHints], keys_manager: KeysInterface, logger: Logger, network: LDKCurrency) -> Result_InvoiceSignOrCreationErrorZ {
		
				
							let phantom_route_hintsUnwrapped = phantom_route_hints.map { (phantom_route_hintsCurrentValue) in
							phantom_route_hintsCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
						let phantom_route_hintsWrapper = Bindings.new_LDKCVec_PhantomRouteHintsZWrapper(array: phantom_route_hintsUnwrapped)
						defer {
							phantom_route_hintsWrapper.noOpRetain()
						}
					
				return 
				Result_InvoiceSignOrCreationErrorZ(pointer: create_phantom_invoice(amt_msat.danglingClone().cOpaqueStruct!, Bindings.new_LDKThirtyTwoBytes(array: payment_hash), Bindings.new_LDKStr(string: description, chars_is_owned: true), invoice_expiry_delta_secs, phantom_route_hintsWrapper.dangle().cOpaqueStruct!, keys_manager.activate().cOpaqueStruct!, logger.activate().cOpaqueStruct!, network))
				
			
	}
	public class func swift_create_phantom_invoice_with_description_hash(amt_msat: Option_u64Z, payment_hash: [UInt8], invoice_expiry_delta_secs: UInt32, description_hash: Sha256, phantom_route_hints: [PhantomRouteHints], keys_manager: KeysInterface, logger: Logger, network: LDKCurrency) -> Result_InvoiceSignOrCreationErrorZ {
		
				
							let phantom_route_hintsUnwrapped = phantom_route_hints.map { (phantom_route_hintsCurrentValue) in
							phantom_route_hintsCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
						let phantom_route_hintsWrapper = Bindings.new_LDKCVec_PhantomRouteHintsZWrapper(array: phantom_route_hintsUnwrapped)
						defer {
							phantom_route_hintsWrapper.noOpRetain()
						}
					
				return 
				Result_InvoiceSignOrCreationErrorZ(pointer: create_phantom_invoice_with_description_hash(amt_msat.danglingClone().cOpaqueStruct!, Bindings.new_LDKThirtyTwoBytes(array: payment_hash), invoice_expiry_delta_secs, description_hash.danglingClone().cOpaqueStruct!, phantom_route_hintsWrapper.dangle().cOpaqueStruct!, keys_manager.activate().cOpaqueStruct!, logger.activate().cOpaqueStruct!, network))
				
			
	}
	public class func swift_create_invoice_from_channelmanager(channelmanager: ChannelManager, keys_manager: KeysInterface, logger: Logger, network: LDKCurrency, amt_msat: Option_u64Z, description: String, invoice_expiry_delta_secs: UInt32) -> Result_InvoiceSignOrCreationErrorZ {
		
				
				return withUnsafePointer(to: channelmanager.cOpaqueStruct!) { (channelmanagerPointer: UnsafePointer<LDKChannelManager>) in

				Result_InvoiceSignOrCreationErrorZ(pointer: create_invoice_from_channelmanager(channelmanagerPointer, keys_manager.activate().cOpaqueStruct!, logger.activate().cOpaqueStruct!, network, amt_msat.danglingClone().cOpaqueStruct!, Bindings.new_LDKStr(string: description, chars_is_owned: true), invoice_expiry_delta_secs))
				
}
			
	}
	public class func swift_create_invoice_from_channelmanager_with_description_hash(channelmanager: ChannelManager, keys_manager: KeysInterface, logger: Logger, network: LDKCurrency, amt_msat: Option_u64Z, description_hash: Sha256, invoice_expiry_delta_secs: UInt32) -> Result_InvoiceSignOrCreationErrorZ {
		
				
				return withUnsafePointer(to: channelmanager.cOpaqueStruct!) { (channelmanagerPointer: UnsafePointer<LDKChannelManager>) in

				Result_InvoiceSignOrCreationErrorZ(pointer: create_invoice_from_channelmanager_with_description_hash(channelmanagerPointer, keys_manager.activate().cOpaqueStruct!, logger.activate().cOpaqueStruct!, network, amt_msat.danglingClone().cOpaqueStruct!, description_hash.danglingClone().cOpaqueStruct!, invoice_expiry_delta_secs))
				
}
			
	}
	public class func swift_create_invoice_from_channelmanager_with_description_hash_and_duration_since_epoch(channelmanager: ChannelManager, keys_manager: KeysInterface, logger: Logger, network: LDKCurrency, amt_msat: Option_u64Z, description_hash: Sha256, duration_since_epoch: UInt64, invoice_expiry_delta_secs: UInt32) -> Result_InvoiceSignOrCreationErrorZ {
		
				
				return withUnsafePointer(to: channelmanager.cOpaqueStruct!) { (channelmanagerPointer: UnsafePointer<LDKChannelManager>) in

				Result_InvoiceSignOrCreationErrorZ(pointer: create_invoice_from_channelmanager_with_description_hash_and_duration_since_epoch(channelmanagerPointer, keys_manager.activate().cOpaqueStruct!, logger.activate().cOpaqueStruct!, network, amt_msat.danglingClone().cOpaqueStruct!, description_hash.danglingClone().cOpaqueStruct!, duration_since_epoch, invoice_expiry_delta_secs))
				
}
			
	}
	public class func swift_create_invoice_from_channelmanager_and_duration_since_epoch(channelmanager: ChannelManager, keys_manager: KeysInterface, logger: Logger, network: LDKCurrency, amt_msat: Option_u64Z, description: String, duration_since_epoch: UInt64, invoice_expiry_delta_secs: UInt32) -> Result_InvoiceSignOrCreationErrorZ {
		
				
				return withUnsafePointer(to: channelmanager.cOpaqueStruct!) { (channelmanagerPointer: UnsafePointer<LDKChannelManager>) in

				Result_InvoiceSignOrCreationErrorZ(pointer: create_invoice_from_channelmanager_and_duration_since_epoch(channelmanagerPointer, keys_manager.activate().cOpaqueStruct!, logger.activate().cOpaqueStruct!, network, amt_msat.danglingClone().cOpaqueStruct!, Bindings.new_LDKStr(string: description, chars_is_owned: true), duration_since_epoch, invoice_expiry_delta_secs))
				
}
			
	}

	/* STATIC_METHODS_END */

	static var nativelyExposedInstances = [UInt: NativeTraitWrapper]()
    static var nativelyExposedInstanceReferenceCounter = [UInt: Int]()

    public class func cacheInstance(instance: NativeTraitWrapper, countIdempotently: Bool = false) {
        let key = instance.globalInstanceNumber
        let referenceCount = (Self.nativelyExposedInstanceReferenceCounter[key] ?? 0) + 1
        if (!countIdempotently || referenceCount == 1){
            // if we count non-idempotently, always update the counter
            // otherwise, only update the counter the first time
            Self.nativelyExposedInstanceReferenceCounter[key] = referenceCount
        }
        if referenceCount == 1 {
            print("Caching global instance \(key). Cached instance count: \(nativelyExposedInstanceReferenceCounter.count)")
            Self.nativelyExposedInstances[key] = instance
        }
    }

	public class func instanceToPointer(instance: NativeTraitWrapper) -> UnsafeMutableRawPointer {
        let key = instance.globalInstanceNumber
        let pointer = UnsafeMutableRawPointer(bitPattern: key)!
		// don't automatically cache the trait instance
		Self.nativelyExposedInstances[instance.globalInstanceNumber] = instance
		return pointer
	}

	public class func pointerToInstance<T: NativeTraitWrapper>(pointer: UnsafeRawPointer, sourceMarker: String?) -> T{
        let key = UInt(bitPattern: pointer)
        let referenceCount = Self.nativelyExposedInstanceReferenceCounter[key] ?? 0
        if referenceCount < 1 {
            print("Bad lookup: non-positive reference count for instance \(key): \(referenceCount)!", severity: .ERROR)
        }
        let value = Self.nativelyExposedInstances[key] as! T
		return value
	}

    public class func removeInstancePointer(instance: NativeTraitWrapper) -> Bool {
        let key = instance.globalInstanceNumber
        let referenceCount = (Self.nativelyExposedInstanceReferenceCounter[key] ?? 0) - 1
        Self.nativelyExposedInstanceReferenceCounter[key] = referenceCount
        if referenceCount == 0 {
            print("Uncaching global instance \(key)")
            // TODO: fix counting
            // Self.nativelyExposedInstances.removeValue(forKey: key)
            // instance.pointerDebugDescription = nil
        } else if referenceCount < 0 {
            print("Bad uncache: negative reference count (\(referenceCount)) for instance \(key)!", severity: .ERROR)
        }
        return true
    }

	/*
    public class func clearInstancePointers() {
        for (_, currentInstance) in Self.nativelyExposedInstances {
            currentInstance.pointerDebugDescription = nil
        }
        Self.nativelyExposedInstances.removeAll()
    }
    */

	/* SWIFT_TO_RUST_START */
	public class func new_LDKTransactionWrapper(array: [UInt8]) -> LDKTransactionWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
		let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<UInt8>) -> UnsafeMutablePointer<UInt8> in
			let mutablePointer = UnsafeMutablePointer<UInt8>(mutating: pointer.baseAddress!)
			return mutablePointer
		}
		*/

		let dataContainer = UnsafeMutablePointer<UInt8>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

		let vector = LDKTransaction(data: dataContainer, datalen: UInt(array.count), data_is_owned: true)
		let wrapper = LDKTransactionWrapper(pointer: vector)
		return wrapper
	}

	public class LDKTransactionWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt
		internal private(set) var dangling = false

		internal var cOpaqueStruct: LDKTransaction?
		internal private(set) var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKTransaction){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
		}

		internal init(pointer: LDKTransaction, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
		}

		public func noOpRetain(){}

		internal func dangle() -> LDKTransactionWrapper {
			self.dangling = true
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKTransactionWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKTransactionWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
	/* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
	public class func LDKTransaction_to_array(nativeType: LDKTransaction, callerContext: String, deallocate: Bool = true) -> [UInt8] {
		var array = [UInt8]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		if deallocate && nativeType.datalen > 0 {
			print("Deallocating LDKTransaction (called from \(callerContext))")
			nativeType.data.deallocate()
		} else {
			print("Not deallocating LDKTransaction (called from \(callerContext))")
		}
		return array
	}
	/* RUST_TO_SWIFT_END */

    public class func LDKStr_to_string(nativeType: LDKStr, callerContext: String, deallocate: Bool = true) -> String {
		var array = [UInt8]()
		for index in 0..<Int(nativeType.len) {
			let currentEntry = nativeType.chars[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		let data = Data(bytes: array)
		let string = String(data: data, encoding: .utf8)!
		if deallocate && nativeType.len > 0 {
			print("Deallocating LDKStr (called from \(callerContext))")
			Str_free(nativeType)
		} else {
			print("Not deallocating LDKStr (called from \(callerContext))")
		}
		return string
	}

    public class func UnsafeIntPointer_to_string(nativeType: UnsafePointer<Int8>) -> String {
		let string = String(cString: nativeType)
		return string
	}

    public class func string_to_unsafe_int8_pointer(string: String) -> UnsafePointer<Int8> {
		let count = string.utf8CString.count
		let result: UnsafeMutableBufferPointer<Int8> = UnsafeMutableBufferPointer<Int8>.allocate(capacity: count)
		_ = result.initialize(from: string.utf8CString)
		let mutablePointer = result.baseAddress!
		return UnsafePointer<Int8>(mutablePointer)
	}

	public class func string_to_unsafe_uint8_pointer(string: String) -> UnsafePointer<UInt8> {
		let stringData = string.data(using: .utf8)
		let dataMutablePointer = UnsafeMutablePointer<UInt8>.allocate(capacity: string.count)
		stringData?.copyBytes(to: dataMutablePointer, count: string.count)

		return UnsafePointer<UInt8>(dataMutablePointer)
	}

	public class func new_LDKStr(string: String, chars_is_owned: Bool = false) -> LDKStr {
        let nativeType = Self.string_to_unsafe_uint8_pointer(string: string)
        return LDKStr(chars: nativeType, len: UInt(string.count), chars_is_owned: chars_is_owned)
    }

	/*
    public class func createInvoiceFromChannelManager(channelManager: ChannelManager, keysManager: KeysInterface, network: LDKCurrency, amountMsat: UInt64?, description: String) -> Result_InvoiceSignOrCreationErrorZ {
		let nativeKeysManager = keysManager.cOpaqueStruct!
		let amount = Option_u64Z(value: amountMsat)
		let nativeAmount = amount.cOpaqueStruct!
		let nativeDescription = Self.new_LDKStr(string: description, chars_is_owned: true)
		return withUnsafePointer(to: channelManager.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) -> Result_InvoiceSignOrCreationErrorZ in
			let nativeResult = create_invoice_from_channelmanager(pointer, nativeKeysManager, network, nativeAmount, nativeDescription)
			return Result_InvoiceSignOrCreationErrorZ(pointer: nativeResult)
		}
	}

	public class func getRoute(our_node_id: [UInt8], network: NetworkGraph, payee: [UInt8], payee_features: InvoiceFeatures, first_hops: [LDKChannelDetails], last_hops: [LDKRouteHint], final_value_msat: UInt64, final_cltv: UInt32, logger: Logger) -> Result_RouteLightningErrorZ {
		return withUnsafePointer(to: network.cOpaqueStruct!) { (networkPointer: UnsafePointer<LDKNetworkGraph>) in
			var mutableHops = Bindings.new_LDKCVec_ChannelDetailsZWrapper(array: first_hops).cOpaqueStruct!
			return withUnsafeMutablePointer(to: &mutableHops) { (first_hopsPointer) in
				Result_RouteLightningErrorZ(pointer: get_route(Bindings.new_LDKPublicKey(array: our_node_id), networkPointer, Bindings.new_LDKPublicKey(array: payee), payee_features.cOpaqueStruct!, first_hopsPointer, Bindings.new_LDKCVec_RouteHintZWrapper(array: last_hops).cOpaqueStruct!, final_value_msat, final_cltv, logger.cOpaqueStruct!))
			}
		}
	}
	*/

	public class func get_ldk_swift_bindings_version() -> String {
        return "5cd45049cfb8818d69252c0a918d3da044556c6e"
    }

}

public class InstanceCrashSimulator: NativeTraitWrapper {

    public init() {
		super.init(conflictAvoidingVariableName: 0)
	}

    public func getPointer() -> UnsafeMutableRawPointer {
        let pointer = Bindings.instanceToPointer(instance: self)
        return pointer
    }

}
