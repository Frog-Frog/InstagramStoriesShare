//
//  ISSError.swift
//  InstagramStoriesShare
//
//  Created by Tomosuke Okada on 2019/10/22.
//  Copyright © 2019 TomosukeOkada. All rights reserved.
//

import Foundation

public enum ISSError: Error {
    case notInstalled
    
    public var localizedDescription: String {
        switch self {
        case .notInstalled:
            return "Instagram is not installed or instagram-stories is not added to LSApplicationQueriesSchemes in info.plist."
        }
    }
}
