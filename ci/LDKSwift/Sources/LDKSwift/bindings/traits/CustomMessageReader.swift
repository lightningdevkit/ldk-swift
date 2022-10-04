#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

public typealias CustomMessageReader = Bindings.CustomMessageReader

extension Bindings {

	open class CustomMessageReader: NativeTraitWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCustomMessageReader?

		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			/* NATIVE_CALLBACKS_START */

			func readCallback(pointer: UnsafeRawPointer?, message_type: UInt16, buffer: LDKu8slice) -> LDKCResult_COption_TypeZDecodeErrorZ {
				let instance: CustomMessageReader = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "CustomMessageReader.swift::read")
				
				return instance.read(message_type: message_type, buffer: Bindings.LDKu8slice_to_array(nativeType: buffer)).cOpaqueStruct!
			}

			func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
				let instance: CustomMessageReader = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "CustomMessageReader.swift::free")
				
				return instance.free()
			}

			/* NATIVE_CALLBACKS_END */

			super.init(conflictAvoidingVariableName: 0)
			self.cOpaqueStruct = LDKCustomMessageReader(this_arg: Bindings.instanceToPointer(instance: self), 
			read: readCallback,
			free: freeCallback)

		}

		public init(pointer: LDKCustomMessageReader){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCustomMessageReader, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* SWIFT_CALLBACKS_START */



					internal func dangle() -> CustomMessageReader {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing CustomMessageReader \(self.instanceNumber).")
							// self.free()
						} else {
							Bindings.print("Not freeing CustomMessageReader \(self.instanceNumber) due to dangle.")
						}
					}
				

		open func read(message_type: UInt16, buffer: [UInt8]) -> Result_COption_TypeZDecodeErrorZ {
			/* EDIT ME */
		Bindings.print("Error: CustomMessageReader::read MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)

abort()
		}

		open func free() -> Void {
			/* EDIT ME */
		
					Bindings.print("Deactivating CustomMessageReader \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
		}

		/* SWIFT_CALLBACKS_END */

	}

}


public class NativelyImplementedCustomMessageReader: CustomMessageReader {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func read(message_type: UInt16, buffer: [UInt8]) -> Result_COption_TypeZDecodeErrorZ {
		
				
						let bufferWrapper = Bindings.new_LDKu8sliceWrapper(array: buffer)
						defer {
							bufferWrapper.noOpRetain()
						}
					
				return 
				Result_COption_TypeZDecodeErrorZ(pointer: self.cOpaqueStruct!.read(self.cOpaqueStruct!.this_arg, message_type, bufferWrapper.cOpaqueStruct!))
				
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
