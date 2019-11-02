//
//  MainTabBarController.swift
//  lasttest
//
//  Created by Juan Cabral on 02/11/19.
//  Copyright © 2019 Juan Cabral. All rights reserved.
//

import UIKit

class MainTabBarController : UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupViewControllers()
        self.selectedIndex = 0
    }
     
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let index = viewControllers?.index(of: viewController)
        if index == 2 {
            let photoController = UINavigationController(rootViewController  :UIViewController())
            photoController.view.backgroundColor = .blue
            present(photoController, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    fileprivate func setupViewControllers() -> Void {
        
        
        let feedController = UINavigationController(rootViewController: FeedController(collectionViewLayout: UICollectionViewFlowLayout()))
        feedController.tabBarItem.image = UIImage(named: "home_unselected")
        feedController.tabBarItem.selectedImage = UIImage(named: "home_selected")
        
        
        let redViewController = UIViewController()
        redViewController.view.backgroundColor = .red
        redViewController.tabBarItem.image = UIImage(named:"profile_unselected" )
        redViewController.tabBarItem.selectedImage = UIImage(named: "profile_selected")
        
        
        let greenViewController = UIViewController()
        greenViewController.view.backgroundColor = UIColor.green
        
        viewControllers = [feedController, redViewController, greenViewController]
        tabBar.tintColor = .black
        
        guard let items = tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
        
        //tabBarController?.selectedIndex = 2
        //tabBarController?.selectedViewController = redViewController
        //tabBar.selectedItem = tabBar.items![1] as UITabBarItem
    }
}
