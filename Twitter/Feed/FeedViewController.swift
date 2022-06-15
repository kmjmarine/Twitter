//
//  FeedViewController.swift
//  Twitter
//
//  Created by kmjmarine on 2022/06/14.
//

import UIKit
import SnapKit
import Floaty

final class FeedViewController: UIViewController {
    private lazy var presenter = FeedPresenter(viewController: self)
    
    private lazy var writeButton: Floaty = {
        let floaty = Floaty(size: 50.0)
        floaty.sticky = true
        floaty.handleFirstItemDirectly = true
        floaty.addItem(title: "") { _ in
            print("Floaty!")
        }
        floaty.buttonImage = Icon.write.image?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        return floaty
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = presenter
        tableView.dataSource = presenter
        
        tableView.register(
            FeedTableViewCell.self,
            forCellReuseIdentifier: FeedTableViewCell.identitier
        )
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension FeedViewController: FeedProtocol {
    func setupViews() {
        navigationItem.title = "Feed"
        
        [tableView, writeButton].forEach { view.addSubview($0) }
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        writeButton.paddingY = 100.0
    }
}
