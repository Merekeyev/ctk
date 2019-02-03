//
//  ObjectTableViewCell.swift
//  CTK
//
//  Created by Temirlan Merekeyev on 2/4/19.
//  Copyright © 2019 Temirlan Merekeyev. All rights reserved.
//

import UIKit

class ObjectTableViewCell: UITableViewCell {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var objectNameLabel: UILabel!
    @IBOutlet weak var t1Label: UILabel!
    @IBOutlet weak var t2Label: UILabel!
    @IBOutlet weak var tinningLabel: UILabel!
    @IBOutlet weak var thandlingLabel: UILabel!
    @IBOutlet weak var tPLabel: UILabel!
    @IBOutlet weak var engineerLabel: UILabel!
    
    var historyClicked : (()->())?
    var districtObject : DistrictObject? {
        didSet{
            setup()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        historyClicked = nil
    }
    
    private func setup() {
        guard let object = districtObject, let objTemp = object.objectTemp, let outsideTemp = object.outsideTemp, let flowTemp = object.flowTemp, let returnTemp = object.returnTemp, let pressure = object.pressure, let engineerName = object.employeeId else {return}
        self.statusLabel.text = object.status
        self.objectNameLabel.text = object.name
        self.t1Label.text = String(describing: objTemp)
        self.t2Label.text = String(describing: outsideTemp)
        self.tinningLabel.text = String(describing: flowTemp)
        self.thandlingLabel.text = String(describing: returnTemp)
        self.tPLabel.text = String(describing: pressure)
        self.engineerLabel.text = "Инженер объекта: \(engineerName)"
    }


    @IBAction func historyButtonClicked(_ sender: UIButton) {
        historyClicked?()
    }
    
}
