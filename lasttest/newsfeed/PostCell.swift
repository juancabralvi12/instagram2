//
//  FeedCell.swift
//  lasttest
//
//  Created by Juan Cabral on 19/10/19.
//  Copyright © 2019 Juan Cabral. All rights reserved.
//

import UIKit

class PostCell: UICollectionViewCell {
    
    var post:Post? {
        didSet {
            if let post = post {
                profileImageView.image = UIImage(named: post.userImage ?? "")
                profileNameLabel.text = post.userName ?? ""
                picture.image = UIImage(named: post.postImage ?? "")
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        /*Header*/
        
        setupProfileImage()
        setupProfileName()
        setupOptionsButton()
        
        /*Center*/
        
        setupImage()
        
        /*Footer*/
        
        //setupLikeButton()
        setupBottoms()
        setupRibbonButton()
    }
    
    /*Header*/
    
    let profileNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "Victor Rodriguez"
        lbl.font = .boldSystemFont(ofSize: 14)
        return lbl
    }()
    
    let profileImageView: UIImageView = {
        let p = UIImageView()
        p.contentMode = .scaleAspectFill
        p.clipsToBounds = true
        p.layer.cornerRadius = 20
        p.image = UIImage(named: "joker")
        return p
    }()
    
    let optionsButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("•••", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    /*Center*/
    
    let picture: UIImageView = {
        let p = UIImageView()
        p.contentMode = .scaleAspectFill
        p.clipsToBounds = true
        p.image = UIImage(named: "joker")
        return p
    }()
    
    /*Bottom*/
    
    let likeButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "like_unselected")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    
    let commentButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "comment")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    
    let sendButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "send2")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    
    let ribbonButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ribbon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    
    /*Setups*/
    
    func setupProfileImage() {
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
    }
    
    func setupProfileName() {
        addSubview(profileNameLabel)
        profileNameLabel.anchor(top: topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 0, width: 0, height: 40)
    }
    
    func setupOptionsButton() {
        addSubview(optionsButton)
        optionsButton.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 8, paddingRight: 0, width: 50, height: 40)
    }
    
    func setupImage() {
        addSubview(picture)
        picture.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func setupBottoms() {
        
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(sendButton)
        
        let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, sendButton])
        stackView.distribution = .fillEqually
        addSubview(stackView)
        
        stackView.anchor(top: picture.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 120, height: 50)
    }
    
    func setupRibbonButton() {
        addSubview(ribbonButton)
        ribbonButton.anchor(top: picture.bottomAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
    }
    
    /*
    func setupLikeButton() {
        addSubview(likeButton)
        likeButton.anchor(top: picture.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 8, paddingRight: 0, width: 50, height: 50)
    }
    */
    
    /*Other strange commands*/
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
