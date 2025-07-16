//
//  APIOperation.swift
//  IOS4MyMuzic
//
//  Created by Tran Viet Anh on 12/7/25.
//


protocol APIOperation {
    associatedtype Model : Codable
    func execute(completion : @escaping (Result<Model, Error>) -> Void)
}
