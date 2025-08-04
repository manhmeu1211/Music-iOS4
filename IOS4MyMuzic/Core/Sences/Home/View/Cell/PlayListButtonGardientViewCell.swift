//
//  PlayListButtonGardientViewCell.swift
//  IOS4MyMuzic
//
//  Created by Tran Viet Anh on 12/7/25.
//

import Foundation
import UIKit
class PlayListButtonGardientViewCell: UICollectionViewCell {
    private var button : UIButton = GradientButton()
    static let reuseIdentifier = "PlayListButtonGardientViewCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        button.setTitle("Random", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        contentView.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
    
    func configure(with title: String) {

        button.setTitle(title, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
