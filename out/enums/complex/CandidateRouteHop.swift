import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias CandidateRouteHop = Bindings.CandidateRouteHop

extension Bindings {

	/// A wrapper around the various hop representations.
	///
	/// Can be used to examine the properties of a hop,
	/// potentially to decide whether to include it in a route.
	public class CandidateRouteHop: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCandidateRouteHop?

		internal init(cType: LDKCandidateRouteHop, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKCandidateRouteHop, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCandidateRouteHop, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum CandidateRouteHopType {

			/// A hop from the payer, where the outbound liquidity is known.
			case FirstHop

			/// A hop found in the [`ReadOnlyNetworkGraph`].
			case PublicHop

			/// A private hop communicated by the payee, generally via a BOLT 11 invoice.
			///
			/// Because BOLT 11 route hints can take multiple hops to get to the destination, this may not
			/// terminate at the payee.
			case PrivateHop

			/// A blinded path which starts with an introduction point and ultimately terminates with the
			/// payee.
			///
			/// Because we don't know the payee's identity, [`CandidateRouteHop::target`] will return
			/// `None` in this state.
			///
			/// Because blinded paths are \"all or nothing\", and we cannot use just one part of a blinded
			/// path, the full path is treated as a single [`CandidateRouteHop`].
			case Blinded

			/// Similar to [`Self::Blinded`], but the path here only has one hop.
			///
			/// While we treat this similarly to [`CandidateRouteHop::Blinded`] in many respects (e.g.
			/// returning `None` from [`CandidateRouteHop::target`]), in this case we do actually know the
			/// payee's identity - it's the introduction point!
			///
			/// [`BlindedPayInfo`] provided for 1-hop blinded paths is ignored because it is meant to apply
			/// to the hops *between* the introduction node and the destination.
			///
			/// This primarily exists to track that we need to included a blinded path at the end of our
			/// [`Route`], even though it doesn't actually add an additional hop in the payment.
			case OneHopBlinded

		}

		public func getValueType() -> CandidateRouteHopType {
			switch self.cType!.tag {
				case LDKCandidateRouteHop_FirstHop:
					return .FirstHop

				case LDKCandidateRouteHop_PublicHop:
					return .PublicHop

				case LDKCandidateRouteHop_PrivateHop:
					return .PrivateHop

				case LDKCandidateRouteHop_Blinded:
					return .Blinded

				case LDKCandidateRouteHop_OneHopBlinded:
					return .OneHopBlinded

				default:
					Bindings.print("Error: Invalid value type for CandidateRouteHop! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the CandidateRouteHop
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CandidateRouteHop_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the CandidateRouteHop
		internal func clone() -> CandidateRouteHop {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCandidateRouteHop>) in
					CandidateRouteHop_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = CandidateRouteHop(
				cType: nativeCallResult, instantiationContext: "CandidateRouteHop.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new FirstHop-variant CandidateRouteHop
		public class func initWithFirstHop(a: Bindings.FirstHopCandidate) -> CandidateRouteHop {
			// native call variable prep


			// native method call
			let nativeCallResult = CandidateRouteHop_first_hop(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = CandidateRouteHop(
				cType: nativeCallResult, instantiationContext: "CandidateRouteHop.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new PublicHop-variant CandidateRouteHop
		public class func initWithPublicHop(a: Bindings.PublicHopCandidate) -> CandidateRouteHop {
			// native call variable prep


			// native method call
			let nativeCallResult = CandidateRouteHop_public_hop(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = CandidateRouteHop(
				cType: nativeCallResult, instantiationContext: "CandidateRouteHop.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new PrivateHop-variant CandidateRouteHop
		public class func initWithPrivateHop(a: Bindings.PrivateHopCandidate) -> CandidateRouteHop {
			// native call variable prep


			// native method call
			let nativeCallResult = CandidateRouteHop_private_hop(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = CandidateRouteHop(
				cType: nativeCallResult, instantiationContext: "CandidateRouteHop.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Blinded-variant CandidateRouteHop
		public class func initWithBlinded(a: Bindings.BlindedPathCandidate) -> CandidateRouteHop {
			// native call variable prep


			// native method call
			let nativeCallResult = CandidateRouteHop_blinded(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = CandidateRouteHop(
				cType: nativeCallResult, instantiationContext: "CandidateRouteHop.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new OneHopBlinded-variant CandidateRouteHop
		public class func initWithOneHopBlinded(a: Bindings.OneHopBlindedPathCandidate) -> CandidateRouteHop {
			// native call variable prep


			// native method call
			let nativeCallResult = CandidateRouteHop_one_hop_blinded(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = CandidateRouteHop(
				cType: nativeCallResult, instantiationContext: "CandidateRouteHop.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Returns the globally unique short channel ID for this hop, if one is known.
		///
		/// This only returns `Some` if the channel is public (either our own, or one we've learned
		/// from the public network graph), and thus the short channel ID we have for this channel is
		/// globally unique and identifies this channel in a global namespace.
		public func globallyUniqueShortChannelId() -> UInt64? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKCandidateRouteHop>) in
					CandidateRouteHop_globally_unique_short_channel_id(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "CandidateRouteHop.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// Returns the required difference in HTLC CLTV expiry between the [`Self::source`] and the
		/// next-hop for an HTLC taking this hop.
		///
		/// This is the time that the node(s) in this hop have to claim the HTLC on-chain if the
		/// next-hop goes on chain with a payment preimage.
		public func cltvExpiryDelta() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKCandidateRouteHop>) in
					CandidateRouteHop_cltv_expiry_delta(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns the minimum amount that can be sent over this hop, in millisatoshis.
		public func htlcMinimumMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKCandidateRouteHop>) in
					CandidateRouteHop_htlc_minimum_msat(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns the fees that must be paid to route an HTLC over this channel.
		public func fees() -> Bindings.RoutingFees {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKCandidateRouteHop>) in
					CandidateRouteHop_fees(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = RoutingFees(
				cType: nativeCallResult, instantiationContext: "CandidateRouteHop.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Returns the source node id of current hop.
		///
		/// Source node id refers to the node forwarding the HTLC through this hop.
		///
		/// For [`Self::FirstHop`] we return payer's node id.
		public func source() -> Bindings.NodeId {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKCandidateRouteHop>) in
					CandidateRouteHop_source(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NodeId(
				cType: nativeCallResult, instantiationContext: "CandidateRouteHop.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Returns the target node id of this hop, if known.
		///
		/// Target node id refers to the node receiving the HTLC after this hop.
		///
		/// For [`Self::Blinded`] we return `None` because the ultimate destination after the blinded
		/// path is unknown.
		///
		/// For [`Self::OneHopBlinded`] we return `None` because the target is the same as the source,
		/// and such a return value would be somewhat nonsensical.
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func target() -> Bindings.NodeId? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKCandidateRouteHop>) in
					CandidateRouteHop_target(thisArgPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKNodeId

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = NodeId(
				cType: nativeCallResult, instantiationContext: "CandidateRouteHop.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}


		public func getValueAsFirstHop() -> Bindings.FirstHopCandidate? {
			if self.cType?.tag != LDKCandidateRouteHop_FirstHop {
				return nil
			}

			return FirstHopCandidate(
				cType: self.cType!.first_hop, instantiationContext: "CandidateRouteHop.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsPublicHop() -> Bindings.PublicHopCandidate? {
			if self.cType?.tag != LDKCandidateRouteHop_PublicHop {
				return nil
			}

			return PublicHopCandidate(
				cType: self.cType!.public_hop, instantiationContext: "CandidateRouteHop.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsPrivateHop() -> Bindings.PrivateHopCandidate? {
			if self.cType?.tag != LDKCandidateRouteHop_PrivateHop {
				return nil
			}

			return PrivateHopCandidate(
				cType: self.cType!.private_hop, instantiationContext: "CandidateRouteHop.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsBlinded() -> Bindings.BlindedPathCandidate? {
			if self.cType?.tag != LDKCandidateRouteHop_Blinded {
				return nil
			}

			return BlindedPathCandidate(
				cType: self.cType!.blinded, instantiationContext: "CandidateRouteHop.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsOneHopBlinded() -> Bindings.OneHopBlindedPathCandidate? {
			if self.cType?.tag != LDKCandidateRouteHop_OneHopBlinded {
				return nil
			}

			return OneHopBlindedPathCandidate(
				cType: self.cType!.one_hop_blinded,
				instantiationContext: "CandidateRouteHop.swift::\(#function):\(#line)", anchor: self)
		}


		internal func danglingClone() -> CandidateRouteHop {
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
						"Freeing CandidateRouteHop \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing CandidateRouteHop \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
