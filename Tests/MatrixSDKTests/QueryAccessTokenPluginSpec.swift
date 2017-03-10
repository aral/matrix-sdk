//
//  MatrixTokenPluginSpec.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 3/8/17.
//  Copyright © 2017 MatrixSDK. All rights reserved.
//

import Quick
import Nimble
import Moya
import Result
@testable import MatrixSDK

final class QueryAccessTokenPluginSpec: QuickSpec {
    struct TestTarget: TargetType, QueryAccessTokenAuthorizable {
        let baseURL = URL(string: "http://www.api.com/")!
        let path = ""
        let method = Method.get
        let parameters: [String: Any]? = nil
        let parameterEncoding: ParameterEncoding = URLEncoding.default
        let task = Task.request
        let sampleData = Data()

        let shouldAuthorize: Bool
    }

    override func spec() {
        let token = "eyeAm.AJsoN.weBTOKen"
        let plugin = QueryAccessTokenPlugin(token: token)

        it("adds an authorization header to AccessTokenAuthorizables when it's supposed to") {
            let target = TestTarget(shouldAuthorize: true)
            let request = URLRequest(url: target.baseURL)
            let preparedRequest = plugin.prepare(request, target: target)
            expect(preparedRequest.url?.query?.contain("access_token=eyeAm.AJsoN.weBTOKen")).to(beTrue())
        }

        it("doesn't add an authorization header to AccessTokenAuthorizables when it's not supposed to") {
            let target = TestTarget(shouldAuthorize: false)
            let request = URLRequest(url: target.baseURL)
            let preparedRequest = plugin.prepare(request, target: target)
            expect(preparedRequest.allHTTPHeaderFields).to(beNil())
        }
    }
}
