//
//  PlayPlistItemCollectionViewCell.swift
//  IOS4MyMuzic
//
//  Created by Tran Viet Anh on 3/7/25.
//

import UIKit

class PlayPlistItemCollectionViewCell: UICollectionViewCell {
    private let imageView: UIImageView = UIImageView()
    static let reuseIdentifier = "PlayPlistItemCollectionViewCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Fix background màu trắng
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        contentView.addSubview(imageView)
        
        // Bo tròn cell
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with url: String) {

        guard let url = URL(string: url) else { return }
        imageView.load(url: url)
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
