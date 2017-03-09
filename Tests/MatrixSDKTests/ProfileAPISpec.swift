//
//  ProfileAPISpec.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 3/8/17.
//  Copyright © 2017 MatrixSDK. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Moya
@testable import MatrixSDK

class ProfileAPISpec: QuickSpec {
    override func spec() {
        describe("TARGET: ProfileAPI") {
            var target: SubTarget!

            context("GET /profile/{userId}") {
                beforeEach {
                    target = ProfileAPI.getProfile(of: "@user:domain.com")
                }

                it("uses correct shouldAuthorize") {
                    expect(target.shouldAuthorize) == false
                }

                it("uses correct path") {
                    expect(target.path) == "/_matrix/client/r0/profile/%40user:domain.com"
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
                        "avatar_url": "mxc://matrix.org/SDGdghriugerRg",
                        "displayname": "Alice Margatroid"
                        ].jsonData()!

                    expect(target.sampleData).to(equal(expectedData))
                }

                it("uses correct validate") {
                    expect(target.validate) == false
                }
            }

            context("GET /profile/{userId}/displayname") {
                beforeEach {
                    target = ProfileAPI.getDisplayName(of: "@user:domain.com")
                }

                it("uses correct shouldAuthorize") {
                    expect(target.shouldAuthorize) == false
                }

                it("uses correct path") {
                    expect(target.path) == "/_matrix/client/r0/profile/%40user:domain.com/displayname"
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
                        "displayname": "Alice Margatroid"
                        ].jsonData()!

                    expect(target.sampleData).to(equal(expectedData))
                }

                it("uses correct validate") {
                    expect(target.validate) == false
                }
            }

            context("GET /profile/{userId}/avatar_url") {
                beforeEach {
                    target = ProfileAPI.getAvatarUrl(of: "@user:domain.com")
                }

                it("uses correct shouldAuthorize") {
                    expect(target.shouldAuthorize) == false
                }

                it("uses correct path") {
                    expect(target.path) == "/_matrix/client/r0/profile/%40user:domain.com/avatar_url"
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
                        "avatar_url": "mxc://matrix.org/SDGdghriugerRg",
                        ].jsonData()!

                    expect(target.sampleData).to(equal(expectedData))
                }

                it("uses correct validate") {
                    expect(target.validate) == false
                }
            }

            context("PUT /profile/{userId}/displayname") {
                beforeEach {
                    target = ProfileAPI.setDisplayName(of: "@user:domain.com", to: "GP")
                }

                it("uses correct shouldAuthorize") {
                    expect(target.shouldAuthorize) == true
                }

                it("uses correct path") {
                    expect(target.path) == "/_matrix/client/r0/profile/%40user:domain.com/displayname"
                }

                it("uses correct parameter encoding.") {
                    expect(target.parameterEncoding is JSONEncoding) == true
                }

                it("uses correct parameters") {
                    expect(target.parameters?.count) == 1
                    expect(target.parameters?["displayname"] as? String) == "GP"

                }

                it("uses correct method") {
                    expect(target.method) == Method.put
                }

                it("uses correct task") {
                    expect(String(describing: target.task)) == "request"
                }

                it("uses correct sample data") {
                    let expectedData = Data()

                    expect(target.sampleData).to(equal(expectedData))
                }

                it("uses correct validate") {
                    expect(target.validate) == false
                }
            }

            context("PUT /profile/{userId}/avatar_url") {
                beforeEach {
                    target = ProfileAPI.setAvatarUrl(of: "@user:domain.com", to: "mxc://new_avatar_hash")
                }

                it("uses correct shouldAuthorize") {
                    expect(target.shouldAuthorize) == true
                }

                it("uses correct path") {
                    expect(target.path) == "/_matrix/client/r0/profile/%40user:domain.com/avatar_url"
                }

                it("uses correct parameter encoding.") {
                    expect(target.parameterEncoding is JSONEncoding) == true
                }

                it("uses correct parameters") {
                    expect(target.parameters?.count) == 1
                    expect(target.parameters?["avatar_url"] as? String) == "mxc://new_avatar_hash"
                }

                it("uses correct method") {
                    expect(target.method) == Method.put
                }

                it("uses correct task") {
                    expect(String(describing: target.task)) == "request"
                }

                it("uses correct sample data") {
                    let expectedData = Data()

                    expect(target.sampleData).to(equal(expectedData))
                }

                it("uses correct validate") {
                    expect(target.validate) == false
                }
            }
        }
    }
}
