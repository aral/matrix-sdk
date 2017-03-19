//
//  AuthResponseSpec.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 3/14/17.
//  Copyright © 2017 MatrixSDK. All rights reserved.
//

import Quick
import Nimble
import Unbox
@testable import MatrixSDK

class AuthResponseSpec: QuickSpec {
    override func spec() {
        describe("RESPONSE: AuthResponse") {
            var auth: AuthResponse?

            it("it initializable from response data") {
                let target: SubTarget = AuthAPI.login(type: .password, password: "12345", username: "user", address: nil)
                auth = try? unbox(data: target.sampleData)

                expect(auth).notTo(beNil())
                expect(auth?.accessToken).to(equal("MDAxOWxvY2F0aW9uIHpi"))
                expect(auth?.homeserver).to(equal("domain.com"))
                expect(auth?.userId).to(equal("@user:domain.com"))
                expect(auth?.deviceId).to(equal("VUZR"))
            }

            context("required fields") {
                var data: [String: Any]!

                beforeEach {
                    data = [
                        "access_token": "MDAxOWxvY2F0aW9uIHpi",
                        "home_server": "domain.com",
                        "user_id": "@user:domain.com",
                        "device_id": "VUZR"
                    ]
                }

                it("it can't map without access token") {
                    data.removeValue(forKey: "access_token")
                    auth = try? unbox(dictionary: data)

                    expect(auth).to(beNil())
                }

                it("it can't map without homeserver") {
                    data.removeValue(forKey: "home_server")
                    auth = try? unbox(dictionary: data)

                    expect(auth).to(beNil())
                }

                it("it can't map without user id") {
                    data.removeValue(forKey: "user_id")
                    auth = try? unbox(dictionary: data)

                    expect(auth).to(beNil())
                }
            }
        }
    }
}
