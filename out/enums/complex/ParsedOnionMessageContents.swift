import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias ParsedOnionMessageContents = Bindings.ParsedOnionMessageContents

extension Bindings {

	/// The contents of an [`OnionMessage`] as read from the wire.
	///
	/// [`OnionMessage`]: crate::ln::msgs::OnionMessage
	public class ParsedOnionMessageContents: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKParsedOnionMessageContents?

		internal init(cType: LDKParsedOnionMessageContents, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKParsedOnionMessageContents, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKParsedOnionMessageContents, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum ParsedOnionMessageContentsType {

			/// A message related to BOLT 12 Offers.
			case Offers

			/// A custom onion message specified by the user.
			case Custom

		}

		public func getValueType() -> ParsedOnionMessageContentsType {
			switch self.cType!.tag {
				case LDKParsedOnionMessageContents_Offers:
					return .Offers

				case LDKParsedOnionMessageContents_Custom:
					return .Custom

				default:
					Bindings.print(
						"Error: Invalid value type for ParsedOnionMessageContents! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the ParsedOnionMessageContents
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ParsedOnionMessageContents_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the ParsedOnionMessageContents
		internal func clone() -> ParsedOnionMessageContents {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKParsedOnionMessageContents>) in
					ParsedOnionMessageContents_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ParsedOnionMessageContents(
				cType: nativeCallResult, instantiationContext: "ParsedOnionMessageContents.swift::\(#function):\(#line)"
			)


			return returnValue
		}

		/// Utility method to constructs a new Offers-variant ParsedOnionMessageContents
		public class func initWithOffers(a: OffersMessage) -> ParsedOnionMessageContents {
			// native call variable prep


			// native method call
			let nativeCallResult = ParsedOnionMessageContents_offers(a.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = ParsedOnionMessageContents(
				cType: nativeCallResult, instantiationContext: "ParsedOnionMessageContents.swift::\(#function):\(#line)"
			)


			return returnValue
		}

		/// Utility method to constructs a new Custom-variant ParsedOnionMessageContents
		public class func initWithCustom(a: Bindings.OnionMessageContents) -> ParsedOnionMessageContents {
			// native call variable prep


			// native method call
			let nativeCallResult = ParsedOnionMessageContents_custom(a.activate().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = ParsedOnionMessageContents(
				cType: nativeCallResult, instantiationContext: "ParsedOnionMessageContents.swift::\(#function):\(#line)"
			)


			return returnValue
		}

		/// Constructs a new OnionMessageContents which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned OnionMessageContents must be freed before this_arg is
		public func asOnionMessageContents() -> Bindings.OnionMessageContents {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKParsedOnionMessageContents>) in
					ParsedOnionMessageContents_as_OnionMessageContents(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedOnionMessageContents(
				cType: nativeCallResult,
				instantiationContext: "ParsedOnionMessageContents.swift::\(#function):\(#line)", anchor: self)


			return returnValue
		}

		/// Serialize the ParsedOnionMessageContents object into a byte array which can be read by ParsedOnionMessageContents_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKParsedOnionMessageContents>) in
					ParsedOnionMessageContents_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult,
				instantiationContext: "ParsedOnionMessageContents.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}


		public func getValueAsOffers() -> OffersMessage? {
			if self.cType?.tag != LDKParsedOnionMessageContents_Offers {
				return nil
			}

			return OffersMessage(
				cType: self.cType!.offers,
				instantiationContext: "ParsedOnionMessageContents.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsCustom() -> Bindings.OnionMessageContents? {
			if self.cType?.tag != LDKParsedOnionMessageContents_Custom {
				return nil
			}

			return NativelyImplementedOnionMessageContents(
				cType: self.cType!.custom,
				instantiationContext: "ParsedOnionMessageContents.swift::\(#function):\(#line)", anchor: self)
		}


		internal func danglingClone() -> ParsedOnionMessageContents {
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
						"Freeing ParsedOnionMessageContents \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ParsedOnionMessageContents \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
