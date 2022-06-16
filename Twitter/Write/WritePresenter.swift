//
//  WritePresenter.swift
//  Twitter
//
//  Created by kmjmarine on 2022/06/16.
//

import Foundation

protocol WriteProtocol: AnyObject {}

final class WritePresenter {
    private weak var viewController: WriteProtocol?
    
    init(viewController: WriteProtocol) {
        self.viewController = viewController
    }
}
