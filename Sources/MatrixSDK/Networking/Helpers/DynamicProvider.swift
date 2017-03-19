//
//  DynamicProvider.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 3/8/17.
//  Copyright © 2017 MatrixSDK. All rights reserved.
//

import Foundation
import Moya
import Result

class DynamicProvider<Target: SubTarget>: MoyaProvider<DynamicTarget> {
    let baseUrl: URL

    public init(baseUrl: URL, endpointClosure: @escaping EndpointClosure = MoyaProvider.defaultEndpointMapping,
                requestClosure: @escaping RequestClosure = MoyaProvider.defaultRequestMapping,
                stubClosure: @escaping StubClosure = MoyaProvider.neverStub,
                plugins: [PluginType] = [],
                trackInflights: Bool = false) {
        self.baseUrl = baseUrl

        super.init(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, plugins: plugins, trackInflights: trackInflights)
    }

    // add initializer to take `baseUrl` and call super with the rest of the arguments
    func request(_ subTarget: Target, completion: @escaping ((Result<Response, MoyaError>) -> Void)) {
        let dynamicTarget = DynamicTarget(baseUrl: baseUrl, subTarget: subTarget)
        super.request(dynamicTarget, completion: completion)
    }
}
