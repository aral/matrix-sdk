//
//  PresenceAPISpec.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 3/10/17.
//  Copyright © 2017 MatrixSDK. All rights reserved.
//

import Quick
import Nimble
import Moya
import SwiftyJSON

@testable import MatrixSDK

class PresenceAPISpec: QuickSpec {
    override func spec() {
        describe("TARGET: PresenceAPI") {
            var target: SubTarget!

            describe("GET /_matrix/client/r0/presence/list/{userId}") {
                beforeEach {
                    target = PresenceAPI.getList(of: "@user:domain.com")
                }

                it("uses correct shouldAuthorize") {
                    expect(target.shouldAuthorize) == true
                }

                it("uses correct path") {
                    expect(target.path) == "/_matrix/client/r0/presence/list/%40user:domain.com"
                }

                it("uses correct parameter encoding.") {
                    expect(target.parameterEncoding is JSONEncoding) == true
                }

                it("uses correct parameters") {
                    expect(target.parameters).to(beNil())
                }

                it("uses correct method") {
                    expect(target.method) == Method.get
                }

                it("uses correct task") {
                    expect(String(describing: target.task)) == "request"
                }

                it("uses correct sample data") {
                    let expectedData = [
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

                    expect(target.sampleData).to(equal(expectedData))
                }

                it("uses correct validate") {
                    expect(target.validate) == true
                }
            }

            describe("POST /_matrix/client/r0/presence/list/{userId}") {
                beforeEach {
                    target = PresenceAPI.updateList(of: "@user:domain.com", drop: ["@alice:matrix.org"], invite: ["@bob:matrix.org"])
                }

                it("uses correct shouldAuthorize") {
                    expect(target.shouldAuthorize) == true
                }

                it("uses correct path") {
                    expect(target.path) == "/_matrix/client/r0/presence/list/%40user:domain.com"
                }

                it("uses correct parameter encoding.") {
                    expect(target.parameterEncoding is JSONEncoding) == true
                }

                it("uses correct parameters") {
                    expect(target.parameters).toNot(beNil())

                    let json = JSON(target.parameters!)

                    let invite = json["invite"].array
                    expect(invite).toNot(beNil())
                    expect(invite?.count).to(equal(1))
                    expect(invite?.contains("@bob:matrix.org")).to(beTrue())

                    let drop = json["drop"].array
                    expect(drop).toNot(beNil())
                    expect(drop?.count).to(equal(1))
                    expect(drop?.contains("@alice:matrix.org")).to(beTrue())
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

            describe("GET /_matrix/client/r0/presence/{userId}/status") {
                beforeEach {
                    target = PresenceAPI.getState(of: "@user:domain.com")
                }

                it("uses correct shouldAuthorize") {
                    expect(target.shouldAuthorize) == true
                }

                it("uses correct path") {
                    expect(target.path) == "/_matrix/client/r0/presence/%40user:domain.com/status"
                }

                it("uses correct parameter encoding.") {
                    expect(target.parameterEncoding is JSONEncoding) == true
                }

                it("uses correct parameters") {
                    expect(target.parameters).to(beNil())
                }

                it("uses correct method") {
                    expect(target.method) == Method.get
                }

                it("uses correct task") {
                    expect(String(describing: target.task)) == "request"
                }

                it("uses correct sample data") {
                    let expectedData = [
                        "last_active_ago": 4305,
                        "currently_active": true,
                        "user_id": "@user:domain.com",
                        "presence": "online"
                        ].jsonData()!

                    expect(target.sampleData).to(equal(expectedData))
                }

                it("uses correct validate") {
                    expect(target.validate) == true
                }
            }

            describe("PUT /_matrix/client/r0/presence/{userId}/status") {
                beforeEach {
                    target = PresenceAPI.setState(of: "@user:domain.com", to: .online, withMessage: "I'm here.")
                }

                it("uses correct shouldAuthorize") {
                    expect(target.shouldAuthorize) == true
                }

                it("uses correct path") {
                    expect(target.path) == "/_matrix/client/r0/presence/%40user:domain.com/status"
                }

                it("uses correct parameter encoding.") {
                    expect(target.parameterEncoding is JSONEncoding) == true
                }

                it("uses correct parameters") {
                    expect(target.parameters).toNot(beNil())
                    expect(target.parameters?.count).to(equal(2))

                    let json = JSON(target.parameters!)

                    expect(json["presence"].string).to(equal(PresenceState.online.rawValue))
                    expect(json["status_msg"].string).to(equal("I'm here."))
                }

                it("uses correct method") {
                    expect(target.method) == Method.put
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

                context("without status message") {
                    it("uses correct parameters") {
                        target = PresenceAPI.setState(of: "@user:domain.com", to: .online, withMessage: nil)

                        expect(target.parameters).toNot(beNil())
                        expect(target.parameters?.count).to(equal(1))

                        let json = JSON(target.parameters!)

                        expect(json["presence"].string).to(equal(PresenceState.online.rawValue))
                        expect(json["status_msg"].string).to(beNil())
                    }
                }
            }
        }
    }
}
