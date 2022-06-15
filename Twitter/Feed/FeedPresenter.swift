//
//  FeedPresneter.swift
//  Twitter
//
//  Created by kmjmarine on 2022/06/14.
//

import UIKit

protocol FeedProtocol: AnyObject {
    func setupViews()
}

final class FeedPresenter: NSObject {
    private weak var viewController: FeedProtocol?
    
    init(viewController: FeedProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController?.setupViews()
    }
}

extension FeedPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: FeedTableViewCell.identitier,
            for: indexPath
        ) as? FeedTableViewCell
        
        let tweet = Tweet(user: User.shared, contents: "Hi")
        cell?.setup(tweet: tweet)
        
        return cell ?? UITableViewCell()
    }
}

extension FeedPresenter: UITableViewDelegate {
    
}
