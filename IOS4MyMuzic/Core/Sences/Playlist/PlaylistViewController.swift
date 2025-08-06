//
//  PlaylistViewController.swift
//  IOS4MyMuzic
//
//  Created by Tran Viet Anh on 6/7/25.
//

import UIKit

class PlaylistViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Playlist"
        label.font = .boldSystemFont(ofSize: 36)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let addPlaylistImageView: UIImageView = {
        let plusImageView = UIImageView()
        plusImageView.image = UIImage(resource: .icBtnPlus)
        plusImageView.translatesAutoresizingMaskIntoConstraints = false
        return plusImageView
    }()

    private let addPlaylistLabel: UILabel = {
        let label = UILabel()
        label.text = "Add a new playlist"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var addPlaylistStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [addPlaylistImageView, addPlaylistLabel])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var addPlaylistButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let playlistCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PlaylistCell.self, forCellWithReuseIdentifier: PlaylistCell.reuseIdentifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private var playlists: [(name: String, songs: Int, image: UIImage?)] = [
        ("Playlist name", 10, UIImage(named: "playlist_cover_1")),
        ("Playlist name", 10, UIImage(named: "playlist_cover_1")),
        ("Playlist name", 10, UIImage(named: "playlist_cover_1")),
        ("Playlist name", 10, UIImage(named: "playlist_cover_1")),
        ("Playlist name", 10, UIImage(named: "playlist_cover_1")),
        ("Playlist name", 10, UIImage(named: "playlist_cover_1")),
        ("Playlist name", 10, UIImage(named: "playlist_cover_1")),
        ("Playlist name", 10, UIImage(named: "playlist_cover_1")),
        ("Playlist name", 10, UIImage(named: "playlist_cover_1")),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
        setupUI()
        setupCollectionView()
    }

    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(addPlaylistStackView)
        view.addSubview(addPlaylistButton)
        view.addSubview(playlistCollectionView)
        configureConstraints()
        configureAddPlaylist()
    }

    private func setupCollectionView() {
        playlistCollectionView.dataSource = self
        playlistCollectionView.delegate = self
        playlistCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    }
    
    private func configureConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),

            addPlaylistStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            addPlaylistStackView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            addPlaylistImageView.widthAnchor.constraint(equalToConstant: 40),
            addPlaylistImageView.heightAnchor.constraint(equalToConstant: 40),

            addPlaylistButton.topAnchor.constraint(equalTo: addPlaylistStackView.topAnchor),
            addPlaylistButton.bottomAnchor.constraint(equalTo: addPlaylistStackView.bottomAnchor),
            addPlaylistButton.leadingAnchor.constraint(equalTo: addPlaylistStackView.leadingAnchor),
            addPlaylistButton.trailingAnchor.constraint(equalTo: addPlaylistStackView.trailingAnchor),
            
            playlistCollectionView.topAnchor.constraint(equalTo: addPlaylistStackView.bottomAnchor, constant: 20),
            playlistCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            playlistCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            playlistCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 0),
        ])
    }
    
    private func configureAddPlaylist() {
        addPlaylistButton.addTarget(self, action: #selector(addPlaylist), for: .touchUpInside)
    }
    
    // MARK: - Action
    @objc private func addPlaylist() {
        print("Click")
    }
}

// MARK: - Datasource
extension PlaylistViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playlists.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaylistCell.reuseIdentifier, for: indexPath) as? PlaylistCell else {
            fatalError("Errors dequeue playlistcell")
        }
        let playlist = playlists[indexPath.item]
        cell.configure(with: playlist.name, songCount: playlist.songs, coverImage: playlist.image)
        return cell
    }
}

// MARK: - Delegate
extension PlaylistViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected playlist: \(playlists[indexPath.item].name)")
    }
}

// MARK: - Flow
extension PlaylistViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 40
        let availableWidth = collectionView.bounds.width - padding
        let itemHeight: CGFloat = 100
        return CGSize(width: availableWidth, height: itemHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}
