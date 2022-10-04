#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

public typealias Listen = Bindings.Listen

extension Bindings {

	open class Listen: NativeTraitWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKListen?

		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			/* NATIVE_CALLBACKS_START */

			func filtered_block_connectedCallback(pointer: UnsafeRawPointer?, headerPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, txdata: LDKCVec_C2Tuple_usizeTransactionZZ, height: UInt32) -> Void {
				let instance: Listen = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Listen.swift::filtered_block_connected")
				
								var header: [UInt8]? = nil
								if let headerUnwrapped = headerPointer {
									header = Bindings.tuple80_to_array(nativeType: headerUnwrapped.pointee)
								}
							
				return instance.filtered_block_connected(header: header, txdata: Bindings.LDKCVec_C2Tuple_usizeTransactionZZ_to_array(nativeType: txdata), height: height)
			}

			func block_connectedCallback(pointer: UnsafeRawPointer?, block: LDKu8slice, height: UInt32) -> Void {
				let instance: Listen = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Listen.swift::block_connected")
				
				return instance.block_connected(block: Bindings.LDKu8slice_to_array(nativeType: block), height: height)
			}

			func block_disconnectedCallback(pointer: UnsafeRawPointer?, headerPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, height: UInt32) -> Void {
				let instance: Listen = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Listen.swift::block_disconnected")
				
								var header: [UInt8]? = nil
								if let headerUnwrapped = headerPointer {
									header = Bindings.tuple80_to_array(nativeType: headerUnwrapped.pointee)
								}
							
				return instance.block_disconnected(header: header, height: height)
			}

			func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
				let instance: Listen = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Listen.swift::free")
				
				return instance.free()
			}

			/* NATIVE_CALLBACKS_END */

			super.init(conflictAvoidingVariableName: 0)
			self.cOpaqueStruct = LDKListen(this_arg: Bindings.instanceToPointer(instance: self), 
			filtered_block_connected: filtered_block_connectedCallback,
			block_connected: block_connectedCallback,
			block_disconnected: block_disconnectedCallback,
			free: freeCallback)

		}

		public init(pointer: LDKListen){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKListen, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* SWIFT_CALLBACKS_START */



					internal func dangle() -> Listen {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Listen \(self.instanceNumber).")
							// self.free()
						} else {
							Bindings.print("Not freeing Listen \(self.instanceNumber) due to dangle.")
						}
					}
				

		open func filtered_block_connected(header: [UInt8]?, txdata: [LDKC2Tuple_usizeTransactionZ], height: UInt32) -> Void {
			/* EDIT ME */
		Bindings.print("Error: Listen::filtered_block_connected MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)

abort()
		}

		open func block_connected(block: [UInt8], height: UInt32) -> Void {
			/* EDIT ME */
		Bindings.print("Error: Listen::block_connected MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)

abort()
		}

		open func block_disconnected(header: [UInt8]?, height: UInt32) -> Void {
			/* EDIT ME */
		Bindings.print("Error: Listen::block_disconnected MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)

abort()
		}

		open func free() -> Void {
			/* EDIT ME */
		
					Bindings.print("Deactivating Listen \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
		}

		/* SWIFT_CALLBACKS_END */

	}

}


public class NativelyImplementedListen: Listen {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public func filtered_block_connected(header: [UInt8]?, txdata: [C2Tuple_usizeTransactionZ], height: UInt32) -> Void {
		
					
							let txdataUnwrapped = txdata.map { (txdataCurrentValue) in
							txdataCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
					return self.filtered_block_connected(header: header, txdata: txdataUnwrapped, height: height)
				
	}

@available(*, deprecated, message: "Use method taking Swift object array type instead.")
	public override func filtered_block_connected(header: [UInt8]?, txdata: [LDKC2Tuple_usizeTransactionZ], height: UInt32) -> Void {
		
				
						let txdataWrapper = Bindings.new_LDKCVec_C2Tuple_usizeTransactionZZWrapper(array: txdata)
						defer {
							txdataWrapper.noOpRetain()
						}
					
				withUnsafePointer(to: Bindings.array_to_tuple80(array: header!)) { (headerPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in

				self.cOpaqueStruct!.filtered_block_connected(self.cOpaqueStruct!.this_arg, headerPointer, txdataWrapper.dangle().cOpaqueStruct!, height)
				
}
			
	}

	public override func block_connected(block: [UInt8], height: UInt32) -> Void {
		
				
						let blockWrapper = Bindings.new_LDKu8sliceWrapper(array: block)
						defer {
							blockWrapper.noOpRetain()
						}
					
				
				self.cOpaqueStruct!.block_connected(self.cOpaqueStruct!.this_arg, blockWrapper.cOpaqueStruct!, height)
				
			
	}

	public override func block_disconnected(header: [UInt8]?, height: UInt32) -> Void {
		
				
				withUnsafePointer(to: Bindings.array_to_tuple80(array: header!)) { (headerPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in

				self.cOpaqueStruct!.block_disconnected(self.cOpaqueStruct!.this_arg, headerPointer, height)
				
}
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
