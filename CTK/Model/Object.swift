//
//  Object.swift
//  CTK
//
//  Created by Temirlan Merekeyev on 1/28/19.
//  Copyright © 2019 Temirlan Merekeyev. All rights reserved.
//

import Foundation
import ObjectMapper

struct Object: Mappable {
    
    var monitoringId: Int?
    var objectId : Int?
    var objectTemp : Double?
    var outsideTemp : Double?
    var flowTemp : Double?
    var returnTemp : Double?
    var pressure : Double?
    var date : String?
    var time : String?
    var status : String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        monitoringId <- map["id_monitoring_obj"]
        objectId <- map["id_object"]
        objectTemp <- map["object_temp"]
        outsideTemp <- map["outside_temp"]
        flowTemp <- map["flow_temp"]
        returnTemp <- map["return_temp"]
        pressure <- map["pressure"]
        date <- map["date"]
        time <- map["time"]
        status <- map["status"]
    }
}
