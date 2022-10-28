#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Option_CVec_NetAddressZZ = Bindings.Option_CVec_NetAddressZZ

extension Bindings {

	public class Option_CVec_NetAddressZZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCOption_CVec_NetAddressZZ?

		/* DEFAULT_CONSTRUCTOR_START */
		public init(value: [NetAddress]?) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
				self.cOpaqueStruct = LDKCOption_CVec_NetAddressZZ()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_CVec_NetAddressZZ_Some
					
					
							let valueUnwrapped = value.map { (valueCurrentValue) in
							valueCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
					let somevalue = Bindings.new_LDKCVec_NetAddressZWrapper(array: valueUnwrapped)
                    // try! self.addAnchor(anchor: somevalue)
                    somevalue.dangle()
				
					self.cOpaqueStruct!.some = somevalue.cOpaqueStruct!
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_CVec_NetAddressZZ_None
				}
			
			
			super.init(conflictAvoidingVariableName: 0)
		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCOption_CVec_NetAddressZZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCOption_CVec_NetAddressZZ, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* OPTION_METHODS_START */

		public func getValue() -> [NetAddress]? {
			

				if self.cOpaqueStruct!.tag == LDKCOption_CVec_NetAddressZZ_None {
						return nil
				}
				if self.cOpaqueStruct!.tag == LDKCOption_CVec_NetAddressZZ_Some {
					return Bindings.LDKCVec_NetAddressZ_to_array(nativeType: self.cOpaqueStruct!.some, callerContext: "Option_CVec_NetAddressZZ::getValue", deallocate: false)
						
						.map { (cOpaqueStruct) in
							NetAddress(pointer: cOpaqueStruct).dangle()
						}
					
				}
				assert(false, "invalid option enum value")
				return nil
			
			
		}

		public class func some(o: [NetAddress]) -> Option_CVec_NetAddressZZ {
			
							let oUnwrapped = o.map { (oCurrentValue) in
							oCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
						let oWrapper = Bindings.new_LDKCVec_NetAddressZWrapper(array: oUnwrapped)
						defer {
							oWrapper.noOpRetain()
						}
					
			return Option_CVec_NetAddressZZ(pointer: COption_CVec_NetAddressZZ_some(oWrapper.dangle().cOpaqueStruct!));
		}

		public class func none() -> Option_CVec_NetAddressZZ {
			
			return Option_CVec_NetAddressZZ(pointer: COption_CVec_NetAddressZZ_none());
		}

		internal func free() -> Void {
			
			return COption_CVec_NetAddressZZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Option_CVec_NetAddressZZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Option_CVec_NetAddressZZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Option_CVec_NetAddressZZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Option_CVec_NetAddressZZ {
			
			return Option_CVec_NetAddressZZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCOption_CVec_NetAddressZZ>) in
COption_CVec_NetAddressZZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Option_CVec_NetAddressZZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* OPTION_METHODS_END */

		/* TYPE_CLASSES */
	}

}
