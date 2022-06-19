//
//  ProfileViewController.swift
//  Twitter
//
//  Created by kmjmarine on 2022/06/19.
//

import UIKit
import SnapKit
import Toast

final class ProfileViewController: UIViewController {
    private lazy var presenter = ProfilePresenter(viewController: self)
    
    private lazy var nameTextField: UITextField = {
        let textFiled = UITextField()
        textFiled.font = .systemFont(ofSize: 20.0, weight: .medium)
        textFiled.delegate = self
        
        return textFiled
    }()
    
    private lazy var idTextField: UITextField = {
        let textFiled = UITextField()
        textFiled.font = .systemFont(ofSize: 16.0, weight: .bold)
        textFiled.delegate = self
        
        return textFiled
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("저장하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
        button.layer.cornerRadius = 15.0
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension ProfileViewController: ProfileProtocol {
    func setupViews() {
        navigationItem.title = "Profile"
        
        [nameTextField, idTextField, saveButton]
            .forEach { view.addSubview($0) }
        
        
        let superViewMargin: CGFloat = 16.0
        
        nameTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(superViewMargin)
            $0.trailing.equalToSuperview().inset(superViewMargin)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(superViewMargin)
        }
        
        idTextField.snp.makeConstraints {
            $0.leading.equalTo(nameTextField.snp.leading)
            $0.trailing.equalTo(nameTextField.snp.trailing)
            $0.top.equalTo(nameTextField.snp.bottom).offset(superViewMargin)
        }
        
        saveButton.snp.makeConstraints {
            $0.leading.equalTo(nameTextField.snp.leading)
            $0.trailing.equalTo(nameTextField.snp.trailing)
            $0.top.equalTo(idTextField.snp.bottom).offset(32.0)
        }
    }
    
    func setViews(with name: String, id: String) {
        nameTextField.text = name
        idTextField.text = id
    }
    
    func endEditing() {
        view.endEditing(true)
    }
    
    func showToast() {
        view.makeToast("변경할 내용을 입력해 주세요.")
    }
}

private extension ProfileViewController {
    @objc func didTapSaveButton() {
        presenter.didTapSaveButton(name: nameTextField.text, id: idTextField.text)
    }
}
