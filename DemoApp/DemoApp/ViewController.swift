//
//  ViewController.swift
//  DemoApp
//
//  Created by Tomosuke Okada on 2019/10/16.
//  Copyright © 2019 TomosukeOkada. All rights reserved.
//

import UIKit
import InstagramStoriesShare

class ViewController: UIViewController {

    private let storiesSharer = InstagramStoriesSharer()
    
    @IBOutlet private weak var shareButton: UIButton! {
        willSet {
            newValue.isEnabled = self.storiesSharer.canShare
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func didTapShareButton(_ sender: Any) {
        let story = InstagramStory(type: .gradientColor(topColor: .red, bottomColor: .blue))
        do {
            try self.storiesSharer.share(story)
        } catch {
            let error = error as? ISSError
            let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
            let action = UIAlertAction(title: "Close", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
