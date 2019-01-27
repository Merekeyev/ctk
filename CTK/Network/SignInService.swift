//
//  SignInService.swift
//  CTK
//
//  Created by Temirlan Merekeyev on 1/14/19.
//  Copyright © 2019 Temirlan Merekeyev. All rights reserved.
//

import Foundation
import Moya

enum SignInService{
    case signIn(String, String)
}

extension SignInService: TargetType{
    var baseURL: URL {
        return URLs.baseURL
    }
    
    var path: String {
        switch self {
        case .signIn:
            return "user/login"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signIn:
            return .post
        }
    }
    
    var sampleData: Data {
        switch self {
        case .signIn:
            return Data()
        }
    }
    
    var task: Task {
        switch self{
        case .signIn(let username, let password):
            return .requestCompositeParameters(bodyParameters: ["username" : username, "password" : password], bodyEncoding: URLEncoding.httpBody, urlParameters: [:])
            
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
