//
//  APIEnviroment.swift
//  IOS4MyMuzic
//
//  Created by Tran Viet Anh on 11/7/25.
//

import Foundation
protocol APIEnvironment {
    var baseURL: String { get }
    var timeout: TimeInterval { get }
    var headers: [String: String] { get }
    var apiKey: String { get }
}
