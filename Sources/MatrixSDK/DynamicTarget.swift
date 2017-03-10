//
//  DynamicTarget.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 3/8/17.
//  Copyright © 2017 MatrixSDK. All rights reserved.
//

import Foundation
import Moya
import Result

struct DynamicTarget: TargetType, QueryAccessTokenAuthorizable {
    let baseURL: URL
    let subTarget: SubTarget

    /// Initialize a SingleURLTarget
    init(baseUrl: URL, subTarget: SubTarget) {
        self.baseURL = baseUrl
        self.subTarget = subTarget
    }

    var path: String { return subTarget.path}
    var method: Moya.Method { return subTarget.method}
    var parameters: [String: Any]? { return subTarget.parameters }
    var sampleData: Data { return subTarget.sampleData }
    var task: Task { return subTarget.task }
    var parameterEncoding: ParameterEncoding { return subTarget.parameterEncoding }
    var validate: Bool { return subTarget.validate }
    var shouldAuthorize: Bool { return subTarget.shouldAuthorize }
}
