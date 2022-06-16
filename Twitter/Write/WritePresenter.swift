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
    
    init(viewController: WriteProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController?.setupViews()
    }
    
    func didTapLeftBarButtonItem() {
        viewController?.dismiss()
    }
    
    func didTapRightBarButtionItem() {
        viewController?.dismiss()
    }
}
