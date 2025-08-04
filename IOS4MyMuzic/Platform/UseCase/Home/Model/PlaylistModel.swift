//
//  Playlist.swift
//  IOS4MyMuzic
//
//  Created by Tran Viet Anh on 12/7/25.
//

struct PlaylistModel: Codable {
    let id: Int
    let title: String
    let artworkURL: String?
    let trackCount: Int
    let likesCount: Int
    let duration: Int
    
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case artworkURL = "artwork_url"
        case trackCount = "track_count"
        case likesCount = "likes_count"
        case duration
    }
}
