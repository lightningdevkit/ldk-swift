import {BaseTypeGenerator} from './base_type_generator.mjs';
import {RustType} from '../rust_types.mjs';
import Generator from './index.mjs';

export class GlobalBindingsStruct extends RustType {
}

export default class BindingsFileGenerator extends BaseTypeGenerator<GlobalBindingsStruct> {

	generateFileContents(bindingsStruct: GlobalBindingsStruct): string {

		let generatedMethods = '';
		for (const currentMethod of bindingsStruct.methods) {
			if (currentMethod.name.startsWith('__')) {
				// no need for __unmangle_inner_ptr
				continue;
			}
			// this call is the sole reason we need this inheritance
			generatedMethods += Generator.reindentCode(this.generateMethod(currentMethod), 4);
		}

		for (const currentMethod of this.auxiliaryArtifacts.methods) {
			// this call is the sole reason we need this inheritance
			const swiftMethodName = this.swiftMethodName(currentMethod.method);
			const methodCode = this.generateMethod(currentMethod.method);
			const renamedMethodCode = methodCode
			.replace(swiftMethodName, currentMethod.swiftName);
			generatedMethods += Generator.reindentCode(renamedMethodCode, 4);
		}

		let generatedTupleTypeAliases = '';
		let generatedTupleConverters = '';
		let generatedTupleComparators = ''

		for (const [rawSwiftTypeSignature, tupleSizes] of Object.entries(this.auxiliaryArtifacts.tuples)) {
			for (const currentTupleSize of tupleSizes) {
				const tupleTypeName = `${rawSwiftTypeSignature}Tuple${currentTupleSize}`;
				generatedTupleTypeAliases += `
					internal typealias ${tupleTypeName} = (${Array(currentTupleSize).fill(rawSwiftTypeSignature)
				.join(', ')})
				`;

				let tupleResultComponents = [];
				let arrayResultComponents = [];
				let comparator = [];
				for (let i = 0; i < currentTupleSize; i++) {
					tupleResultComponents.push(`array[${i}]`);
					arrayResultComponents.push(`tuple.${i}`);
					comparator.push(`tupleA.${i} == tupleB.${i}`)
				}

				generatedTupleConverters += `
					internal class func arrayTo${tupleTypeName}(array: [${rawSwiftTypeSignature}]) -> ${tupleTypeName} {
						return (${tupleResultComponents.join(', ')})
					}

					internal class func ${tupleTypeName}ToArray(tuple: ${tupleTypeName}) -> [${rawSwiftTypeSignature}] {
						return [${arrayResultComponents.join(', ')}]
					}
				`;

				if (currentTupleSize >= 7) {
					generatedTupleComparators += `
						func == (tupleA: Bindings.${tupleTypeName}, tupleB: Bindings.${tupleTypeName}) -> Bool {
   							return ${comparator.join(' && ')}
						}
					`;
				}
			}
		}

		return `
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

			open class NativeTypeWrapper: Hashable {

				enum AnchorError: Error {
					case cyclicReference
				}

				private static var globalInstanceCounter: UInt = 0
				internal let globalInstanceNumber: UInt
				internal let instantiationContext: String
				internal var dangling = false
				internal private(set) var anchors: Set<NativeTypeWrapper> = []
				internal var pointerDebugDescription: String? = nil

				init(conflictAvoidingVariableName: UInt, instantiationContext: String) {
					Self.globalInstanceCounter += 1
					self.globalInstanceNumber = Self.globalInstanceCounter
					self.instantiationContext = instantiationContext
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

				internal func noOpRetain() {
					/* there to make sure object gets retained until after this call */
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

				internal static var suspendFreedom = false

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
						// 		logger.debug("\\(string)")
						// 	}else if severity == Self.PrintSeverity.WARNING {
						// 		logger.warning("\\(string)")
						// 	}else if severity == Self.PrintSeverity.ERROR {
						// 		logger.error("\\(string)")
						// 	}else {
						// 		logger.log("\\(string)")
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
						print("Caching global instance \\(key). Cached instance count: \\(nativelyExposedInstanceReferenceCounter.count)")
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
						print("Bad lookup: non-positive reference count for instance \\(key): \\(referenceCount)!", severity: .ERROR)
					}
					let value = Self.nativelyExposedInstances[key] as! T
					return value
				}

				public class func removeInstancePointer(instance: NativeTraitWrapper) -> Bool {
					let key = instance.globalInstanceNumber
					let referenceCount = (Self.nativelyExposedInstanceReferenceCounter[key] ?? 0) - 1
					Self.nativelyExposedInstanceReferenceCounter[key] = referenceCount
					if referenceCount == 0 {
						print("Uncaching global instance \\(key)")
						// TODO: fix counting
						// Self.nativelyExposedInstances.removeValue(forKey: key)
						// instance.pointerDebugDescription = nil
					} else if referenceCount < 0 {
						print("Bad uncache: negative reference count (\\(referenceCount)) for instance \\(key)!", severity: .ERROR)
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

				${generatedMethods}

				${Generator.reindentCode(generatedTupleTypeAliases, 4)}

				${Generator.reindentCode(generatedTupleConverters, 4)}

			}

			public class InstanceCrashSimulator: NativeTraitWrapper {

				public init() {
					super.init(conflictAvoidingVariableName: 0, instantiationContext: "Bindings.swift::\\(#function):\\(#line)")
				}

				public func getPointer() -> UnsafeMutableRawPointer {
					let pointer = Bindings.instanceToPointer(instance: self)
					return pointer
				}

			}

			${generatedTupleComparators}

		`;
	}

	protected override swiftTypeName(type: RustType): string {
		if (type instanceof GlobalBindingsStruct) {
			// make sure this is always saved to Bindings.swift
			return 'Bindings';
		}
		return super.swiftTypeName(type);
	}

	protected outputDirectorySuffix(): string {
		return '';
	}

}
