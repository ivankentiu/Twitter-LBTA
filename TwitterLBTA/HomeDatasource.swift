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
        
        let kindleCourseUser = User(name: "Kindle Course", username: "@kindleCourse", bioText: "This recently release course on https://videos.letsbuildthatapp.com/basic-training provides some excellent guidance on how to use UITableView and UICollectionView. This course also teaches some basics on the Swift language, for example If Statements and For Loops. This will be an excellent purchase for you.", profileImage: #imageLiteral(resourceName: "Ivan"))
        
        return [ivanUser, rayUser, kindleCourseUser]
    }()
    
    let tweets: [Tweet] = {
        let ivanUser = User(name: "Ivan Tiu", username: "@buildthatapp", bioText: "SiPhone, iPad, IOS, Programming Community. Join us to learn Swift, Objective-C and build IOS apps!", profileImage: #imageLiteral(resourceName: "Ivan"))
        
        let tweet = Tweet(user: ivanUser, message: "Welcome to episode 9 of the twitter series, really hope you guys are enjoying the series so far, I really really need a long text block to render out so we're going to stop here")
        
        let tweet2 = Tweet(user: ivanUser, message: "Welcome to episode 9 of the twitter series, really hope you guys are enjoying the series so far, I really really need a long text block to render out so we're going to stop here")
        return [tweet, tweet2]
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
    
    // place custom DatasourceCell here! TweetCell on 2nd Section!
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    // Render words on list easy!, no need to register, dequeue and which row the items belong!
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
}
