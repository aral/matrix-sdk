//
//  SubTarget.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 3/8/17.
//  Copyright © 2017 MatrixSDK. All rights reserved.
//

import Foundation
import Moya

/// The protocol used to define the specifications necessary for a `DynamicTarget`.
public protocol SubTarget: QueryAccessTokenAuthorizable {
    var path: String { get }
    var method: Moya.Method { get }
    var queryParameters: [String: Any]? { get }
    var parameters: [String: Any]? { get }
    var sampleData: Data { get }
    var task: Task { get }
    var parameterEncoding: ParameterEncoding { get }
    var validate: Bool { get }
}
