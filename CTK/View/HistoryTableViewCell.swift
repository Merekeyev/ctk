//
//  HistoryTableViewCell.swift
//  CTK
//
//  Created by Temirlan Merekeyev on 2/4/19.
//  Copyright © 2019 Temirlan Merekeyev. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var objectTempLabel: UILabel!
    @IBOutlet weak var outsideTempLabel: UILabel!
    @IBOutlet weak var flowTempLabel: UILabel!
    @IBOutlet weak var returnTempLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    var object : Object? {
        didSet{
            setup()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func setup() {
         guard let object = object,
            let objTemp = object.objectTemp,
            let outsideTemp = object.outsideTemp,
            let flowTemp = object.flowTemp,
            let returnTemp = object.returnTemp,
            let pressure = object.pressure,
            let date = object.date,
            let time = object.time
            else {return}
        self.statusLabel.text = object.status
        self.outsideTempLabel.text = String(describing: outsideTemp)
        self.objectTempLabel.text = String(describing: objTemp)
        self.flowTempLabel.text = String(describing: flowTemp)
        self.returnTempLabel.text = String(describing: returnTemp)
        self.pressureLabel.text = String(describing: pressure)
        self.dateLabel.text = "\(date) \(time)"
        
    }
    
}
