//
//  AuthResponse.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 3/14/17.
//  Copyright © 2017 MatrixSDK. All rights reserved.
//

import Foundation
import Unbox

public struct AuthResponse {
    let accessToken: String
    let homeserver: String
    let userId: UserId
    let deviceId: String?
}

extension AuthResponse: Unboxable {
    public init(unboxer: Unboxer) throws {
        self.accessToken = try unboxer.unbox(key: "access_token")
        self.homeserver = try unboxer.unbox(key: "home_server")
        self.userId = try unboxer.unbox(key: "user_id")
        self.deviceId = unboxer.unbox(key: "device_id")
    }
}
