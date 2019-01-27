//
//  DistrictTableViewCell.swift
//  CTK
//
//  Created by Temirlan Merekeyev on 1/28/19.
//  Copyright © 2019 Temirlan Merekeyev. All rights reserved.
//

import UIKit

class DistrictTableViewCell: UITableViewCell {

    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var engineerLabel: UILabel!
    @IBOutlet weak var container: UIView!
    
    var district : District?{
        didSet{
            setup()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        container.layer.cornerRadius = 8
        container.layer.masksToBounds = true
    }
    
    private func setup(){
        guard let district = district,let name = district.name,let region = district.regionId, let director = district.director, let engineer = district.engineer else {return}
        districtLabel.text = name + "," + region
        directorLabel.text = "Директор: " + director
        engineerLabel.text = "Главный инженер: " + engineer
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
