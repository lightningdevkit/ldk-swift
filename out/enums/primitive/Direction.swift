import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// The side of a channel that is the [`IntroductionNode`] in a blinded path. [BOLT 7] defines which
/// nodes is which in the [`ChannelAnnouncement`] message.
///
/// [BOLT 7]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#the-channel_announcement-message
/// [`ChannelAnnouncement`]: crate::ln::msgs::ChannelAnnouncement
public typealias Direction = Bindings.Direction

extension Bindings {

	/// The side of a channel that is the [`IntroductionNode`] in a blinded path. [BOLT 7] defines which
	/// nodes is which in the [`ChannelAnnouncement`] message.
	///
	/// [BOLT 7]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#the-channel_announcement-message
	/// [`ChannelAnnouncement`]: crate::ln::msgs::ChannelAnnouncement
	public enum Direction {


		/// The lesser node id when compared lexicographically in ascending order.
		case NodeOne

		/// The greater node id when compared lexicographically in ascending order.
		case NodeTwo


		internal init(value: LDKDirection) {
			switch value {

				case LDKDirection_NodeOne:
					self = .NodeOne

				case LDKDirection_NodeTwo:
					self = .NodeTwo

				default:
					Bindings.print("Error: Invalid value type for Direction! Aborting.", severity: .ERROR)
					abort()

			}
		}

		internal func getCValue() -> LDKDirection {
			switch self {

				case .NodeOne:
					return LDKDirection_NodeOne

				case .NodeTwo:
					return LDKDirection_NodeTwo

			}
		}

	}

}
