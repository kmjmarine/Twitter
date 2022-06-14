//
//  FeedViewController.swift
//  Twitter
//
//  Created by kmjmarine on 2022/06/14.
//

import UIKit

final class FeedViewController: UIViewController {
    private lazy var presenter = FeedPresenter(viewController: self)
}


extension FeedViewController: FeedProtocol {
    
}
