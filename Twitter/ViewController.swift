//
//  ViewController.swift
//  Twitter
//
//  Created by kmjmarine on 2022/06/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let manager = UserDefaultManager()
        manager.setTweet(Tweet(user: User.shared, contents: "Hi hello"))
        
        print(manager.getTweet())
    }
}

