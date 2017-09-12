//
//  HomeDataSourceController.swift
//  TwitterLBTA
//
//  Created by Ivan Ken Tiu on 10/09/2017.
//  Copyright © 2017 Ivan Ken Tiu. All rights reserved.
//
// Model Object Rendered Per Row
import LBTAComponents

class HomeDataSourceController: DatasourceController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarItems()
        
        // construct the HomeDataSource
        let homeDatasource = HomeDataSource()
        self.datasource = homeDatasource
    }
    
  
    
    // Line Spacing For Each Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // Size of each individual cell for each User
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let user = self.datasource?.item(indexPath) as? User {
//            user.bioText
            // base on how wide the screen is! from UserCell(leftConstant) - textView has some padding so 12 not 8
            let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
            
            let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
            
            // from bioTextView Font size which is 15
            let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
            
            // let's get an estimation height of our cell based on user.bioText (multiline so adjust the size of cell)
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
            
        }
        
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    // refsizeheader (size of header inside of collectionView) now it renders!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    // refsizefooter (size of header inside of collectionView) now it renders!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
}
