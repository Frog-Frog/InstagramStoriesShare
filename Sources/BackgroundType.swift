//
//  BackgroundType.swift
//  InstagramStoriesShare
//
//  Created by Tomosuke Okada on 2019/10/22.
//  Copyright © 2019 TomosukeOkada. All rights reserved.
//

import UIKit

public enum BackgroundType {
    case singleColor(color: UIColor, sticker: UIImage? = nil, contentUrl: String? = nil)
    case gradientColor(topColor: UIColor, bottomColor: UIColor, sticker: UIImage? = nil, contentUrl: String? = nil)
    case image(image: UIImage, sticker: UIImage? = nil, contentUrl: String? = nil)
    case video(video: Data?, sticker: UIImage? = nil, contentUrl: String? = nil)
}
