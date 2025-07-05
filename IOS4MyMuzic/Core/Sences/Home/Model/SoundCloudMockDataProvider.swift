//
//  SoundCloudMockDataProvider.swift
//  IOS4MyMuzic
//
//  Created by Tran Viet Anh on 3/7/25.
//
import Foundation

class SoundCloudMockDataProvider {
    static let shared = SoundCloudMockDataProvider()
    
    private init() {}
    
    func getTrendingSection() -> TrendingSection {
        return TrendingSection(
            id: "trending-by-genre",
            title: "Trending by genre",
            description: nil,
            items: getMockPlaylists()
        )
    }
    
    private func getMockPlaylists() -> [PlaylistItem] {
        return [
            PlaylistItem(
                id: 1734880737,
                title: "Country",
                artworkURL: "https://i1.sndcdn.com/artworks-qTu8jmRsyy8666na-zjvRIA-large.jpg",
                trackCount: 50,
                likesCount: 17661,
                duration: 10122135,
            ),
            PlaylistItem(
                id: 1734880714,
                title: "Electronic",
                artworkURL: "https://i1.sndcdn.com/artworks-mczLfuyLgsJEAoz4-zzzTdg-large.jpg",
                trackCount: 50,
                likesCount: 4716,
                duration: 9888888,
            ),
            PlaylistItem(
                id: 1734880715,
                title: "Hip Hop",
                artworkURL: "https://i1.sndcdn.com/artworks-qTu8jmRsyy8666na-zjvRIA-large.jpg",
                trackCount: 45,
                likesCount: 8932,
                duration: 9234567,
            ),
            PlaylistItem(
                id: 1734880716,
                title: "Pop",
                artworkURL: "https://i1.sndcdn.com/artworks-qTu8jmRsyy8666na-zjvRIA-large.jpg",
                trackCount: 40,
                likesCount: 12455,
                duration: 8765432,
            ),
            PlaylistItem(
                id: 1734880717,
                title: "Rock",
                artworkURL: "https://i1.sndcdn.com/artworks-qTu8jmRsyy8666na-zjvRIA-large.jpg",
                trackCount: 35,
                likesCount: 6789,
                duration: 7654321,
            )
        ]
    }
}

extension PlaylistItem {
    var formattedDuration: String {
        let minutes = duration / 60000
        return "\(minutes) min"
    }
    
    var formattedLikes: String {
        if likesCount >= 1000 {
            return "\(likesCount / 1000)K"
        }
        return "\(likesCount)"
    }
}
