//
//  PresenceResponseSpec.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 3/14/17.
//  Copyright © 2017 MatrixSDK. All rights reserved.
//

import Quick
import Nimble
import Unbox
@testable import MatrixSDK

class PresenceResponseSpec: QuickSpec {
    override func spec() {
        describe("RESPONSE: PresenceResponse") {
            var presence: PresenceResponse?

            it("it initializable from target sample data") {
                let target: SubTarget =  PresenceAPI.getState(of: "@user:domain.com")
                presence = try? unbox(data: target.sampleData)

                expect(presence).notTo(beNil())
                expect(presence?.lastActiveAgo).to(equal(UInt64(4305)))
                expect(presence?.currentlyActive).to(beTrue())
                expect(presence?.presence.rawValue).to(equal(PresenceState.online.rawValue))
                expect(presence?.statusMsg).to(beNil())
            }

            context("required fields") {
                var data: [String: Any]!

                beforeEach {
                    data = [
                        "last_active_ago": 4305,
                        "currently_active": true,
                        "user_id": "@user:domain.com",
                        "presence": "online"
                    ]
                }

                it("it can't map without presence state") {
                    data.removeValue(forKey: "presence")
                    presence = try? unbox(dictionary: data)

                    expect(presence).to(beNil())
                }
            }
        }
    }
}
