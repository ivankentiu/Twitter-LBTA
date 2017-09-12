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
        
        // construct the HomeDataSource
        let homeDatasource = HomeDataSource()
        self.datasource = homeDatasource
    }
    
    // Size of each individual cell for each User
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
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
