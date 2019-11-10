//
//  InstagramStoryManager.swift
//  sunday-webry-ios
//
//  Created by OkadaTomosuke on 2019/10/14.
//  Copyright © 2019 andfactory. All rights reserved.
//

import UIKit

open class InstagramStoriesSharer {
    
    private let urlScheme = URL(string: "instagram-stories://share")!
    
    public init(){}
    
    public var canShare: Bool {
        return UIApplication.shared.canOpenURL(self.urlScheme)
    }
    
    open func share(_ story: InstagramStory) throws {
        guard self.canShare else {
            throw ISSError.notInstalled
        }
        var item: [String: Any]!
        do {
            item = try story.toDictionary()
        }
        let options: [UIPasteboard.OptionsKey: Any] = [.expirationDate: Date().addingTimeInterval(60 * 5)]
        UIPasteboard.general.setItems([item], options: options)
        UIApplication.shared.open(self.urlScheme, options: [:], completionHandler: nil)
    }
}
