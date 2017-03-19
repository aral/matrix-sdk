//
//  PresenceResponse.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 3/13/17.
//  Copyright © 2017 MatrixSDK. All rights reserved.
//

import Foundation
import Unbox

public struct PresenceResponse {
    let presence: PresenceState
    let statusMsg: String?
    let currentlyActive: Bool?
    let lastActiveAgo: UInt64?
}

extension PresenceResponse: Unboxable {
    public init(unboxer: Unboxer) throws {
        self.presence = try unboxer.unbox(key: "presence")
        self.statusMsg = unboxer.unbox(key: "status_msg")
        self.currentlyActive = unboxer.unbox(key: "currently_active")
        self.lastActiveAgo = unboxer.unbox(key: "last_active_ago")
    }
}
