//
//  HomeViewModel.swift
//  IOS4MyMuzic
//
//  Created by Tran Viet Anh on 3/7/25.
//

import Foundation

protocol HomeViewModelDelegateProtocol: AnyObject {
    func didLoadData()
    func didStartLoading()
}
class HomeViewModel {

    
    var trendingSections: [TrendingSection]?
    weak var delegate: HomeViewModelDelegateProtocol?
  
    func loadMockData() {
        self.delegate?.didStartLoading()
        self.trendingSections = MockTrendingSession.mock().trendings
        self.delegate?.didLoadData()
    }
    
}
