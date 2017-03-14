//
//  SessionAPISpec.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 3/9/17.
//  Copyright © 2017 MatrixSDK. All rights reserved.
//

import Quick
import Nimble
import Moya
@testable import MatrixSDK

class AuthAPISpec: QuickSpec {
    override func spec() {
        describe("TARGET: SessionAPI") {
            var target: SubTarget!

            describe("GET /login") {
                context("with user and password") {
                    beforeEach {
                        target = AuthAPI.login(type: .password, password: "12345", username: "user", address: nil)
                    }

                    it("uses correct shouldAuthorize") {
                        expect(target.shouldAuthorize) == false
                    }

                    it("uses correct path") {
                        expect(target.path) == "/_matrix/client/r0/login"
                    }

                    it("uses correct parameter encoding.") {
                        expect(target.parameterEncoding is JSONEncoding) == true
                    }

                    it("uses correct parameters") {
                        expect(target.parameters?.count) == 3
                        expect(target.parameters?["type"] as? String) == LoginType.password.rawValue
                        expect(target.parameters?["user"] as? String) == "user"
                        expect(target.parameters?["password"] as? String) == "12345"
                    }

                    it("uses correct method") {
                        expect(target.method) == Method.post
                    }

                    it("uses correct task") {
                        expect(String(describing: target.task)) == "request"
                    }

                    it("uses correct sample data") {
                        let expectedData = [
                            "access_token": "MDAxOWxvY2F0aW9uIHpi",
                            "home_server": "domain.com",
                            "user_id": "@user:domain.com",
                            "refresh_token": "MDAxOWxvY2F0aW9uIenECg",
                            "device_id": "VUZR"
                            ].jsonData()!

                        expect(target.sampleData).to(equal(expectedData))
                    }

                    it("uses correct validate") {
                        expect(target.validate) == true
                    }
                }

                context("with third party address") {
                    beforeEach {
                        target = AuthAPI.login(type: .password, password: "12345", username: nil, address: "user@domain.com")
                    }

                    it("uses correct shouldAuthorize") {
                        expect(target.shouldAuthorize) == false
                    }

                    it("uses correct path") {
                        expect(target.path) == "/_matrix/client/r0/login"
                    }

                    it("uses correct parameter encoding.") {
                        expect(target.parameterEncoding is JSONEncoding) == true
                    }

                    it("uses correct parameters") {
                        expect(target.parameters?.count) == 4
                        expect(target.parameters?["type"] as? String) == LoginType.password.rawValue
                        expect(target.parameters?["address"] as? String) == "user@domain.com"
                        expect(target.parameters?["password"] as? String) == "12345"
                        expect(target.parameters?["medium"] as? String) == "email"
                    }

                    it("uses correct method") {
                        expect(target.method) == Method.post
                    }

                    it("uses correct task") {
                        expect(String(describing: target.task)) == "request"
                    }

                    it("uses correct sample data") {
                        let expectedData = [
                            "access_token": "MDAxOWxvY2F0aW9uIHpi",
                            "home_server": "domain.com",
                            "user_id": "@user:domain.com",
                            "refresh_token": "MDAxOWxvY2F0aW9uIenECg",
                            "device_id": "VUZR"
                            ].jsonData()!

                        expect(target.sampleData).to(equal(expectedData))
                    }

                    it("uses correct validate") {
                        expect(target.validate) == true
                    }
                }
            }

            describe("POST /logout") {
                beforeEach {
                    target = AuthAPI.logout
                }

                it("uses correct shouldAuthorize") {
                    expect(target.shouldAuthorize) == true
                }

                it("uses correct path") {
                    expect(target.path) == "/_matrix/client/r0/logout"
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

            describe("POST /tokenrefresh") {
                beforeEach {
                    target = AuthAPI.refresh(token: "ABC123456")
                }

                it("uses correct shouldAuthorize") {
                    expect(target.shouldAuthorize) == true
                }

                it("uses correct path") {
                    expect(target.path) == "/_matrix/client/r0/tokenrefresh"
                }

                it("uses correct parameter encoding.") {
                    expect(target.parameterEncoding is JSONEncoding) == true
                }

                it("uses correct parameters") {
                    expect(target.parameters?.count) == 1
                    expect(target.parameters?["refresh_token"] as? String) == "ABC123456"
                }

                it("uses correct method") {
                    expect(target.method) == Method.post
                }

                it("uses correct task") {
                    expect(String(describing: target.task)) == "request"
                }

                it("uses correct sample data") {
                    let expectedData = [
                        "access_token": "new access token",
                        "refresh_token": "new refresh token"
                        ].jsonData()!

                    expect(target.sampleData).to(equal(expectedData))
                }

                it("uses correct validate") {
                    expect(target.validate) == true
                }
            }
        }
    }
}
