//
//  TweetViewController.swift
//  Twitter
//
//  Created by kmjmarine on 2022/06/15.
//

import UIKit
import SnapKit

final class TweetViewController: UIViewController {
    private var presenter: TweetPresenter!
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 30.0
        
        return imageView
    }()
    
    private lazy var writerNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .medium)
        
        return label
    }()
    
    private lazy var writerIDLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0, weight: .medium)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private lazy var contentsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .medium)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var islikedButton: UIButton = {
        let button = UIButton()
        button.setImage(Icon.like.image, for: .normal)
        button.tintColor = .secondaryLabel
        
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(Icon.share.image, for: .normal)
        button.tintColor = .secondaryLabel
        
        return button
    }()
    
    init(tweet: Tweet) {
        super.init(nibName: nil, bundle: nil)
        
        presenter = TweetPresenter(viewController: self, tweet: tweet)
        view.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}


extension TweetViewController: TweetProtocol {
    func setup(tweet: Tweet) {
        writerNameLabel.text = tweet.user.name
        writerIDLabel.text = "@\(tweet.user.id)"
        contentsLabel.text = tweet.contents
    }
    
    func setupLayout() {
        let writerInfoStackView = UIStackView(arrangedSubviews: [writerNameLabel, writerIDLabel])
        writerInfoStackView.axis = .vertical
        writerInfoStackView.distribution = .equalSpacing
        writerInfoStackView.spacing = 4.0
        
        let buttonStackView = UIStackView(arrangedSubviews: [islikedButton, shareButton])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        
        [profileImageView, writerInfoStackView, contentsLabel, buttonStackView]
            .forEach { view.addSubview($0) }
            
        let superViewMargin: CGFloat = 16.0
        
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(superViewMargin)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(superViewMargin)
            $0.width.equalTo(60.0)
            $0.height.equalTo(60.0)
        }
        
        writerInfoStackView.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(8.0)
            $0.trailing.equalToSuperview().inset(superViewMargin)
            $0.centerY.equalTo(profileImageView.snp.centerY)
        }
        
        contentsLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.leading)
            $0.trailing.equalTo(writerInfoStackView.snp.trailing)
            $0.top.equalTo(profileImageView.snp.bottom).offset(8.0)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.leading)
            $0.trailing.equalTo(writerInfoStackView.snp.trailing)
            $0.top.equalTo(contentsLabel.snp.bottom).offset(superViewMargin)
        }
    }
}


