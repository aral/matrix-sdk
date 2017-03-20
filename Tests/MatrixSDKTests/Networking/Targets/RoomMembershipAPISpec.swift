//
//  RoomMembershipAPISpec.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 3/16/17.
//  Copyright © 2017 MatrixSDK. All rights reserved.
//

import Quick
import Nimble
import Moya
import SwiftyJSON
@testable import MatrixSDK

class RoomMembershipAPISpec: QuickSpec {
    override func spec() {
        describe("TARGET: RoomMembershipAPI") {
            var target: SubTarget!
            var thirdPartySigned: ThirdPartySigned!

            describe("POST /_matrix/client/r0/rooms/{roomId}/ban") {
                beforeEach {
                    target = RoomMembershipAPI.ban(user: "@user:domain.com", from: "!R12345:domain.com", because: "I'm bad :D")
                }

                it("uses correct shouldAuthorize") {
                    expect(target.shouldAuthorize) == true
                }

                it("uses correct path") {
                    expect(target.path) == "/_matrix/client/r0/rooms/!R12345:domain.com/ban"
                }

                it("uses correct parameter encoding.") {
                    expect(target.parameterEncoding is JSONEncoding) == true
                }

                it("uses correct parameters") {
                    expect(target.parameters).toNot(beNil())
                    expect(target.parameters?.count).to(equal(2))

                    let json = JSON(target.parameters!)

                    expect(json["reason"].string).to(equal("I'm bad :D"))
                    expect(json["user_id"].string).to(equal("@user:domain.com"))
                }

                it("uses correct method") {
                    expect(target.method) == Method.post
                }

                it("uses correct task") {
                    expect(String(describing: target.task)) == "request"
                }

                it("uses correct sample data") {
                    let expectedData = [:].jsonData()!

                    expect(target.sampleData).to(equal(expectedData))
                }

                it("uses correct validate") {
                    expect(target.validate) == true
                }

                context("ban without reason message") {
                    it("uses correct parameters") {
                        target = RoomMembershipAPI.ban(user: "@user:domain.com", from: "!R12345:domain.com", because: nil)

                        expect(target.parameters).toNot(beNil())
                        expect(target.parameters?.count).to(equal(1))

                        let json = JSON(target.parameters!)

                        expect(json["user_id"].string).to(equal("@user:domain.com"))
                        expect(json["reason"].string).to(beNil())
                    }
                }
            }

            describe("POST /_matrix/client/r0/rooms/{roomId}/forget") {
                beforeEach {
                    target = RoomMembershipAPI.forget(room: "!R12345:domain.com")
                }

                it("uses correct shouldAuthorize") {
                    expect(target.shouldAuthorize) == true
                }

                it("uses correct path") {
                    expect(target.path) == "/_matrix/client/r0/rooms/!R12345:domain.com/forget"
                }

                it("uses correct parameter encoding.") {
                    expect(target.parameterEncoding is JSONEncoding) == true
                }

                it("uses correct parameters") {
                    expect(target.parameters).to(beNil())
                }

                it("uses correct method") {
                    expect(target.method) == Method.post
                }

                it("uses correct task") {
                    expect(String(describing: target.task)) == "request"
                }

                it("uses correct sample data") {
                    let expectedData = [:].jsonData()!

                    expect(target.sampleData).to(equal(expectedData))
                }

                it("uses correct validate") {
                    expect(target.validate) == true
                }
            }

            describe("POST /_matrix/client/r0/rooms/{roomId}/invite") {
                context("Knowing the user id") {
                    beforeEach {
                        target = RoomMembershipAPI.invite(user: "@user:domain.com", to: "!R12345:domain.com")
                    }

                    it("uses correct shouldAuthorize") {
                        expect(target.shouldAuthorize) == true
                    }

                    it("uses correct path") {
                        expect(target.path) == "/_matrix/client/r0/rooms/!R12345:domain.com/invite"
                    }

                    it("uses correct parameter encoding.") {
                        expect(target.parameterEncoding is JSONEncoding) == true
                    }

                    it("uses correct parameters") {
                        expect(target.parameters).toNot(beNil())
                        expect(target.parameters?.count).to(equal(1))

                        let json = JSON(target.parameters!)

                        expect(json["user_id"].string).to(equal("@user:domain.com"))
                    }

                    it("uses correct method") {
                        expect(target.method) == Method.post
                    }

                    it("uses correct task") {
                        expect(String(describing: target.task)) == "request"
                    }

                    it("uses correct sample data") {
                        let expectedData = [:].jsonData()!

                        expect(target.sampleData).to(equal(expectedData))
                    }

                    it("uses correct validate") {
                        expect(target.validate) == true
                    }
                }

                context("Using third party id") {
                    beforeEach {
                        target = RoomMembershipAPI.invite3rdParty(address: "user@domain.com", to: "!R12345:domain.com", server: "matrix.org")
                    }

                    it("uses correct shouldAuthorize") {
                        expect(target.shouldAuthorize) == true
                    }

                    it("uses correct path") {
                        expect(target.path) == "/_matrix/client/r0/rooms/!R12345:domain.com/invite"
                    }

                    it("uses correct parameter encoding.") {
                        expect(target.parameterEncoding is JSONEncoding) == true
                    }

                    it("uses correct parameters") {
                        expect(target.parameters).toNot(beNil())
                        expect(target.parameters?.count).to(equal(3))

                        let json = JSON(target.parameters!)

                        expect(json["address"].string).to(equal("user@domain.com"))
                        expect(json["id_server"].string).to(equal("matrix.org"))
                        expect(json["medium"].string).to(equal(LoginMedium.email.rawValue))
                    }

                    it("uses correct method") {
                        expect(target.method) == Method.post
                    }

                    it("uses correct task") {
                        expect(String(describing: target.task)) == "request"
                    }

                    it("uses correct sample data") {
                        let expectedData = [:].jsonData()!

                        expect(target.sampleData).to(equal(expectedData))
                    }

                    it("uses correct validate") {
                        expect(target.validate) == true
                    }
                }
            }

            describe("POST /_matrix/client/r0/rooms/{roomId}/join") {
                context("without third party signed data") {
                    beforeEach {
                        target = RoomMembershipAPI.join(to: "!R12345:domain.com", thirdPartySigned: nil)
                    }

                    it("uses correct shouldAuthorize") {
                        expect(target.shouldAuthorize) == true
                    }

                    it("uses correct path") {
                        expect(target.path) == "/_matrix/client/r0/rooms/!R12345:domain.com/join"
                    }

                    it("uses correct parameter encoding.") {
                        expect(target.parameterEncoding is JSONEncoding) == true
                    }

                    it("uses correct parameters") {
                        expect(target.parameters).to(beNil())
                    }

                    it("uses correct method") {
                        expect(target.method) == Method.post
                    }

                    it("uses correct task") {
                        expect(String(describing: target.task)) == "request"
                    }

                    it("uses correct sample data") {
                        let expectedData = [
                            "room_id": "!R12345:domain.com"
                            ].jsonData()!

                        expect(target.sampleData).to(equal(expectedData))
                    }

                    it("uses correct validate") {
                        expect(target.validate) == true
                    }
                }

                context("with third party signed data") {
                    beforeEach {
                        let signatues = [
                            "horton.hears": [
                                "ed25519:0": "some9signature"
                            ]
                        ]
                        thirdPartySigned = ThirdPartySigned(mxid: "@green:eggs.ham", sender: "@cat:the.hat", signatures: signatues, token: "random8nonce")
                        target = RoomMembershipAPI.join(to: "!R12345:domain.com", thirdPartySigned: thirdPartySigned)
                    }

                    it("uses correct shouldAuthorize") {
                        expect(target.shouldAuthorize) == true
                    }

                    it("uses correct path") {
                        expect(target.path) == "/_matrix/client/r0/rooms/!R12345:domain.com/join"
                    }

                    it("uses correct parameter encoding.") {
                        expect(target.parameterEncoding is JSONEncoding) == true
                    }

                    it("uses correct parameters") {
                        expect(target.parameters).toNot(beNil())
                        expect(target.parameters?.count).to(equal(1))

                        let json = JSON(target.parameters!)

                        expect(json["third_party_signed"]["signed"]["mxid"].string).to(equal("@green:eggs.ham"))
                        expect(json["third_party_signed"]["signed"]["sender"].string).to(equal("@cat:the.hat"))
                        expect(json["third_party_signed"]["signed"]["token"].string).to(equal("random8nonce"))

                        let signatures = json["third_party_signed"]["signed"]["signatures"]
                        expect(signatures.count).to(equal(1))
                        expect(signatures["horton.hears"]["ed25519:0"].string).to(equal("some9signature"))
                    }

                    it("uses correct method") {
                        expect(target.method) == Method.post
                    }

                    it("uses correct task") {
                        expect(String(describing: target.task)) == "request"
                    }

                    it("uses correct sample data") {
                        let expectedData = [
                            "room_id": "!R12345:domain.com"
                            ].jsonData()!

                        expect(target.sampleData).to(equal(expectedData))
                    }

                    it("uses correct validate") {
                        expect(target.validate) == true
                    }
                }
            }

            describe("POST /_matrix/client/r0/join/{roomIdOrAlias}") {
                beforeEach {
                    target = RoomMembershipAPI.joinAlias(room: "!R12345:domain.com", thirdPartySigned: nil)
                }

                it("uses correct shouldAuthorize") {
                    expect(target.shouldAuthorize) == true
                }

                it("uses correct path") {
                    expect(target.path) == "/_matrix/client/r0/join/!R12345:domain.com"
                }

                it("uses correct parameter encoding.") {
                    expect(target.parameterEncoding is JSONEncoding) == true
                }

                it("uses correct parameters") {
                    expect(target.parameters).to(beNil())
                }

                it("uses correct method") {
                    expect(target.method) == Method.post
                }

                it("uses correct task") {
                    expect(String(describing: target.task)) == "request"
                }

                it("uses correct sample data") {
                    let expectedData = [
                        "room_id": "!R12345:domain.com"
                        ].jsonData()!

                    expect(target.sampleData).to(equal(expectedData))
                }

                it("uses correct validate") {
                    expect(target.validate) == true
                }

                context("with third party signed data") {
                    beforeEach {
                        let signatues = [
                            "horton.hears": [
                                "ed25519:0": "some9signature"
                            ]
                        ]
                        thirdPartySigned = ThirdPartySigned(mxid: "@green:eggs.ham", sender: "@cat:the.hat", signatures: signatues, token: "random8nonce")
                        target = RoomMembershipAPI.join(to: "!R12345:domain.com", thirdPartySigned: thirdPartySigned)
                    }

                    it("uses correct shouldAuthorize") {
                        expect(target.shouldAuthorize) == true
                    }

                    it("uses correct path") {
                        expect(target.path) == "/_matrix/client/r0/rooms/!R12345:domain.com/join"
                    }

                    it("uses correct parameter encoding.") {
                        expect(target.parameterEncoding is JSONEncoding) == true
                    }

                    it("uses correct parameters") {
                        expect(target.parameters).toNot(beNil())
                        expect(target.parameters?.count).to(equal(1))

                        let json = JSON(target.parameters!)

                        expect(json["third_party_signed"]["signed"]["mxid"].string).to(equal("@green:eggs.ham"))
                        expect(json["third_party_signed"]["signed"]["sender"].string).to(equal("@cat:the.hat"))
                        expect(json["third_party_signed"]["signed"]["token"].string).to(equal("random8nonce"))

                        let signatures = json["third_party_signed"]["signed"]["signatures"]
                        expect(signatures.count).to(equal(1))
                        expect(signatures["horton.hears"]["ed25519:0"].string).to(equal("some9signature"))
                    }

                    it("uses correct method") {
                        expect(target.method) == Method.post
                    }

                    it("uses correct task") {
                        expect(String(describing: target.task)) == "request"
                    }

                    it("uses correct sample data") {
                        let expectedData = [
                            "room_id": "!R12345:domain.com"
                            ].jsonData()!

                        expect(target.sampleData).to(equal(expectedData))
                    }

                    it("uses correct validate") {
                        expect(target.validate) == true
                    }
                }
            }

            describe("POST /_matrix/client/r0/rooms/{roomId}/kick") {
                beforeEach {
                    target = RoomMembershipAPI.kick(user: "@user:domain.com", from: "!R12345:domain.com", because: "I want")
                }

                it("uses correct shouldAuthorize") {
                    expect(target.shouldAuthorize) == true
                }

                it("uses correct path") {
                    expect(target.path) == "/_matrix/client/r0/rooms/!R12345:domain.com/kick"
                }

                it("uses correct parameter encoding.") {
                    expect(target.parameterEncoding is JSONEncoding) == true
                }

                it("uses correct parameters") {
                    expect(target.parameters).toNot(beNil())
                    expect(target.parameters?.count).to(equal(2))
                    expect(target.parameters?["reason"] as? String).to(equal("I want"))
                    expect(target.parameters?["user_id"] as? String).to(equal("@user:domain.com"))
                }

                it("uses correct method") {
                    expect(target.method) == Method.post
                }

                it("uses correct task") {
                    expect(String(describing: target.task)) == "request"
                }

                it("uses correct sample data") {
                    let expectedData = [:].jsonData()!

                    expect(target.sampleData).to(equal(expectedData))
                }

                it("uses correct validate") {
                    expect(target.validate) == true
                }

                context("ban without reason message") {
                    it("uses correct parameters") {
                        target = RoomMembershipAPI.kick(user: "@user:domain.com", from: "!R12345:domain.com", because: nil)

                        expect(target.parameters).toNot(beNil())
                        expect(target.parameters?.count).to(equal(1))
                        expect(target.parameters?["user_id"] as? String).to(equal("@user:domain.com"))
                        expect(target.parameters?["reason"] as? String).to(beNil())
                    }
                }

            }

            describe("POST /_matrix/client/r0/rooms/{roomId}/leave") {
                beforeEach {
                    target = RoomMembershipAPI.leave(room: "!R12345:domain.com")
                }

                it("uses correct shouldAuthorize") {
                    expect(target.shouldAuthorize) == true
                }

                it("uses correct path") {
                    expect(target.path) == "/_matrix/client/r0/rooms/!R12345:domain.com/leave"
                }

                it("uses correct parameter encoding.") {
                    expect(target.parameterEncoding is JSONEncoding) == true
                }

                it("uses correct parameters") {
                    expect(target.parameters).to(beNil())
                }

                it("uses correct method") {
                    expect(target.method) == Method.post
                }

                it("uses correct task") {
                    expect(String(describing: target.task)) == "request"
                }

                it("uses correct sample data") {
                    let expectedData = [:].jsonData()!

                    expect(target.sampleData).to(equal(expectedData))
                }

                it("uses correct validate") {
                    expect(target.validate) == true
                }
            }

            describe("POST /_matrix/client/r0/rooms/{roomId}/unban") {
                beforeEach {
                    target = RoomMembershipAPI.unban(user: "@user:domain.com", from: "!R12345:domain.com")
                }

                it("uses correct shouldAuthorize") {
                    expect(target.shouldAuthorize) == true
                }

                it("uses correct path") {
                    expect(target.path) == "/_matrix/client/r0/rooms/!R12345:domain.com/unban"
                }

                it("uses correct parameter encoding.") {
                    expect(target.parameterEncoding is JSONEncoding) == true
                }

                it("uses correct parameters") {
                    expect(target.parameters).toNot(beNil())
                    expect(target.parameters?.count).to(equal(1))
                    expect(target.parameters?["user_id"] as? String).to(equal("@user:domain.com"))
                }

                it("uses correct method") {
                    expect(target.method) == Method.post
                }

                it("uses correct task") {
                    expect(String(describing: target.task)) == "request"
                }

                it("uses correct sample data") {
                    let expectedData = [:].jsonData()!

                    expect(target.sampleData).to(equal(expectedData))
                }

                it("uses correct validate") {
                    expect(target.validate) == true
                }
            }
        }
    }
}
