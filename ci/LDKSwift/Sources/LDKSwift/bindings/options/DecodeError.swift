#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias DecodeError = Bindings.DecodeError

extension Bindings {

	public class DecodeError: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKDecodeError?

		

		public init(pointer: LDKDecodeError){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKDecodeError, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* OPTION_METHODS_START */

				public enum DecodeErrorValueType {
					case Io
				}

				public func getValueType() -> DecodeErrorValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKDecodeError_Io:
						return .Io
                    default:
                        return nil
                    }
				}

				
					public func getValueAsIo() -> LDKIOError? {
						if self.cOpaqueStruct?.tag != LDKDecodeError_Io {
							return nil
						}
						return self.cOpaqueStruct!.io
					}
				
			
		internal func free() -> Void {
			
			return DecodeError_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> DecodeError {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing DecodeError \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing DecodeError \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> DecodeError {
			
			return DecodeError(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKDecodeError>) in
DecodeError_clone(origPointer)
});
		}

					internal func danglingClone() -> DecodeError {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public class func unknown_version() -> DecodeError {
			
			return DecodeError(pointer: DecodeError_unknown_version());
		}

		public class func unknown_required_feature() -> DecodeError {
			
			return DecodeError(pointer: DecodeError_unknown_required_feature());
		}

		public class func invalid_value() -> DecodeError {
			
			return DecodeError(pointer: DecodeError_invalid_value());
		}

		public class func short_read() -> DecodeError {
			
			return DecodeError(pointer: DecodeError_short_read());
		}

		public class func bad_length_descriptor() -> DecodeError {
			
			return DecodeError(pointer: DecodeError_bad_length_descriptor());
		}

		public class func io(a: LDKIOError) -> DecodeError {
			
			return DecodeError(pointer: DecodeError_io(a));
		}

		public class func unsupported_compression() -> DecodeError {
			
			return DecodeError(pointer: DecodeError_unsupported_compression());
		}

		public class func eq(a: Bindings.DecodeError, b: Bindings.DecodeError) -> Bool {
			
			return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKDecodeError>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKDecodeError>) in
DecodeError_eq(aPointer, bPointer)
}
};
		}

		/* OPTION_METHODS_END */

		/* TYPE_CLASSES */
	}

}
