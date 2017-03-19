//
//  Presence.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 3/13/17.
//  Copyright © 2017 MatrixSDK. All rights reserved.
//

import Foundation
import Unbox

/// States for `m.presence` event
///
/// - offline: offline description
/// - online: <#online description#>
/// - unavailable: <#unavailable description#>
public enum PresenceState: String, RawRepresentable, UnboxableEnum {
    case offline
    case online
    case unavailable
}

public struct PresenceEventContent {
    /// The unique identifier for the user associated with this event.
    let userId: UserId

    /// The presence state for this user.
    let presence: PresenceState

    /// The current avatar URL for this user.
    let avatarUrl: String?

    /// The last time since this used performed some action, in milliseconds.
    let lastActiveAgo: UInt64?

    /// Whether or not the user is currently active.
    let currentlyActive: Bool?

    /// The current display name for this user.
    let displayname: String?
}

extension PresenceEventContent: Unboxable {
    public init(unboxer: Unboxer) throws {
        self.userId = try unboxer.unbox(key: "user_id")
        self.presence = try unboxer.unbox(key: "presence")
        self.avatarUrl = unboxer.unbox(key: "avatar_url")
        self.lastActiveAgo = unboxer.unbox(key: "last_active_ago")
        self.currentlyActive = unboxer.unbox(key: "currently_active")
        self.displayname = unboxer.unbox(key: "displayname")
    }
}

public struct PresenceEvent {
    let eventId: EventId
    //let eventType: EventId
    let content: PresenceEventContent
}
