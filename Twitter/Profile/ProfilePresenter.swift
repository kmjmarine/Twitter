//
//  ProfilePresenter.swift
//  Twitter
//
//  Created by kmjmarine on 2022/06/19.
//

import Foundation

protocol ProfileProtocol: AnyObject {
    func setupViews()
    func setViews(with name: String, id: String)
    func endEditing()
    func showToast()
}

final class ProfilePresenter {
    private weak var viewController: ProfileProtocol?
    private var user: User {
        get { User.shared }
        set { User.shared = newValue }
    }
    
    init(viewController: ProfileProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController?.setupViews()
        viewController?.setViews(with: user.name, id: user.id)
    }
    
    func didTapSaveButton(name: String?, id: String?) {
        if name == nil || name == "" || id == nil || id == "" {
            viewController?.showToast()
            return
        }
        
        viewController?.endEditing()
        
        if let name = name {
            user.name = name
        }
        
        if let id = id {
            user.id = id
        }
        
        viewController?.setViews(with: user.name, id: user.id)
    }
}
