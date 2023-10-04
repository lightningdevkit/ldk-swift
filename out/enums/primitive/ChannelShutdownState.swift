import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// Further information on the details of the channel shutdown.
/// Upon channels being forced closed (i.e. commitment transaction confirmation detected
/// by `ChainMonitor`), ChannelShutdownState will be set to `ShutdownComplete` or
/// the channel will be removed shortly.
/// Also note, that in normal operation, peers could disconnect at any of these states
/// and require peer re-connection before making progress onto other states
public typealias ChannelShutdownState = Bindings.ChannelShutdownState

extension Bindings {

	/// Further information on the details of the channel shutdown.
	/// Upon channels being forced closed (i.e. commitment transaction confirmation detected
	/// by `ChainMonitor`), ChannelShutdownState will be set to `ShutdownComplete` or
	/// the channel will be removed shortly.
	/// Also note, that in normal operation, peers could disconnect at any of these states
	/// and require peer re-connection before making progress onto other states
	public enum ChannelShutdownState {


		/// Channel has not sent or received a shutdown message.
		case NotShuttingDown

		/// Local node has sent a shutdown message for this channel.
		case ShutdownInitiated

		/// Shutdown message exchanges have concluded and the channels are in the midst of
		/// resolving all existing open HTLCs before closing can continue.
		case ResolvingHTLCs

		/// All HTLCs have been resolved, nodes are currently negotiating channel close onchain fee rates.
		case NegotiatingClosingFee

		/// We've successfully negotiated a closing_signed dance. At this point `ChannelManager` is about
		/// to drop the channel.
		case ShutdownComplete


		internal init(value: LDKChannelShutdownState) {
			switch value {

				case LDKChannelShutdownState_NotShuttingDown:
					self = .NotShuttingDown

				case LDKChannelShutdownState_ShutdownInitiated:
					self = .ShutdownInitiated

				case LDKChannelShutdownState_ResolvingHTLCs:
					self = .ResolvingHTLCs

				case LDKChannelShutdownState_NegotiatingClosingFee:
					self = .NegotiatingClosingFee

				case LDKChannelShutdownState_ShutdownComplete:
					self = .ShutdownComplete

				default:
					Bindings.print("Error: Invalid value type for ChannelShutdownState! Aborting.", severity: .ERROR)
					abort()

			}
		}

		internal func getCValue() -> LDKChannelShutdownState {
			switch self {

				case .NotShuttingDown:
					return LDKChannelShutdownState_NotShuttingDown

				case .ShutdownInitiated:
					return LDKChannelShutdownState_ShutdownInitiated

				case .ResolvingHTLCs:
					return LDKChannelShutdownState_ResolvingHTLCs

				case .NegotiatingClosingFee:
					return LDKChannelShutdownState_NegotiatingClosingFee

				case .ShutdownComplete:
					return LDKChannelShutdownState_ShutdownComplete

			}
		}

	}

}
