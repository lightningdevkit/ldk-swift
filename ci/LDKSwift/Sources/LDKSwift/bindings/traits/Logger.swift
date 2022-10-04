#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

public typealias Logger = Bindings.Logger

extension Bindings {

	open class Logger: NativeTraitWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKLogger?

		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			/* NATIVE_CALLBACKS_START */

			func logCallback(pointer: UnsafeRawPointer?, recordPointer: UnsafePointer<LDKRecord>) -> Void {
				let instance: Logger = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Logger.swift::log")
				let record = Record(pointer: recordPointer.pointee).dangle().clone();

				return instance.log(record: record)
			}

			func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
				let instance: Logger = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Logger.swift::free")
				
				return instance.free()
			}

			/* NATIVE_CALLBACKS_END */

			super.init(conflictAvoidingVariableName: 0)
			self.cOpaqueStruct = LDKLogger(this_arg: Bindings.instanceToPointer(instance: self), 
			log: logCallback,
			free: freeCallback)

		}

		public init(pointer: LDKLogger){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKLogger, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* SWIFT_CALLBACKS_START */



					internal func dangle() -> Logger {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Logger \(self.instanceNumber).")
							// self.free()
						} else {
							Bindings.print("Not freeing Logger \(self.instanceNumber) due to dangle.")
						}
					}
				

		open func log(record: Record) -> Void {
			/* EDIT ME */
		Bindings.print("Error: Logger::log MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)

abort()
		}

		open func free() -> Void {
			/* EDIT ME */
		
					Bindings.print("Deactivating Logger \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
		}

		/* SWIFT_CALLBACKS_END */

	}

}


public class NativelyImplementedLogger: Logger {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func log(record: Record) -> Void {
		
				
				withUnsafePointer(to: record.cOpaqueStruct!) { (recordPointer: UnsafePointer<LDKRecord>) in

				self.cOpaqueStruct!.log(self.cOpaqueStruct!.this_arg, recordPointer)
				
}
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
