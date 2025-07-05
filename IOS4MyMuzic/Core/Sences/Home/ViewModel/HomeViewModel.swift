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
    func loadData() {
        delegate?.didStartLoading()
        let trendingSectionData = SoundCloudMockDataProvider.shared.getTrendingSection()
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1){
            self.trendingSections = [trendingSectionData,trendingSectionData,trendingSectionData]
            self.fetchAPI()
            DispatchQueue.main.async {
                self.delegate?.didLoadData()
            }
        }
        
    }
    func fetchAPI(){
        
    }
    
}
