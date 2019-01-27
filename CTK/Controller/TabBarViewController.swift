//
//  TabBarViewController.swift
//  CTK
//
//  Created by Temirlan Merekeyev on 1/14/19.
//  Copyright © 2019 Temirlan Merekeyev. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var user : User?
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        for vc in viewControllers!{
            if vc is ProfileViewController{
                let profileVC = vc as! ProfileViewController
                profileVC.user = user
            }
        }
    }
    

}
