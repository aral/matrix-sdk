//
//  QueryAccessTokenPlugin.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 3/8/17.
//  Copyright © 2017 MatrixSDK. All rights reserved.
//

import Foundation
import Result
import Moya

// MARK: - QueryAccessTokenAuthorizable

/// A protocol for controlling the behavior of `QueryAccessTokenPlugin`.
public protocol QueryAccessTokenAuthorizable {

    /// Declares whether or not `AccessTokenPlugin` should add an authorization header
    /// to requests.
    var shouldAuthorize: Bool { get }
}

// MARK: - QueryAccessTokenPlugin

/**
 A plugin for query authorization to requests. Example:
 
 ```
 <url>?access_token=<token>
 ```
 
 - Note: By default, requests to all `TargetType`s will receive this header. You can control this
 behvaior by conforming to `AccessTokenAuthorizable`.
 */
public struct QueryAccessTokenPlugin: PluginType {

    /// The access token to be applied to the request.
    public let token: String

    /**
     Initialize a new `QueryAccessTokenPlugin`.
     
     - parameters:
     - token: The token to be applied in the pattern `access_token=<token>` has query param
     */
    public init(token: String) {
        self.token = token
    }

    /**
     Prepare a request by adding an authorization header if necessary.
     
     - parameters:
     - request: The request to modify.
     - target: The target of the request.
     - returns: The modified `URLRequest`.
     */
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        if let authorizable = target as? QueryAccessTokenAuthorizable, authorizable.shouldAuthorize == false {
            return request
        }

        var request = request
        let url = request.url?.appendingQueryParameters(["access_token": token])

        request.url = url

        return request
    }
}
