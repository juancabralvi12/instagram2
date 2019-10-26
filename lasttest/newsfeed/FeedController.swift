//
//  FeedController.swift
//  lasttest
//
//  Created by Juan Cabral on 19/10/19.
//  Copyright © 2019 Juan Cabral. All rights reserved.
//

import UIKit
import CoreData

class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var posts:[NSManagedObject] = [NSManagedObject]()
    let cellID = "CellLayout"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(PostCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        
        
        saveImage(image: UIImage(named: "gatito")!, fileName: "NuevoGatito")
        purge()
        setupData()
        fetchData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PostCell
        cell.post = posts[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height/2)
    }
}
