//
//  AuthAPI.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 3/9/17.
//  Copyright © 2017 MatrixSDK. All rights reserved.
//

import Foundation
import Moya
import SwifterSwift

/// Session endpoints
///
/// - login: Authenticates the user, and issues an access token they can use to authorize themself in subsequent requests
/// - logout: Invalidates an existing access token, so that it can no longer be used for authorization
/// - refreshToken: Exchanges a refresh token for a new access token. This is intended to be used if the access token has expired.
public enum AuthAPI {
    case login(type: LoginType, password: String, username: String?, address: String?)
    case logout
    case refresh(token: String)
}

extension AuthAPI: SubTarget {
    public var path: String {
        switch self {
        case .login(_, _, _, _):
            return "/_matrix/client/r0/login"
        case .logout:
            return "/_matrix/client/r0/logout"
        case .refresh:
            return "/_matrix/client/r0/tokenrefresh"
        }
    }

    public var shouldAuthorize: Bool {
        switch self {
        case .logout,
             .refresh:
            return true
        default:
            return false
        }
    }

    public var method: Moya.Method {
        return .post
    }

    public var parameters: [String: Any]? {
        switch self {
        case .login(let type, let password, let username, let address):
            var params = [
                "type": type.rawValue,
                "password": password
            ]

            if let u = username {
                params["user"] = u
            } else if let a = address {
                params["address"] = a
                params["medium"] = "email"
            }

            return params
        case .logout(_):
            return nil
        case .refresh(let token):
            return [
                "refresh_token": token
            ]
        }
    }

    public var sampleData: Data {
        switch self {
        case .login(_, _, _, _):
            return [
                "access_token": "MDAxOWxvY2F0aW9uIHpi",
                "home_server": "domain.com",
                "user_id": "@user:domain.com",
                "refresh_token": "MDAxOWxvY2F0aW9uIenECg",
                "device_id": "VUZR"
                ].jsonData()!

        case .refresh:
            return [
                "access_token": "new access token",
                "refresh_token": "new refresh token"
                ].jsonData()!

        case .logout:
            return [:].jsonData()!
        }
    }

    public var task: Task {
        return .request
    }

    public var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }

    public var validate: Bool {
        return true
    }
}
