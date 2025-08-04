//
//  APIClient.swift
//  IOS4MyMuzic
//
//  Created by Tran Viet Anh on 11/7/25.
//

import Foundation
typealias APIClient = APIOperation & APIRequest

extension APIOperation where Self : APIRequest {
    func execute(completion: @escaping (Result<Model, Error>) -> Void) {
        self.printRequest()
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 15
        configuration.timeoutIntervalForResource = 30
        
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: self.request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    completion(.failure(APIError.invalidResponse))
                }
                return
            }
            guard (200...299).contains(httpResponse.statusCode) else {
                DispatchQueue.main.async {
                    completion(.failure(APIError.httpStatus(code: httpResponse.statusCode)))
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(APIError.emptyData))
                }
                return
            }
            do {
                let model = try JSONDecoder().decode(Model.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(model))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            
        }
        task.resume()
    }
}
