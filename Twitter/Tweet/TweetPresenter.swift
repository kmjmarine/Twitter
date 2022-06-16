//
//  TweetPresenter.swift
//  Twitter
//
//  Created by kmjmarine on 2022/06/15.
//

import Foundation

protocol TweetProtocol: AnyObject {
    func setup(tweet: Tweet)
    func setupLayout()
}

final class TweetPresenter {
    private weak var viewController: TweetProtocol?
    private let tweet: Tweet
    
    init(
        viewController: TweetProtocol,
        tweet: Tweet
    ) {
        self.viewController = viewController
        self.tweet = tweet
    }
    
    func viewDidLoad() {
        viewController?.setup(tweet: tweet)
        viewController?.setupLayout()
    }
}
