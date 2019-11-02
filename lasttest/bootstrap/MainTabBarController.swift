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
    }
    
    fileprivate func setupViewControllers() -> Void {
        let redViewController = UIViewController()
        redViewController.view.backgroundColor = .red
        
        let greenViewController = UIViewController()
        greenViewController.view.backgroundColor = UIColor.green
        
        viewControllers = [redViewController, greenViewController]
        tabBar.tintColor = .black
        
        guard let items = tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
}
