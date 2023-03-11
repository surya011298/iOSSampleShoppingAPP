//
//  TabBarVC.swift
//  assignment
//
//  Created by Surya Koneru on 11/03/23.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let items = tabBar.items else {return}
        items[0].title = "Products"
        items[1].title = "Profile"
       
        
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
    }


}
