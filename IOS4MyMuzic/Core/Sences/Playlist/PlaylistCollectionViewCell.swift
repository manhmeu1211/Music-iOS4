//
//  PlaylistCollectionViewCell.swift
//  IOS4MyMuzic
//
//  Created by Thạnh Dương Hoàng on 24/7/25.
//

import UIKit

class PlaylistCell: UICollectionViewCell {
    static let reuseIdentifier = "PlaylistCell"

    private lazy var coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var playlistNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var songCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var moreActionButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(resource: .icMoreAction)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(coverImageView)
        contentView.addSubview(playlistNameLabel)
        contentView.addSubview(songCountLabel)
        contentView.addSubview(moreActionButton)

        NSLayoutConstraint.activate([
            coverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            coverImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            coverImageView.widthAnchor.constraint(equalToConstant: 80),
            coverImageView.heightAnchor.constraint(equalToConstant: 80),

            playlistNameLabel.leadingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: 16),
            playlistNameLabel.topAnchor.constraint(equalTo: coverImageView.topAnchor, constant: 10),
            playlistNameLabel.trailingAnchor.constraint(equalTo: moreActionButton.leadingAnchor, constant: -16),

            songCountLabel.leadingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: 16),
            songCountLabel.topAnchor.constraint(equalTo: playlistNameLabel.bottomAnchor, constant: 4),
            songCountLabel.trailingAnchor.constraint(equalTo: moreActionButton.leadingAnchor, constant: -16),
            
            moreActionButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            moreActionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            moreActionButton.widthAnchor.constraint(equalToConstant: 14),
            moreActionButton.heightAnchor.constraint(equalToConstant: 14),
            
        ])
    }

    func configure(with playlistName: String, songCount: Int, coverImage: UIImage?) {
        playlistNameLabel.text = playlistName
        songCountLabel.text = "\(songCount) songs"
        coverImageView.image = coverImage ?? UIImage(systemName: "music.note.list")
        if coverImage == nil {
            coverImageView.backgroundColor = .darkGray
            coverImageView.tintColor = .white
            coverImageView.contentMode = .center
        } else {
            coverImageView.backgroundColor = .clear
            coverImageView.contentMode = .scaleAspectFill
        }
    }
}
