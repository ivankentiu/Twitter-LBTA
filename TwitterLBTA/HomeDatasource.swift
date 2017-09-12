//
//  HomeDatasource.swift
//  TwitterLBTA
//
//  Created by Ivan Ken Tiu on 11/09/2017.
//  Copyright © 2017 Ivan Ken Tiu. All rights reserved.
//

import LBTAComponents

// custom implementation of Datasource
class HomeDataSource: Datasource {
    
    let users: [User] = {
        let ivanUser = User(name: "Ivan Tiu", username: "@buildthatapp", bioText: "SiPhone, iPad, IOS, Programming Community. Join us to learn Swift, Objective-C and build IOS apps!", profileImage: #imageLiteral(resourceName: "Ivan"))
        
        let rayUser = User(name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference.", profileImage: #imageLiteral(resourceName: "ray_profile_image"))
        
        return [ivanUser, rayUser]
    }()
    
    // let words = ["user1", "user2", "user3"]
    
    // Why array of class instead of just the class? * collectionView can have more than one section (slot)
    
    // use Header easy! not render! check below (change size)
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    // use Footer easy! not render! check below (change size)
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    // place custom DatasourceCell here! easy!
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    // Render words on list easy!, no need to register, dequeue and which row the items belong!
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
}
