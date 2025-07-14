//
//  MockTrendingSession.swift
//  IOS4MyMuzic
//
//  Created by Tran Viet Anh on 14/7/25.
//

import Foundation
class MockTrendingSession {
    var trendings: [TrendingSection] = [
        TrendingSection(
            id: "1",
            title: "Chill",
            description: nil,
            items: [
                Playlist(id: 1, title: "Drake", artworkURL: "https://upload.wikimedia.org/wikipedia/vi/5/5f/Blackpink-_The_Album.png", trackCount: 20, likesCount: 1000, duration: 5400),
                Playlist(id: 2, title: "Juice WRLD", artworkURL: "https://m.media-amazon.com/images/I/31d9+qY3EtL._UF1000,1000_QL80_.jpg", trackCount: 18, likesCount: 900, duration: 4800),
                Playlist(id: 3, title: "Abstract", artworkURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Blackpink_-_EP.jpg/250px-Blackpink_-_EP.jpg", trackCount: 12, likesCount: 850, duration: 4200)
            ]
        ),
        TrendingSection(
            id: "2",
            title: "Party",
            description: nil,
            items: [
                Playlist(id: 4, title: "Aura", artworkURL: "https://cdn-images.dzcdn.net/images/cover/b1d3e09da20c39a3132269f5a52a4a1d/0x1900-000000-80-0-0.jpg", trackCount: 22, likesCount: 2000, duration: 6000),
                Playlist(id: 5, title: "Oasis", artworkURL: "https://cdn-images.vtv.vn/2022/9/6/1662391136-fb5moupagaermn0-1662431352693123050919.jpg", trackCount: 17, likesCount: 1700, duration: 5300),
                Playlist(id: 6, title: "Don Omar", artworkURL: "https://cdn-images.vtv.vn/2022/9/6/1662391136-fb5mvnpacaebrih-16624313526951868190616.jpg", trackCount: 25, likesCount: 2500, duration: 6800)
            ]
        ),
        TrendingSection(
            id: "3",
            title: "Pop",
            description: nil,
            items: [
                Playlist(id: 7, title: "Pop Rising", artworkURL: "https://cdn-images.vtv.vn/2022/9/6/1662391136-fb5mthhaaaaytoi-16624313526941585327961.jpg", trackCount: 20, likesCount: 1500, duration: 5600),
                Playlist(id: 8, title: "Top 40", artworkURL: "https://kavesquare.com/cdn/shop/products/blackpink-2nd-album-born-pink-box-set-ver-official-poster-black-493206.jpg?v=1684559685", trackCount: 30, likesCount: 3000, duration: 8200),
                Playlist(id: 9, title: "New Music", artworkURL: "https://kavesquare.com/cdn/shop/products/blackpink-2nd-album-born-pink-box-set-ver-official-poster-black-493206.jpg?v=1684559685", trackCount: 10, likesCount: 1100, duration: 3000)
            ]
        )
    ]
    
    static func mock() -> MockTrendingSession {
        return MockTrendingSession()
    }
}
