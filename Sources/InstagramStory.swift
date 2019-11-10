//
//  InstagramStory.swift
//  sunday-webry-ios
//
//  Created by OkadaTomosuke on 2019/10/14.
//  Copyright © 2019 andfactory. All rights reserved.
//

import UIKit

public struct InstagramStory {
    
    /*
     Data for an image asset in a supported format (JPG, PNG).
     Recommended dimensions: 640x480.
     This image will be placed as a sticker over the background.
     */
    public var stickerImage: Data?
    
    /*
     Data for an image asset in a supported format (JPG, PNG).
     Minimum dimensions 720x1280.
     Recommended image ratios 9:16 or 9:18.
     */
    public var backgroundImage: Data?
    
    /*
     Data for video asset in a supported format (H.264, H.265, WebM).
     Videos can be 1080p and up to 20 seconds in duration.
     Under 50 MB recommended.
     */
    public var backgroundVideo: Data?
    
    /*
     A hex string color value used in conjunction with the background layer bottom color value.
     If both values are the same, the background layer will be a solid color.
     If they differ, they will be used to generate a gradient instead.
     */
    public var backgroundTopColor: String?
    
    /*
        
    A hex string color value used in conjunction with the background layer bottom color value.
     If both values are the same, the background layer will be a solid color.
     If they differ, they will be used to generate a gradient instead.
    */
    public var backgroundBottomColor: String?
    
    /*
        
    A deep link URL to content in your app. If missing, the story will not include an attribution link.
     Use full URLs, including protocol
     (e.g. https://developers.facebok.com instead of developers.facebook.com)

    This feature is currently in closed beta and only available to approved developers.
     */
    public var contentUrl: String?
    
    public init(type: BackgroundType) {
        switch type {
        case .singleColor(let args):
            self.stickerImage = args.sticker?.pngData()
            let hex = args.color.hexString
            self.backgroundTopColor = hex
            self.backgroundBottomColor = hex
            self.contentUrl = args.contentUrl
        case .gradientColor(let args):
            self.stickerImage = args.sticker?.pngData()
            self.backgroundTopColor = args.topColor.hexString
            self.backgroundBottomColor = args.bottomColor.hexString
            self.contentUrl = args.contentUrl
        case .image(let args):
            self.stickerImage = args.sticker?.pngData()
            self.backgroundImage = args.image.pngData()
            self.contentUrl = args.contentUrl
        case .video(let args):
            self.stickerImage = args.sticker?.pngData()
            self.backgroundVideo = args.video
            self.contentUrl = args.contentUrl
        }
    }
}

extension InstagramStory: Encodable {
    
    func toDictionary() throws -> [String: Any] {
        var data: Data!
        do {
            data = try JSONEncoder().encode(self)
        }
        var object: Any!
        do {
            object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        }
        return object as? [String: Any] ?? [:]
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.stickerImage, forKey: .stickerImage)
        try container.encodeIfPresent(self.backgroundImage, forKey: .backgroundImage)
        try container.encodeIfPresent(self.backgroundVideo, forKey: .backgroundVideo)
        try container.encodeIfPresent(self.backgroundTopColor, forKey: .backgroundTopColor)
        try container.encodeIfPresent(self.backgroundBottomColor, forKey: .backgroundBottomColor)
        try container.encodeIfPresent(self.contentUrl, forKey: .contentUrl)
    }
    
    private enum CodingKeys: String, CodingKey {
        case stickerImage = "com.instagram.sharedSticker.stickerImage"
        case backgroundImage = "com.instagram.sharedSticker.backgroundImage"
        case backgroundVideo = "com.instagram.sharedSticker.backgroundVideo"
        case backgroundTopColor = "com.instagram.sharedSticker.backgroundTopColor"
        case backgroundBottomColor = "com.instagram.sharedSticker.backgroundBottomColor"
        case contentUrl = "com.instagram.sharedSticker.contentURL"
    }
}

