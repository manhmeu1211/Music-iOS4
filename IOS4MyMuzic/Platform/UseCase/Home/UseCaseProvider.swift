//
//  UseCaseProvider.swift
//  IOS4MyMuzic
//
//  Created by Tran Viet Anh on 4/8/25.
//


import Foundation

class UseCaseProvider {
    static func makeHomeUseCase() -> HomeUseCase {
        return HomeUseCase()
    }
}
