//
//  DistrictObjectTableViewCell.swift
//  CTK
//
//  Created by Temirlan Merekeyev on 2/3/19.
//  Copyright © 2019 Temirlan Merekeyev. All rights reserved.
//

import UIKit

class DistrictObjectTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var engineerLabel: UILabel!
    var districtObject : DistrictObject?{
        didSet{
            setup()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        guard let object = districtObject, let engineerName = object.employeeId else {return}
        nameLabel.text = object.name
        engineerLabel.text = "Инженер объекта: \(engineerName)"
    }
    
}
