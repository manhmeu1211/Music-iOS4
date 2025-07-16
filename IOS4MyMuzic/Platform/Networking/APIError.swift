//
//  APIError.swift
//  IOS4MyMuzic
//
//  Created by Tran Viet Anh on 11/7/25.
//

import Foundation
enum APIError: Error {
    case invalidResponse
    case httpStatus(code: Int)
    case emptyData
}
