//
//  ProfileViewController.swift
//  CTK
//
//  Created by Temirlan Merekeyev on 1/14/19.
//  Copyright © 2019 Temirlan Merekeyev. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var middleNameLabel: UILabel!
    
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView(){
        guard let user = user else {return}
        positionLabel.text = user.name_position
        nameLabel.text = user.fname
        surnameLabel.text = user.lname
        middleNameLabel.text = user.pname
    }
    

}
