//
//  BaseAPIEnviroment.swift
//  IOS4MyMuzic
//
//  Created by Tran Viet Anh on 12/7/25.
//

import Foundation
class BaseAPIEnviroment: APIEnvironment {
    var baseURL: String {
        return "https://api-v2.soundcloud.com"
    }
    
    var timeout: TimeInterval {
        return 10
    }
    
    var headers: [String : String] {
        return [:]
    }
    
    var apiKey: String {
        return ""
    }
    
}
