//
//  RecentSearchCell.swift
//  IOS4MyMuzic
//
//  Created by Nguyen Dinh Nhat Quang on 10/7/25.
//

import UIKit

class RecentSearchCell: UITableViewCell {
    private let label = UILabel()
    private let iconView = UIImageView()
    private let container = UIView()

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
        selectionStyle = .none

        container.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false

        iconView.image = UIImage(named: "ic_external_link")
        iconView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func addContentViews() {
        contentView.addSubview(container)
        container.addSubview(label)
        container.addSubview(iconView)
    }

    private func addLayoutConstraints() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor),
            container.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            ),
            container.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            container.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),
            
            label.leadingAnchor.constraint(
                equalTo: container.leadingAnchor
            ),
            label.centerYAnchor.constraint(
                equalTo: container.centerYAnchor
            ),
            
            iconView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            iconView.trailingAnchor.constraint(
                equalTo: container.trailingAnchor
            ),
            iconView.widthAnchor.constraint(equalToConstant: 18),
            iconView.heightAnchor.constraint(equalToConstant: 18),
        ])
    }

    func configure(with text: String) {
        label.text = text
    }
}

#if DEBUG
    #Preview(traits: .sizeThatFitsLayout) {
        let cell = RecentSearchCell()
        cell.configure(with: "123")
        return cell
    }
#endif
