//
//  MusicSectionTableViewCell.swift
//  IOS4MyMuzic
//
//  Created by Tran Viet Anh on 3/7/25.
//

import UIKit

class MusicSectionTableViewCell: UITableViewCell {
    static let identifier = "MusicSectionTableViewCell"
    let sectionView = MusicSectionView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Fix background màu trắng
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(sectionView)
        sectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            sectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            sectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            sectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, data: [PlaylistItem]) {
        sectionView.configure(with: title, dataSource: data)
    }
}
