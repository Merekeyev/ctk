//
//  District.swift
//  CTK
//
//  Created by Temirlan Merekeyev on 1/28/19.
//  Copyright © 2019 Temirlan Merekeyev. All rights reserved.
//

import Foundation
import ObjectMapper

struct District: Mappable {
    
    var id : Int?
    var name : String?
    var regionId : String?
    var director : String?
    var engineer : String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id_district"]
        name <- map["name_district"]
        regionId <- map["id_region"]
        director <- map["director_district"]
        engineer <- map["engineer_district"]
    }
    
    
    
    
}
