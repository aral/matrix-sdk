//
//  RoomMembershipAPI.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 3/14/17.
//  Copyright © 2017 MatrixSDK. All rights reserved.
//

import Foundation
import Moya
import SwifterSwift
import Wrap

public enum RoomMembershipAPI {
    case ban(user: UserId, from: RoomId, because: String?)
    case forget(room: RoomId)
    case invite(user: UserId, to: RoomId)
    case invite3rdParty(address: String, to: RoomId, server: String)
    case join(to: RoomId, thirdPartySigned: ThirdPartySigned?)
    case joinAlias(room: RoomId, thirdPartySigned: ThirdPartySigned?)
    case kick(user: UserId, from: RoomId, because: String?)
    case leave(room: RoomId)
    case unban(user: UserId, from: RoomId)
}

extension RoomMembershipAPI: SubTarget {
    public var path: String {
        switch self {
        case .ban(_, let roomId, _):
            return "/_matrix/client/r0/rooms/\(roomId.urlEncoded)/ban"

        case .forget(let roomId):
            return "/_matrix/client/r0/rooms/\(roomId.urlEncoded)/forget"

        case .invite(_, let roomId),
             .invite3rdParty(_, let roomId, _):
            return "/_matrix/client/r0/rooms/\(roomId.urlEncoded)/invite"

        case .join(let roomId, _):
            return "/_matrix/client/r0/rooms/\(roomId.urlEncoded)/join"

        case .joinAlias(let roomId, _):
            return "/_matrix/client/r0/join/\(roomId.urlEncoded)"

        case .kick(_, let roomId, _):
            return "/_matrix/client/r0/rooms/\(roomId.urlEncoded)/kick"

        case .leave(let roomId):
            return "/_matrix/client/r0/rooms/\(roomId.urlEncoded)/leave"

        case .unban(_, let roomId):
            return "/_matrix/client/r0/rooms/\(roomId.urlEncoded)/unban"
        }
    }

    public var shouldAuthorize: Bool {
        return true
    }

    public var method: Moya.Method {
        return .post
    }

    public var parameters: [String: Any]? {
        switch self {
        case .ban(let userId, _, let reason),
             .kick(let userId, _, let reason):
            var params = [
                "user_id": userId
            ]

            if let r = reason {
                params["reason"] = r
            }

            return params

        case .invite(let userId, _),
             .unban(let userId, _):
            return [
                "user_id": userId
            ]

        case .invite3rdParty(let address, _, let server):
            return [
                "id_server": server,
                "medium": LoginMedium.email.rawValue,
                "address": address
            ]

        case .join(_, let thirdPartySigned),
             .joinAlias(_, let thirdPartySigned):
            if let tps = thirdPartySigned {
                let t: [String : Any] = try! wrap(tps)
                return [
                    "third_party_signed": [
                        "signed": t
                    ]
                ]
            }

            return nil

        case .forget,
             .leave:
            return nil
        }
    }

    public var sampleData: Data {
        switch self {
        case .join(let roomId, _),
             .joinAlias(let roomId, _):
            return ["room_id": roomId].jsonData()!
        default:
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
