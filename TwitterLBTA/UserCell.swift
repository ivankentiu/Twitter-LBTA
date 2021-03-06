//
//  UserCell.swift
//  TwitterLBTA
//
//  Created by Ivan Ken Tiu on 12/09/2017.
//  Copyright © 2017 Ivan Ken Tiu. All rights reserved.
//

import LBTAComponents

// custom cell
class UserCell: DatasourceCell {
    
    // User info to Labels
    override var datasourceItem: Any? {
        didSet {
            guard let user = datasourceItem as? User else { return }
            nameLabel.text = user.name
            usernameLabel.text = user.username
            bioTextView.text = user.bioText
            profileImageView.image = user.profileImage
        }
    }
    
    let profileImageView: UIImageView =  {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Ivan")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Ivan Tiu"
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@buildthatapp"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(r: 124, g: 131, b: 139)
        return label
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.text = "iPhone, iPad, IOS, Programming Community. Join us to learn Swift, Objective-C and build IOS apps!"
        textView.font = UIFont.systemFont(ofSize: 15)
        // TextView white background by default
        textView.backgroundColor = .clear
        return textView
    }()
    
    let followButton: UIButton = {
        // reuse the custom color
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderColor = twitterBlue.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Follow", for: .normal)
        // make it bold
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(twitterBlue, for: .normal)
        button.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        // maintains 1:1 ratio
        button.imageView?.contentMode = .scaleAspectFit
        // move image a bit to the left
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        // title insets
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        
        // separator from class DatasourceCell
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        // clipping cell not tall enough go to HomeDataSourceController
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        // Easy Anchor here! (text)
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        followButton.anchor(topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
    }
}

