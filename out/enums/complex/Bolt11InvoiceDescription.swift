import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias Bolt11InvoiceDescription = Bindings.Bolt11InvoiceDescription

extension Bindings {

	/// Represents the description of an invoice which has to be either a directly included string or
	/// a hash of a description provided out of band.
	public class Bolt11InvoiceDescription: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKBolt11InvoiceDescription?

		internal init(cType: LDKBolt11InvoiceDescription, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKBolt11InvoiceDescription, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKBolt11InvoiceDescription, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum Bolt11InvoiceDescriptionType {

			/// Description of what the invoice is for
			case Direct

			/// Hash of the description of what the invoice is for
			case Hash

		}

		public func getValueType() -> Bolt11InvoiceDescriptionType {
			switch self.cType!.tag {
				case LDKBolt11InvoiceDescription_Direct:
					return .Direct

				case LDKBolt11InvoiceDescription_Hash:
					return .Hash

				default:
					Bindings.print(
						"Error: Invalid value type for Bolt11InvoiceDescription! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the Bolt11InvoiceDescription
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11InvoiceDescription_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the Bolt11InvoiceDescription
		internal func clone() -> Bolt11InvoiceDescription {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBolt11InvoiceDescription>) in
					Bolt11InvoiceDescription_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11InvoiceDescription(
				cType: nativeCallResult, instantiationContext: "Bolt11InvoiceDescription.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Direct-variant Bolt11InvoiceDescription
		public class func initWithDirect(a: Bindings.Description) -> Bolt11InvoiceDescription {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11InvoiceDescription_direct(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11InvoiceDescription(
				cType: nativeCallResult, instantiationContext: "Bolt11InvoiceDescription.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Hash-variant Bolt11InvoiceDescription
		public class func initWithHash(a: Bindings.Sha256) -> Bolt11InvoiceDescription {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11InvoiceDescription_hash(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11InvoiceDescription(
				cType: nativeCallResult, instantiationContext: "Bolt11InvoiceDescription.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two Bolt11InvoiceDescriptions contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: Bolt11InvoiceDescription, b: Bolt11InvoiceDescription) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKBolt11InvoiceDescription>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKBolt11InvoiceDescription>) in
						Bolt11InvoiceDescription_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Get the string representation of a Bolt11InvoiceDescription object
		public func toStr() -> String {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKBolt11InvoiceDescription>) in
					Bolt11InvoiceDescription_to_str(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Str(
				cType: nativeCallResult, instantiationContext: "Bolt11InvoiceDescription.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}


		public func getValueAsDirect() -> Bindings.Description? {
			if self.cType?.tag != LDKBolt11InvoiceDescription_Direct {
				return nil
			}

			return Description(
				cType: self.cType!.direct,
				instantiationContext: "Bolt11InvoiceDescription.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsHash() -> Bindings.Sha256? {
			if self.cType?.tag != LDKBolt11InvoiceDescription_Hash {
				return nil
			}

			return Sha256(
				cType: self.cType!.hash, instantiationContext: "Bolt11InvoiceDescription.swift::\(#function):\(#line)",
				anchor: self)
		}


		internal func danglingClone() -> Bolt11InvoiceDescription {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing Bolt11InvoiceDescription \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Bolt11InvoiceDescription \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
