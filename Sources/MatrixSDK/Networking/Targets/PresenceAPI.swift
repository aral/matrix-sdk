//
//  PresenceAPI.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 3/10/17.
//  Copyright © 2017 MatrixSDK. All rights reserved.
//

import Foundation
import Moya
import SwifterSwift

public enum PresenceType: String, RawRepresentable {
    case online
    case offline
    case unavailable
}

/// Presence endpoints
///
/// - getPresenceList: Retrieve a list of presence events for every user on this list.
/// - setPresenceList: Adds or removes users from this presence list.
/// - getPresenceState: Get the given user's presence state.
/// - setPresenceState: Update this user's presence state.
public enum PresenceAPI {
    case getList(of: UserId)
    case updateList(of: UserId, drop: [UserId]?, invite: [UserId]?)
    case getState(of: UserId)
    case setState(of: UserId, to: PresenceType, withMessage: String?)
}

extension PresenceAPI: SubTarget {
    public var path: String {
        switch self {
        case .getList(let userId),
             .updateList(let userId, _, _):
            return "/_matrix/client/r0/presence/list/\(userId.urlEncoded)"
            
        case .getState(let userId),
             .setState(let userId, _, _):
            return "/_matrix/client/r0/presence/\(userId.urlEncoded)/status"
        }
    }
    
    public var shouldAuthorize: Bool {
        return true
    }
    
    public var method: Moya.Method {
        switch self {
        case .getList,
             .getState:
            return .get
            
        case .updateList:
            return .post
            
        case .setState:
            return .put
        }
    }
    
    public var parameters: [String: Any]? {
        switch self {
        case .getList,
             .getState:
            return nil
            
        case .updateList(_, let drop, let invite):
            var params: [String: [String]] = [:]
            
            if let d = drop {
                params["drop"] = d
            }
            
            if let i = invite {
                params["invite"] = i
            }
            
            return params
            
        case .setState(_, let presence, let message):
            var params = [
                "presence": presence.rawValue,
                ]
            
            if let m = message {
                params["status_msg"] = m
            }
            return params
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .getList:
            return [
                [
                    "content": [
                        "last_active_ago": 395,
                        "presence": "offline",
                        "user_id": "@alice:matrix.org"
                    ],
                    "type": "m.presence"
                ],
                [
                    "content": [
                        "last_active_ago": 16874,
                        "presence": "online",
                        "user_id": "@marisa:matrix.org",
                        "currently_active": true
                    ],
                    "type": "m.presence"
                ]
                ].jsonData()!
        case .updateList:
            return [:].jsonData()!
            
        case .getState(let user):
            return [
                "last_active_ago": 4305,
                "currently_active": true,
                "user_id": "\(user)",
                "presence": "online"
                ].jsonData()!
            
        case .setState:
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
