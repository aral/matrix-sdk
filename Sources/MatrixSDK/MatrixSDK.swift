//
//  MatrixSDK.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 3/7/17.
//  Copyright © 2017 MatrixSDK. All rights reserved.
//

import Foundation

public typealias UserId = String
public typealias EventId = String
public typealias RoomId = String
public typealias MxcUrl = String

public enum LoginType: String {
    case password = "m.login.password"
}

public enum LoginMedium: String, RawRepresentable {
    case email
}

public extension Array {
    public func jsonData(prettify: Bool = false) -> Data? {
        guard JSONSerialization.isValidJSONObject(self) else {
            return nil
        }
        let options = (prettify == true) ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions()
        return try? JSONSerialization.data(withJSONObject: self, options: options)
    }
}
