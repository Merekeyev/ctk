//
//  DistrictObject.swift
//  CTK
//
//  Created by Temirlan Merekeyev on 1/28/19.
//  Copyright © 2019 Temirlan Merekeyev. All rights reserved.
//

import Foundation
import ObjectMapper

struct DistrictObject: Mappable {
    
    var id : Int?
    var name : String?
    var localId : String?
    var employeeId : String?
    var objectTemp : Double?
    var outsideTemp : Double?
    var flowTemp : Double?
    var returnTemp : Double?
    var pressure : Double?
    var status : String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id_object"]
        name <- map["name_object"]
        localId <- map["id_locality"]
        employeeId <- map["id_employee"]
        objectTemp <- map["object_temp"]
        outsideTemp <- map["outside_temp"]
        flowTemp <- map["flow_temp"]
        returnTemp <- map["return_temp"]
        pressure <- map["pressure"]
        status <- map["online"]
    }
    
    

}
