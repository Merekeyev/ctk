//
//  User.swift
//  CTK
//
//  Created by Temirlan Merekeyev on 1/14/19.
//  Copyright © 2019 Temirlan Merekeyev. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
    
    var fname : String?
    var id_emp : Int?
    var lname : String?
    var name_position : String?
    var name_role : String?
    var pname : String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        fname <- map["fname"]
        id_emp <- map["id_emp"]
        lname <- map["lname"]
        name_position <- map["name_position"]
        name_role <- map["name_role"]
        pname <- map["pname"]
    }
    
    
}
