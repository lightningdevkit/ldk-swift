//
//  Bindings.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 3/23/21.
//

import Foundation
#if canImport(os)
    import os
#endif

public typealias LDKTransactionOutputs = LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ
public typealias TransactionOutputs = C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ
public typealias LDKTxid = LDKThirtyTwoBytes
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

public class Bindings {

	internal static var minimumPrintSeverity: PrintSeverity = .WARNING
	#if canImport(os)
        internal static let logger = os.Logger(subsystem: Bundle.main.bundleIdentifier!, category: "ldk")
    #endif

    public enum PrintSeverity: UInt {
        case DEBUG = 0
        case WARNING = 1
        case ERROR = 2
    }

    internal class func print(_ string: String, severity: PrintSeverity = .DEBUG) {
        if severity.rawValue >= Self.minimumPrintSeverity.rawValue {
            #if canImport(os)
                if severity == Self.PrintSeverity.DEBUG {
                    logger.debug("\(string)")
                }else if severity == Self.PrintSeverity.WARNING {
                    logger.warning("\(string)")
                }else if severity == Self.PrintSeverity.ERROR {
                    logger.error("\(string)")
                }else {
                    logger.log("\(string)")
                }
            #else
                Swift.print(string)
            #endif
        }
    }

    public class func setLogThreshold(severity: PrintSeverity){
        Self.minimumPrintSeverity = severity
    }

	/* BYTE_ARRAY_METHODS_START */

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

			static func array_to_tuple4(array: [UInt8]) -> (UInt8,UInt8,UInt8,UInt8) {
        		return (array[0], array[1], array[2], array[3])
			}

    		static func tuple4_to_array(nativeType: (UInt8,UInt8,UInt8,UInt8)) -> [UInt8] {
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

			static func array_to_tuple33(array: [UInt8]) -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
        		return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31], array[32])
			}

    		static func tuple33_to_array(nativeType: (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)) -> [UInt8] {
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

			static func array_to_tuple68(array: [UInt8]) -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
        		return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31], array[32], array[33], array[34], array[35], array[36], array[37], array[38], array[39], array[40], array[41], array[42], array[43], array[44], array[45], array[46], array[47], array[48], array[49], array[50], array[51], array[52], array[53], array[54], array[55], array[56], array[57], array[58], array[59], array[60], array[61], array[62], array[63], array[64], array[65], array[66], array[67])
			}

    		static func tuple68_to_array(nativeType: (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)) -> [UInt8] {
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

			static func array_to_tuple32(array: [UInt8]) -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
        		return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31])
			}

    		static func tuple32_to_array(nativeType: (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)) -> [UInt8] {
				let array = [nativeType.0, nativeType.1, nativeType.2, nativeType.3, nativeType.4, nativeType.5, nativeType.6, nativeType.7, nativeType.8, nativeType.9, nativeType.10, nativeType.11, nativeType.12, nativeType.13, nativeType.14, nativeType.15, nativeType.16, nativeType.17, nativeType.18, nativeType.19, nativeType.20, nativeType.21, nativeType.22, nativeType.23, nativeType.24, nativeType.25, nativeType.26, nativeType.27, nativeType.28, nativeType.29, nativeType.30, nativeType.31]
				return array
			}
			

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

			static func array_to_tuple64(array: [UInt8]) -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
        		return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31], array[32], array[33], array[34], array[35], array[36], array[37], array[38], array[39], array[40], array[41], array[42], array[43], array[44], array[45], array[46], array[47], array[48], array[49], array[50], array[51], array[52], array[53], array[54], array[55], array[56], array[57], array[58], array[59], array[60], array[61], array[62], array[63])
			}

    		static func tuple64_to_array(nativeType: (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)) -> [UInt8] {
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

			static func array_to_tuple16(array: [UInt8]) -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
        		return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15])
			}

    		static func tuple16_to_array(nativeType: (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)) -> [UInt8] {
				let array = [nativeType.0, nativeType.1, nativeType.2, nativeType.3, nativeType.4, nativeType.5, nativeType.6, nativeType.7, nativeType.8, nativeType.9, nativeType.10, nativeType.11, nativeType.12, nativeType.13, nativeType.14, nativeType.15]
				return array
			}
			

	public class func new_LDKTenBytes(array: [UInt8]) -> LDKTenBytes {
		let byteType = LDKTenBytes(data: (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9]))
		// let wrapper = LDKTenBytesWrapper(pointer: byteType)
		return byteType
	}

	public class func LDKTenBytes_to_array(nativeType: LDKTenBytes) -> [UInt8] {
		let array = [nativeType.data.0, nativeType.data.1, nativeType.data.2, nativeType.data.3, nativeType.data.4, nativeType.data.5, nativeType.data.6, nativeType.data.7, nativeType.data.8, nativeType.data.9]
		return array
	}
	/*
	public class LDKTenBytesWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt
		internal private(set) var dangling = false

		public var cOpaqueStruct: LDKTenBytes?

		public init(pointer: LDKTenBytes){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
		}

		internal func dangle() -> LDKTenBytesWrapper {
			self.dangling = true
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKTenBytesWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKTenBytesWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
	*/

			static func array_to_tuple10(array: [UInt8]) -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
        		return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9])
			}

    		static func tuple10_to_array(nativeType: (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)) -> [UInt8] {
				let array = [nativeType.0, nativeType.1, nativeType.2, nativeType.3, nativeType.4, nativeType.5, nativeType.6, nativeType.7, nativeType.8, nativeType.9]
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

			static func array_to_tuple3(array: [UInt8]) -> (UInt8,UInt8,UInt8) {
        		return (array[0], array[1], array[2])
			}

    		static func tuple3_to_array(nativeType: (UInt8,UInt8,UInt8)) -> [UInt8] {
				let array = [nativeType.0, nativeType.1, nativeType.2]
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

			static func array_to_tuple20(array: [UInt8]) -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
        		return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19])
			}

    		static func tuple20_to_array(nativeType: (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)) -> [UInt8] {
				let array = [nativeType.0, nativeType.1, nativeType.2, nativeType.3, nativeType.4, nativeType.5, nativeType.6, nativeType.7, nativeType.8, nativeType.9, nativeType.10, nativeType.11, nativeType.12, nativeType.13, nativeType.14, nativeType.15, nativeType.16, nativeType.17, nativeType.18, nativeType.19]
				return array
			}
			

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
    public class func LDKCVec_APIErrorZ_to_array(nativeType: LDKCVec_APIErrorZ, deallocate: Bool = true) -> [LDKAPIError] {
		var array = [LDKAPIError]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_BalanceZ_to_array(nativeType: LDKCVec_BalanceZ, deallocate: Bool = true) -> [LDKBalance] {
		var array = [LDKBalance]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_C2Tuple_BlockHashChannelMonitorZZ_to_array(nativeType: LDKCVec_C2Tuple_BlockHashChannelMonitorZZ, deallocate: Bool = true) -> [LDKC2Tuple_BlockHashChannelMonitorZ] {
		var array = [LDKC2Tuple_BlockHashChannelMonitorZ]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_C2Tuple_PublicKeyTypeZZ_to_array(nativeType: LDKCVec_C2Tuple_PublicKeyTypeZZ, deallocate: Bool = true) -> [LDKC2Tuple_PublicKeyTypeZ] {
		var array = [LDKC2Tuple_PublicKeyTypeZ]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ_to_array(nativeType: LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ, deallocate: Bool = true) -> [LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ] {
		var array = [LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_C2Tuple_u32ScriptZZ_to_array(nativeType: LDKCVec_C2Tuple_u32ScriptZZ, deallocate: Bool = true) -> [LDKC2Tuple_u32ScriptZ] {
		var array = [LDKC2Tuple_u32ScriptZ]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_C2Tuple_u32TxOutZZ_to_array(nativeType: LDKCVec_C2Tuple_u32TxOutZZ, deallocate: Bool = true) -> [LDKC2Tuple_u32TxOutZ] {
		var array = [LDKC2Tuple_u32TxOutZ]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_C2Tuple_usizeTransactionZZ_to_array(nativeType: LDKCVec_C2Tuple_usizeTransactionZZ, deallocate: Bool = true) -> [LDKC2Tuple_usizeTransactionZ] {
		var array = [LDKC2Tuple_usizeTransactionZ]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
	public class func new_LDKCVec_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZWrapper(array: [LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ]) -> LDKCVec_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ>) -> UnsafeMutablePointer<LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ> in
            let mutablePointer = UnsafeMutablePointer<LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ_to_array(nativeType: LDKCVec_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ, deallocate: Bool = true) -> [LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ] {
		var array = [LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZArray(array: [C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ]) -> [LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ] {
							return array.map { entry -> LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ in
								entry.danglingClone().cOpaqueStruct!
							}
						}
						
						public class func wrapNativeLDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZArray(array: [LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ]) -> [C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ] {
							return array.map { entry -> C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ in
								C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ(pointer: entry)
							}
						}
						
						public class func wrapDanglingNativeLDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZArray(array: [LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ]) -> [C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ] {
							return array.map { entry -> C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ in
								C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZArray(array: [LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ]) -> [LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ] {
								return array.map { entry -> LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
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
    public class func LDKCVec_CResult_NoneAPIErrorZZ_to_array(nativeType: LDKCVec_CResult_NoneAPIErrorZZ, deallocate: Bool = true) -> [LDKCResult_NoneAPIErrorZ] {
		var array = [LDKCResult_NoneAPIErrorZ]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
						let convertedEntry = new_LDKCVec_RouteHopZWrapper(array: currentEntry)
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
    public class func LDKCVec_CVec_RouteHopZZ_to_array(nativeType: LDKCVec_CVec_RouteHopZZ, deallocate: Bool = true) -> [[LDKRouteHop]] {
		var array = [[LDKRouteHop]]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			let convertedEntry = LDKCVec_RouteHopZ_to_array(nativeType: currentEntry)
			array.append(convertedEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */

	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_CVec_u8ZZWrapper(array: [[UInt8]]) -> LDKCVec_CVec_u8ZZWrapper {
		
					var lowerDimension = [LDKCVec_u8Z]()
					var subdimensionWrapper = [LDKCVec_u8ZWrapper]()
					for currentEntry in array {
						let convertedEntry = new_LDKCVec_u8ZWrapper(array: currentEntry)
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
    public class func LDKCVec_CVec_u8ZZ_to_array(nativeType: LDKCVec_CVec_u8ZZ, deallocate: Bool = true) -> [[UInt8]] {
		var array = [[UInt8]]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			let convertedEntry = LDKCVec_u8Z_to_array(nativeType: currentEntry)
			array.append(convertedEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_ChannelDetailsZ_to_array(nativeType: LDKCVec_ChannelDetailsZ, deallocate: Bool = true) -> [LDKChannelDetails] {
		var array = [LDKChannelDetails]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_ChannelMonitorZ_to_array(nativeType: LDKCVec_ChannelMonitorZ, deallocate: Bool = true) -> [LDKChannelMonitor] {
		var array = [LDKChannelMonitor]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_EventZ_to_array(nativeType: LDKCVec_EventZ, deallocate: Bool = true) -> [LDKEvent] {
		var array = [LDKEvent]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_MessageSendEventZ_to_array(nativeType: LDKCVec_MessageSendEventZ, deallocate: Bool = true) -> [LDKMessageSendEvent] {
		var array = [LDKMessageSendEvent]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_MonitorEventZ_to_array(nativeType: LDKCVec_MonitorEventZ, deallocate: Bool = true) -> [LDKMonitorEvent] {
		var array = [LDKMonitorEvent]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_NetAddressZ_to_array(nativeType: LDKCVec_NetAddressZ, deallocate: Bool = true) -> [LDKNetAddress] {
		var array = [LDKNetAddress]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
	public class func new_LDKCVec_NodeAnnouncementZWrapper(array: [LDKNodeAnnouncement]) -> LDKCVec_NodeAnnouncementZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKNodeAnnouncement>) -> UnsafeMutablePointer<LDKNodeAnnouncement> in
            let mutablePointer = UnsafeMutablePointer<LDKNodeAnnouncement>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKNodeAnnouncement>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_NodeAnnouncementZ(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_NodeAnnouncementZWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_NodeAnnouncementZWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_NodeAnnouncementZ?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_NodeAnnouncementZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_NodeAnnouncementZ, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_NodeAnnouncementZWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_NodeAnnouncementZWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_NodeAnnouncementZWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_NodeAnnouncementZ_to_array(nativeType: LDKCVec_NodeAnnouncementZ, deallocate: Bool = true) -> [LDKNodeAnnouncement] {
		var array = [LDKNodeAnnouncement]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */
						public class func extractNativeLDKNodeAnnouncementArray(array: [NodeAnnouncement]) -> [LDKNodeAnnouncement] {
							return array.map { entry -> LDKNodeAnnouncement in
								entry.danglingClone().cOpaqueStruct!
							}
						}
						
						public class func wrapNativeLDKNodeAnnouncementArray(array: [LDKNodeAnnouncement]) -> [NodeAnnouncement] {
							return array.map { entry -> NodeAnnouncement in
								NodeAnnouncement(pointer: entry)
							}
						}
						
						public class func wrapDanglingNativeLDKNodeAnnouncementArray(array: [LDKNodeAnnouncement]) -> [NodeAnnouncement] {
							return array.map { entry -> NodeAnnouncement in
								NodeAnnouncement(pointer: entry).dangle()
							}
						}
					
							internal class func cloneNativeLDKNodeAnnouncementArray(array: [LDKNodeAnnouncement]) -> [LDKNodeAnnouncement] {
								return array.map { entry -> LDKNodeAnnouncement in
									// create a wrapper around the native object, dangle it to make it non-destructive, clone it, and then dangle the clone
									NodeAnnouncement(pointer: entry).dangle().clone().dangle().cOpaqueStruct!
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
    public class func LDKCVec_OutPointZ_to_array(nativeType: LDKCVec_OutPointZ, deallocate: Bool = true) -> [LDKOutPoint] {
		var array = [LDKOutPoint]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_PrivateRouteZ_to_array(nativeType: LDKCVec_PrivateRouteZ, deallocate: Bool = true) -> [LDKPrivateRoute] {
		var array = [LDKPrivateRoute]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
						let convertedEntry = new_LDKPublicKey(array: currentEntry)
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
    public class func LDKCVec_PublicKeyZ_to_array(nativeType: LDKCVec_PublicKeyZ, deallocate: Bool = true) -> [[UInt8]] {
		var array = [[UInt8]]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			let convertedEntry = LDKPublicKey_to_array(nativeType: currentEntry)
			array.append(convertedEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
					}
				
		return array
	}
	/* RUST_TO_SWIFT_END */

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
    public class func LDKCVec_RouteHintZ_to_array(nativeType: LDKCVec_RouteHintZ, deallocate: Bool = true) -> [LDKRouteHint] {
		var array = [LDKRouteHint]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_RouteHopZ_to_array(nativeType: LDKCVec_RouteHopZ, deallocate: Bool = true) -> [LDKRouteHop] {
		var array = [LDKRouteHop]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
						let convertedEntry = new_LDKSignature(array: currentEntry)
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
    public class func LDKCVec_SignatureZ_to_array(nativeType: LDKCVec_SignatureZ, deallocate: Bool = true) -> [[UInt8]] {
		var array = [[UInt8]]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			let convertedEntry = LDKSignature_to_array(nativeType: currentEntry)
			array.append(convertedEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_SpendableOutputDescriptorZ_to_array(nativeType: LDKCVec_SpendableOutputDescriptorZ, deallocate: Bool = true) -> [LDKSpendableOutputDescriptor] {
		var array = [LDKSpendableOutputDescriptor]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_TransactionOutputsZ_to_array(nativeType: LDKCVec_TransactionOutputsZ, deallocate: Bool = true) -> [LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ] {
		var array = [LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
						let convertedEntry = new_LDKTransactionWrapper(array: currentEntry)
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
    public class func LDKCVec_TransactionZ_to_array(nativeType: LDKCVec_TransactionZ, deallocate: Bool = true) -> [[UInt8]] {
		var array = [[UInt8]]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			let convertedEntry = LDKTransaction_to_array(nativeType: currentEntry)
			array.append(convertedEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_TxOutZ_to_array(nativeType: LDKCVec_TxOutZ, deallocate: Bool = true) -> [LDKTxOut] {
		var array = [LDKTxOut]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
	public class func new_LDKCVec_TxidZWrapper(array: [LDKThirtyTwoBytes]) -> LDKCVec_TxidZWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<LDKThirtyTwoBytes>) -> UnsafeMutablePointer<LDKThirtyTwoBytes> in
            let mutablePointer = UnsafeMutablePointer<LDKThirtyTwoBytes>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<LDKThirtyTwoBytes>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

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
    public class func LDKCVec_TxidZ_to_array(nativeType: LDKCVec_TxidZ, deallocate: Bool = true) -> [LDKThirtyTwoBytes] {
		var array = [LDKThirtyTwoBytes]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_UpdateAddHTLCZ_to_array(nativeType: LDKCVec_UpdateAddHTLCZ, deallocate: Bool = true) -> [LDKUpdateAddHTLC] {
		var array = [LDKUpdateAddHTLC]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_UpdateFailHTLCZ_to_array(nativeType: LDKCVec_UpdateFailHTLCZ, deallocate: Bool = true) -> [LDKUpdateFailHTLC] {
		var array = [LDKUpdateFailHTLC]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_UpdateFailMalformedHTLCZ_to_array(nativeType: LDKCVec_UpdateFailMalformedHTLCZ, deallocate: Bool = true) -> [LDKUpdateFailMalformedHTLC] {
		var array = [LDKUpdateFailMalformedHTLC]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_UpdateFulfillHTLCZ_to_array(nativeType: LDKCVec_UpdateFulfillHTLCZ, deallocate: Bool = true) -> [LDKUpdateFulfillHTLC] {
		var array = [LDKUpdateFulfillHTLC]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_u64Z_to_array(nativeType: LDKCVec_u64Z, deallocate: Bool = true) -> [UInt64] {
		var array = [UInt64]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
    public class func LDKCVec_u8Z_to_array(nativeType: LDKCVec_u8Z, deallocate: Bool = true) -> [UInt8] {
		var array = [UInt8]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		
					if deallocate && nativeType.datalen > 0 {
						nativeType.data.deallocate()
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
				Bindings.LDKStr_to_string(nativeType: _ldk_get_compiled_version())
				
			
	}
	public class func swift_ldk_c_bindings_get_compiled_version() -> String {
		
				
				return 
				Bindings.LDKStr_to_string(nativeType: _ldk_c_bindings_get_compiled_version())
				
			
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
				Result_PublicKeyErrorZ(pointer: recover_pk(msgWrapper.cOpaqueStruct!, Bindings.new_LDKStr(string: sig)))
				
			
	}
	public class func swift_verify(msg: [UInt8], sig: String, pk: [UInt8]) -> Bool {
		
				
						let msgWrapper = Bindings.new_LDKu8sliceWrapper(array: msg)
						defer {
							msgWrapper.noOpRetain()
						}
					
				return 
				verify(msgWrapper.cOpaqueStruct!, Bindings.new_LDKStr(string: sig), Bindings.new_LDKPublicKey(array: pk))
				
			
	}
	public class func swift_C2Tuple_BlockHashChannelMonitorZ_read(ser: [UInt8], arg: KeysInterface) -> Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ {
		
				
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
				return withUnsafePointer(to: arg.cOpaqueStruct!) { (argPointer: UnsafePointer<LDKKeysInterface>) in

				Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ(pointer: C2Tuple_BlockHashChannelMonitorZ_read(serWrapper.cOpaqueStruct!, argPointer))
				
}
			
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
	public class func swift_Result_read(ser: [UInt8]) -> Result_CResult_NetAddressu8ZDecodeErrorZ {
		
				
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
				return 
				Result_CResult_NetAddressu8ZDecodeErrorZ(pointer: Result_read(serWrapper.cOpaqueStruct!))
				
			
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
				Bindings.LDKTransaction_to_array(nativeType: build_closing_transaction(to_holder_value_sat, to_counterparty_value_sat, to_holder_scriptWrapper.dangle().cOpaqueStruct!, to_counterparty_scriptWrapper.dangle().cOpaqueStruct!, funding_outpoint.danglingClone().cOpaqueStruct!))
				
			
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
				Bindings.LDKCVec_u8Z_to_array(nativeType: get_revokeable_redeemscript(Bindings.new_LDKPublicKey(array: revocation_key), contest_delay, Bindings.new_LDKPublicKey(array: broadcaster_delayed_payment_key)))
				
			
	}
	public class func swift_get_htlc_redeemscript(htlc: HTLCOutputInCommitment, keys: TxCreationKeys) -> [UInt8] {
		
				
				return withUnsafePointer(to: htlc.cOpaqueStruct!) { (htlcPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
withUnsafePointer(to: keys.cOpaqueStruct!) { (keysPointer: UnsafePointer<LDKTxCreationKeys>) in

				Bindings.LDKCVec_u8Z_to_array(nativeType: get_htlc_redeemscript(htlcPointer, keysPointer))
				
}
}
			
	}
	public class func swift_make_funding_redeemscript(broadcaster: [UInt8], countersignatory: [UInt8]) -> [UInt8] {
		
				
				return 
				Bindings.LDKCVec_u8Z_to_array(nativeType: make_funding_redeemscript(Bindings.new_LDKPublicKey(array: broadcaster), Bindings.new_LDKPublicKey(array: countersignatory)))
				
			
	}
	public class func swift_build_htlc_transaction(commitment_txid: [UInt8], feerate_per_kw: UInt32, contest_delay: UInt16, htlc: HTLCOutputInCommitment, broadcaster_delayed_payment_key: [UInt8], revocation_key: [UInt8]) -> [UInt8] {
		
				
				return withUnsafePointer(to: Bindings.array_to_tuple32(array: commitment_txid)) { (commitment_txidPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
withUnsafePointer(to: htlc.cOpaqueStruct!) { (htlcPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in

				Bindings.LDKTransaction_to_array(nativeType: build_htlc_transaction(commitment_txidPointer, feerate_per_kw, contest_delay, htlcPointer, Bindings.new_LDKPublicKey(array: broadcaster_delayed_payment_key), Bindings.new_LDKPublicKey(array: revocation_key)))
				
}
}
			
	}
	public class func swift_get_commitment_transaction_number_obscure_factor(broadcaster_payment_basepoint: [UInt8], countersignatory_payment_basepoint: [UInt8], outbound_from_broadcaster: Bool) -> UInt64 {
		
				
				return 
				get_commitment_transaction_number_obscure_factor(Bindings.new_LDKPublicKey(array: broadcaster_payment_basepoint), Bindings.new_LDKPublicKey(array: countersignatory_payment_basepoint), outbound_from_broadcaster)
				
			
	}
	public class func swift_get_keysend_route(our_node_pubkey: [UInt8], network: NetworkGraph, payee: [UInt8], first_hops: [ChannelDetails]?, last_hops: [RouteHint], final_value_msat: UInt64, final_cltv: UInt32, logger: Logger, scorer: Score) -> Result_RouteLightningErrorZ {
		
				
							var first_hopsPointer: UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>? = nil
							if let first_hopsUnwrapped = first_hops {
								
							let first_hopsUnwrapped = first_hopsUnwrapped.map { (first_hopsCurrentValue) in
							first_hopsCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
								first_hopsPointer = UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>.allocate(capacity: 1)
								first_hopsPointer!.initialize(to: Bindings.new_LDKCVec_ChannelDetailsZWrapper(array: first_hopsUnwrapped).cOpaqueStruct!)
							}
						
							let last_hopsUnwrapped = last_hops.map { (last_hopsCurrentValue) in
							last_hopsCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
						let last_hopsWrapper = Bindings.new_LDKCVec_RouteHintZWrapper(array: last_hopsUnwrapped)
						defer {
							last_hopsWrapper.noOpRetain()
						}
					
				return withUnsafePointer(to: network.cOpaqueStruct!) { (networkPointer: UnsafePointer<LDKNetworkGraph>) in
withUnsafePointer(to: scorer.cOpaqueStruct!) { (scorerPointer: UnsafePointer<LDKScore>) in

				Result_RouteLightningErrorZ(pointer: get_keysend_route(Bindings.new_LDKPublicKey(array: our_node_pubkey), networkPointer, Bindings.new_LDKPublicKey(array: payee), first_hopsPointer, last_hopsWrapper.dangle().cOpaqueStruct!, final_value_msat, final_cltv, logger.cOpaqueStruct!, scorerPointer))
				
}
}
			
	}
	public class func swift_get_route(our_node_pubkey: [UInt8], network: NetworkGraph, payee: [UInt8], payee_features: InvoiceFeatures, first_hops: [ChannelDetails]?, last_hops: [RouteHint], final_value_msat: UInt64, final_cltv: UInt32, logger: Logger, scorer: Score) -> Result_RouteLightningErrorZ {
		
				
							var first_hopsPointer: UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>? = nil
							if let first_hopsUnwrapped = first_hops {
								
							let first_hopsUnwrapped = first_hopsUnwrapped.map { (first_hopsCurrentValue) in
							first_hopsCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
								first_hopsPointer = UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>.allocate(capacity: 1)
								first_hopsPointer!.initialize(to: Bindings.new_LDKCVec_ChannelDetailsZWrapper(array: first_hopsUnwrapped).cOpaqueStruct!)
							}
						
							let last_hopsUnwrapped = last_hops.map { (last_hopsCurrentValue) in
							last_hopsCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
						let last_hopsWrapper = Bindings.new_LDKCVec_RouteHintZWrapper(array: last_hopsUnwrapped)
						defer {
							last_hopsWrapper.noOpRetain()
						}
					
				return withUnsafePointer(to: network.cOpaqueStruct!) { (networkPointer: UnsafePointer<LDKNetworkGraph>) in
withUnsafePointer(to: scorer.cOpaqueStruct!) { (scorerPointer: UnsafePointer<LDKScore>) in

				Result_RouteLightningErrorZ(pointer: get_route(Bindings.new_LDKPublicKey(array: our_node_pubkey), networkPointer, Bindings.new_LDKPublicKey(array: payee), payee_features.danglingClone().cOpaqueStruct!, first_hopsPointer, last_hopsWrapper.dangle().cOpaqueStruct!, final_value_msat, final_cltv, logger.cOpaqueStruct!, scorerPointer))
				
}
}
			
	}
	public class func swift_check_platform() -> Void {
		
				
				
				check_platform()
				
			
	}
	public class func swift_create_invoice_from_channelmanager(channelmanager: ChannelManager, keys_manager: KeysInterface, network: LDKCurrency, amt_msat: Option_u64Z, description: String) -> Result_InvoiceSignOrCreationErrorZ {
		
				
				return withUnsafePointer(to: channelmanager.cOpaqueStruct!) { (channelmanagerPointer: UnsafePointer<LDKChannelManager>) in

				Result_InvoiceSignOrCreationErrorZ(pointer: create_invoice_from_channelmanager(channelmanagerPointer, keys_manager.cOpaqueStruct!, network, amt_msat.danglingClone().cOpaqueStruct!, Bindings.new_LDKStr(string: description)))
				
}
			
	}

	/* STATIC_METHODS_END */

	static var nativelyExposedInstances = [String: NativeTypeWrapper]()

	public class func instanceToPointer(instance: NativeTypeWrapper) -> UnsafeMutableRawPointer {
		let pointer = Unmanaged.passUnretained(instance).toOpaque()
        instance.pointerDebugDescription = pointer.debugDescription
		Self.nativelyExposedInstances[pointer.debugDescription] = instance
		return pointer
	}

	public class func pointerToInstance<T: NativeTypeWrapper>(pointer: UnsafeRawPointer, sourceMarker: String?) -> T{

		let callStack = Thread.callStackSymbols
		let caller = sourceMarker ?? callStack[1]
		// print("Retrieving instance from pointer for caller: \(caller)")
		// let value = Unmanaged<T>.fromOpaque(pointer).takeUnretainedValue()
		let value = Self.nativelyExposedInstances[pointer.debugDescription] as! T
		// print("Instance retrieved for caller: \(caller)")
		return value
	}

    public class func removeInstancePointer(instance: NativeTypeWrapper) -> Bool {
        guard let debugDescription = instance.pointerDebugDescription else {
            return false
        }
        Self.nativelyExposedInstances.removeValue(forKey: debugDescription)
        instance.pointerDebugDescription = nil
        return true
    }

    public class func clearInstancePointers() {
        for (_, currentInstance) in Self.nativelyExposedInstances {
            currentInstance.pointerDebugDescription = nil
        }
        Self.nativelyExposedInstances.removeAll()
    }

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
	public class func LDKTransaction_to_array(nativeType: LDKTransaction, deallocate: Bool = true) -> [UInt8] {
		var array = [UInt8]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		if deallocate && nativeType.datalen > 0 {
			nativeType.data.deallocate()
		}
		return array
	}
	/* RUST_TO_SWIFT_END */

    public class func LDKStr_to_string(nativeType: LDKStr) -> String {
		var array = [UInt8]()
		for index in 0..<Int(nativeType.len) {
			let currentEntry = nativeType.chars[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		let data = Data(bytes: array)
		let string = String(data: data, encoding: .utf8)!
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

    public class func createInvoiceFromChannelManager(channelManager: ChannelManager, keysManager: KeysInterface, network: LDKCurrency, amountMsat: UInt64?, description: String) -> Result_InvoiceSignOrCreationErrorZ {
		let nativeKeysManager = keysManager.cOpaqueStruct!
		let amount = Option_u64Z(value: amountMsat)
		let nativeAmount = amount.cOpaqueStruct!
		let nativeDescription = Self.new_LDKStr(string: description)
		return withUnsafePointer(to: channelManager.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) -> Result_InvoiceSignOrCreationErrorZ in
			let nativeResult = create_invoice_from_channelmanager(pointer, nativeKeysManager, network, nativeAmount, nativeDescription)
			return Result_InvoiceSignOrCreationErrorZ(pointer: nativeResult)
		}
	}

	/*
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
        return "556d959a4572b40920b57394eef4a3c04a514839"
    }

}

public class InstanceCrashSimulator: NativeTypeWrapper {

    public init() {
		super.init(conflictAvoidingVariableName: 0)
	}

    public func getPointer() -> UnsafeMutableRawPointer {
        let pointer = Bindings.instanceToPointer(instance: self)
        return pointer
    }

}
