//
//  Cells.swift
//  TwitterLBTA
//
//  Created by Ivan Ken Tiu on 11/09/2017.
//  Copyright © 2017 Ivan Ken Tiu. All rights reserved.
//

import LBTAComponents

// custom Header
class UserHeader: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .blue
    }
}

// custom Footer
class UserFooter: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .green
    }
}

// custom cell
class UserCell: DatasourceCell {
    
    // access the words[indexPath.item] below
    override var datasourceItem: Any? {
        didSet {
            nameLabel.text = datasourceItem as? String
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST TEST TEST"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .yellow
        
        addSubview(nameLabel)
        
        // Easy Anchor here! (text)
        nameLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
