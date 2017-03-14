//
//  ThirdPartySigned.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 3/17/17.
//  Copyright © 2017 MatrixSDK. All rights reserved.
//

import Foundation

typealias Signatures = [String: [String: String]]

public struct ThirdPartySigned {
    /// The Matrix ID of the invitee.
    let mxid: String
    /// The Matrix ID of the user who issued the invite.
    let sender: String
    /// A signatures object containing a signature of the entire signed object.
    let signatures: Signatures
    /// The state key of the m.third_party_invite event.
    let token: String
}
