//
//  ProfileAPI.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 3/8/17.
//  Copyright © 2017 MatrixSDK. All rights reserved.
//

import Foundation
import Moya
import SwifterSwift

/// Profile endpoints
///
/// - getProfile: Get the combined profile information for this user. This API may be used to fetch the user's own profile information or other users; either locally or on remote homeservers. This API may return keys which are not limited to displayname or avatar_url.
/// - getDisplayName: Get the user's display name. This API may be used to fetch the user's own displayname or to query the name of other users; either locally or on remote homeservers.
/// - getAvatarUrl: Get the user's avatar URL. This API may be used to fetch the user's own avatar URL or to query the URL of other users; either locally or on remote homeservers.
/// - setDisplayName: This API sets the given user's display name. You must have permission to set this user's display name, e.g. you need to have their access_token.
/// - setAvatarUrl: This API sets the given user's avatar URL. You must have permission to set this user's avatar URL, e.g. you need to have their access_token.
public enum ProfileAPI {
    case getProfile(of: UserId)
    case getDisplayName(of: UserId)
    case getAvatarUrl(of: UserId)
    case setDisplayName(of: UserId, to: String)
    case setAvatarUrl(of: UserId, to: MxcUrl)
}

extension ProfileAPI: SubTarget {
    public var path: String {
        switch self {
        case .getProfile(let userId):
            return "/_matrix/client/r0/profile/\(userId.urlEncoded)"

        case .getDisplayName(let userId),
             .setDisplayName(let userId, _):
            return "/_matrix/client/r0/profile/\(userId.urlEncoded)/displayname"

        case .getAvatarUrl(let userId),
             .setAvatarUrl(let userId, _):
            return "/_matrix/client/r0/profile/\(userId.urlEncoded)/avatar_url"
        }
    }

    public var shouldAuthorize: Bool {
        switch self {
        case .setDisplayName,
             .setAvatarUrl:
            return true

        default:
            return false
        }
    }

    public var method: Moya.Method {
        switch self {
        case .getProfile,
             .getDisplayName,
             .getAvatarUrl:
            return .get

        case .setDisplayName,
             .setAvatarUrl:
            return .put
        }
    }

    public var parameters: [String: Any]? {
        switch self {
        case .getProfile,
             .getDisplayName,
             .getAvatarUrl:
            return nil

        case .setDisplayName(_, let displayName):
            return [
                "displayname": displayName,
            ]

        case .setAvatarUrl(_, let avatarUrl):
            return [
                "avatar_url": avatarUrl,
            ]
        }
    }

    public var sampleData: Data {
        switch self {
        case .getProfile:
            return [
                "avatar_url": "mxc://matrix.org/SDGdghriugerRg",
                "displayname": "Alice Margatroid"
                ].jsonData()!

        case .getDisplayName:
            return [
                "displayname": "Alice Margatroid"
                ].jsonData()!

        case .getAvatarUrl:
            return [
                "avatar_url": "mxc://matrix.org/SDGdghriugerRg",
                ].jsonData()!

        case .setDisplayName,
             .setAvatarUrl:
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
