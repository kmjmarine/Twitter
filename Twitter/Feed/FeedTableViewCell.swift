//
//  FeedTableViewCell.swift
//  Twitter
//
//  Created by kmjmarine on 2022/06/15.
//

import UIKit
import SnapKit

final class FeedTableViewCell: UITableViewCell {
    static let identitier = "FeedTableViewCell"
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 21.0
        
        return imageView
    }()
    
    private lazy var writerNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .bold)
        
        return label
    }()
    
    private lazy var writerIDLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private lazy var contentsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .medium)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(Icon.like.image, for: .normal)
        button.tintColor = .secondaryLabel
        
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(Icon.message.image, for: .normal)
        button.tintColor = .secondaryLabel
        
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(Icon.share.image, for: .normal)
        button.tintColor = .secondaryLabel
        
        return button
    }()
    
    func setup(tweet: Tweet) {
        self.selectionStyle = .none
        
        setupLayout()
        
        writerNameLabel.text = tweet.user.name
        writerIDLabel.text = "@\(tweet.user.id)"
        contentsLabel.text = tweet.contents
    }
}

private extension FeedTableViewCell {
    func setupLayout() {
        let buttonStackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        
        [
            profileImageView,
            writerNameLabel,
            writerIDLabel,
            contentsLabel,
            buttonStackView
        ]
            .forEach { addSubview($0) }
        
        let superviewMargin: CGFloat = 16.0
        
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(superviewMargin)
            $0.top.equalToSuperview().inset(superviewMargin)
            $0.width.equalTo(40.0)
            $0.height.equalTo(40.0)
        }
        
        writerNameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(superviewMargin)
            $0.top.equalTo(profileImageView.snp.top)
        }
        
        writerIDLabel.snp.makeConstraints {
            $0.leading.equalTo(writerNameLabel.snp.trailing).offset(2.0)
            $0.bottom.equalTo(writerNameLabel.snp.bottom)
        }
        
        contentsLabel.snp.makeConstraints {
            $0.leading.equalTo(writerNameLabel.snp.leading)
            $0.top.equalTo(writerNameLabel.snp.bottom).offset(4.0)
            $0.trailing.equalToSuperview().inset(superviewMargin)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.leading.equalTo(writerNameLabel.snp.leading)
            $0.trailing.equalTo(contentsLabel.snp.trailing)
            $0.top.equalTo(contentsLabel.snp.bottom).offset(12.0)
            $0.bottom.equalToSuperview().inset(superviewMargin)
        }
    }
}
