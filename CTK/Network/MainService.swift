//
//  MainService.swift
//  CTK
//
//  Created by Temirlan Merekeyev on 1/28/19.
//  Copyright © 2019 Temirlan Merekeyev. All rights reserved.
//

import Foundation
import Moya


enum MainService{
    case districts
    case districtObjects(Int)
    case history(Int)
}

extension MainService: TargetType{
    var baseURL: URL {
        return URLs.baseURL
    }
    
    var path: String {
        switch self {
        case .districts:
            return "objects/districts"
        case .districtObjects:
            return "objects/districtobjects"
        case .history:
            return "objects/history"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .districts:
            return .get
        case .districtObjects, .history:
            return .post
            
        }
    }
    
    var sampleData: Data {
        switch self {
        case .districts, .districtObjects, .history:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .districts:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        case .districtObjects(let id):
            return .requestCompositeParameters(bodyParameters: ["id_district" : id], bodyEncoding: URLEncoding.httpBody, urlParameters: [:])
        case .history(let id):
            return .requestCompositeParameters(bodyParameters: ["id_object" : id], bodyEncoding: URLEncoding.httpBody, urlParameters: [:])
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
