//
//  MusicSectionView.swift
//  IOS4MyMuzic
//
//  Created by Tran Viet Anh on 1/7/25.
//

import UIKit

class MusicSectionView: UIView {
    let titleLabel: UILabel = UILabel()
    var dataSource: [Playlist] = []
    var collectionView: UICollectionView!
    var isFirstSession: Bool = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear

        collectionView.register(PlayListItemCollectionViewCell.self, forCellWithReuseIdentifier: PlayListItemCollectionViewCell.reuseIdentifier)
        collectionView.register(PlayListButtonGardientViewCell.self, forCellWithReuseIdentifier: PlayListButtonGardientViewCell.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.font = .systemFont(ofSize: 17, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with title: String, dataSource: [Playlist], isFirstSession: Bool) {
        titleLabel.text = title
        self.dataSource = dataSource
        self.isFirstSession = isFirstSession
        collectionView.reloadData()
    }
}
extension MusicSectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isFirstSession {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PlayListButtonGardientViewCell.reuseIdentifier,
                for: indexPath
            ) as! PlayListButtonGardientViewCell
            let item = dataSource[indexPath.row]
            cell.configure(with: item.title)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PlayListItemCollectionViewCell.reuseIdentifier,
                for: indexPath
            ) as! PlayListItemCollectionViewCell
            let item = dataSource[indexPath.row]
            cell.configure(with: item.artworkURL ?? "https://fxstudio.dev/wp-content/uploads/2019/12/Screen-Shot-2019-12-04-at-4.37.41-PM.png")
            return cell
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isFirstSession {
            let title = dataSource[indexPath.row].title
            let font = UIFont.systemFont(ofSize: 18, weight: .bold)
            let textSize = (title as NSString).size(withAttributes: [.font: font])
            
            let width = ceil(textSize.width + 32)
            let height = ceil(textSize.height + 16) 

            return CGSize(width: width, height: height)
        }
 else {
            return CGSize(width: 149, height: 169)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
