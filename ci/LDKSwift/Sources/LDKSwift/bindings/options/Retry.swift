#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Retry = Bindings.Retry

extension Bindings {

	public class Retry: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKRetry?

		

		public init(pointer: LDKRetry){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKRetry, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* OPTION_METHODS_START */

				public enum RetryValueType {
					case Attempts, Timeout
				}

				public func getValueType() -> RetryValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKRetry_Attempts:
						return .Attempts
					case LDKRetry_Timeout:
						return .Timeout
                    default:
                        return nil
                    }
				}

				
					public func getValueAsAttempts() -> UInt? {
						if self.cOpaqueStruct?.tag != LDKRetry_Attempts {
							return nil
						}
						return self.cOpaqueStruct!.attempts
					}
				
					public func getValueAsTimeout() -> UInt64? {
						if self.cOpaqueStruct?.tag != LDKRetry_Timeout {
							return nil
						}
						return self.cOpaqueStruct!.timeout
					}
				
			
		internal func free() -> Void {
			
			return Retry_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Retry {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Retry \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Retry \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Retry {
			
			return Retry(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKRetry>) in
Retry_clone(origPointer)
});
		}

					internal func danglingClone() -> Retry {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public class func attempts(a: UInt) -> Retry {
			
			return Retry(pointer: Retry_attempts(a));
		}

		public class func timeout(a: UInt64) -> Retry {
			
			return Retry(pointer: Retry_timeout(a));
		}

		public class func eq(a: Bindings.Retry, b: Bindings.Retry) -> Bool {
			
			return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKRetry>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKRetry>) in
Retry_eq(aPointer, bPointer)
}
};
		}

		public func hash() -> UInt64 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKRetry>) in
Retry_hash(oPointer)
};
		}

		/* OPTION_METHODS_END */

		/* TYPE_CLASSES */
	}

}
