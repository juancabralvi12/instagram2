//
//  FullCell.swift
//  lasttest
//
//  Created by Juan Cabral on 12/10/19.
//  Copyright © 2019 Juan Cabral. All rights reserved.
//

import UIKit

class FullCell: UICollectionViewCell {
    
    let userProfileImageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 40 / 2
        iv.image = UIImage(named: "joker")
        return iv
    }()
    
    let usernameLabel : UILabel = {
        let label = UILabel()
        label.text = "Joker"
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()
    
    let photoImageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = UIImage(named: "joker")
        return iv
    }()
    
    let optionsButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("•••", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var commentButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "comment")?.withRenderingMode(.alwaysOriginal),
                        for: .normal)
        return button
    }()
    
    let sendMessageButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "send2")?.withRenderingMode(.alwaysOriginal),
                        for: .normal)
        return button
    }()
    
    let likeButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "like_unselected")?.withRenderingMode(.alwaysOriginal),
                        for: .normal)
        return button
    }()
    
    let bookmarkButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ribbon")?.withRenderingMode(.alwaysOriginal),
                        for: .normal)
        return button
    }()
    
    func getCaptionAttributedText(username: String, caption: String) -> NSMutableAttributedString {
        let attributedText = NSMutableAttributedString(string: "\(username) ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: caption, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]))
        attributedText.append(NSAttributedString(string: "\n\n", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 4)]))
         //1 week ago, 1 day ago, etc
            attributedText.append(NSAttributedString(string: "1 day ago", attributes:
                [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14),
                 NSAttributedString.Key.foregroundColor : UIColor.gray]))
        return attributedText
    }
    
    
    let captionLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Joaquin Phoenix doing the Joker."
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        addSubview(usernameLabel)
        addSubview(userProfileImageView)
        addSubview(photoImageView)
        addSubview(optionsButton)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(sendMessageButton)
        addSubview(captionLabel)
        
        setupUserProfileImageView()
        setupBookmarkButton()
        setupPhotoImageView()
        setupUsernameLabel()
        setupOptionsButton()
        setupActionButtons()
        setupCaptionLabel()
    }
    
    fileprivate func setupCaptionLabel(){
        captionLabel.anchor(top: likeButton.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
    }
    
    fileprivate func setupBookmarkButton(){
        addSubview(bookmarkButton)
        bookmarkButton.anchor(top: photoImageView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 40, height: 50)
    }
    
    fileprivate func setupActionButtons(){
        let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, sendMessageButton])
        
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.anchor(top: photoImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 120, height: 50)
    }
    
    fileprivate func setupOptionsButton(){
        optionsButton.anchor(top: topAnchor, left: nil, bottom: photoImageView.topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 44, height: 0)
    }
    
    fileprivate func setupUsernameLabel(){
        usernameLabel.anchor(top: topAnchor, left: userProfileImageView.rightAnchor, bottom: photoImageView.topAnchor, right: optionsButton.leftAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    fileprivate func setupUserProfileImageView(){
        userProfileImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
    }
    
    fileprivate func setupPhotoImageView(){
        photoImageView.anchor(top: userProfileImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        photoImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
