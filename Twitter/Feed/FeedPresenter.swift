//
//  FeedPresneter.swift
//  Twitter
//
//  Created by kmjmarine on 2022/06/14.
//

import Foundation

protocol FeedProtocol: AnyObject {}

final class FeedPresenter {
    private weak var viewController: FeedProtocol?
    
    init(viewController: FeedProtocol) {
        self.viewController = viewController
    }
}
