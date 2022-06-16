//
//  WriteViewController.swift
//  Twitter
//
//  Created by kmjmarine on 2022/06/16.
//

import UIKit
import SnapKit

final class WriteViewController:UIViewController {
    private lazy var presenter = WritePresenter(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
    }
}


extension WriteViewController: WriteProtocol {
    
}
