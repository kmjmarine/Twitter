//
//  WritePresenter.swift
//  Twitter
//
//  Created by kmjmarine on 2022/06/16.
//

import Foundation

protocol WriteProtocol: AnyObject {
    func setupViews()
    func dismiss()
}

final class WritePresenter {
    private weak var viewController: WriteProtocol?
    private let userDefaultsManager: UserDefaultsManagerProtocol
    
    init(viewController: WriteProtocol, userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultManager()) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
    }
    
    func viewDidLoad() {
        viewController?.setupViews()
    }
    
    func didTapLeftBarButtonItem() {
        viewController?.dismiss()
    }
    
    func didTapRightBarButtionItem(text: String) {
        let tweet = Tweet(user: User.shared, contents: text)
        userDefaultsManager.setTweet(tweet)
        viewController?.dismiss()
    }
}
