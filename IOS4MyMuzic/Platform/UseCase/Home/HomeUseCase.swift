//
//  HomeUseCase.swift
//  IOS4MyMuzic
//
//  Created by Tran Viet Anh on 4/8/25.
//

import Foundation
import Combine

class HomeUseCase {
    func fetchTrendingSections() -> AnyPublisher<[CollectionSectionModel], Error> {
        let client = APICollection()
        
        return Future<[CollectionSectionModel], Error> { promise in
            client.execute { result in
                switch result {
                case .success(let value):
                    promise(.success(value.collection))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
