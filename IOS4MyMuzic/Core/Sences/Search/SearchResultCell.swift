//
//  SearchResultCell.swift
//  IOS4MyMuzic
//
//  Created by Nguyen Dinh Nhat Quang on 10/7/25.
//

import UIKit

class SearchResultCell: UITableViewCell {
    private let imgView = UIImageView()
    private let middleStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

    private func setUp() {
        configUI()
        addContentViews()
        addLayoutConstraints()
    }
    
    private func configUI() {
        backgroundColor = .clear
        
        imgView.layer.cornerRadius = 4
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addContentViews() {
        addSubview(imgView)
        addSubview(middleStackView)
    }
    
    private func addLayoutConstraints() {
        
    }
    
    func configure(with type: SearchResultType) {
        
    }
}


// MARK: - Search Result Types
enum SearchResultType {
  case song(title: String, subtitle: String, image: String, duration: String, plays: String)
  case playlist(title: String, subtitle: String, image: String, tracks: Int)
  case artist(title: String, subtitle: String, image: String)
}

#if DEBUG
#Preview(traits: .sizeThatFitsLayout) {
    let cell = SearchResultCell()
//    cell.configure(with: .song(title: "Test", subtitle: "Test", image: "img_thumbnal_song", duration: "Test", plays: "Test"))
    cell.configure(with: .playlist(title: "123", subtitle: "123", image: "img_thumbnal_song", tracks: 15))
    
    return cell
}
#endif
