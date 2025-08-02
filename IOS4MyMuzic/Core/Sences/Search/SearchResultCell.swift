//
//  SearchResultCell.swift
//  IOS4MyMuzic
//
//  Created by Nguyen Dinh Nhat Quang on 1/8/25.
//

import UIKit

class SearchResultCell: UITableViewCell {
    private let mainStackView = UIStackView()

    private let imgView = UIImageView()

    private let contentStackView = UIStackView()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()

    private let playButton = UIButton(type: .custom)
    private let infoStackView = UIStackView()
    private let rightContentStackView = UIStackView()
    private let rightContentLabel = UILabel()
    private let rightSubContentImgView = UIImageView()
    private let rightSubContentLabel = UILabel()

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

        mainStackView.axis = .horizontal
        mainStackView.alignment = .center
        mainStackView.distribution = .fill
        mainStackView.spacing = 10
        mainStackView.translatesAutoresizingMaskIntoConstraints = false

        imgView.layer.cornerRadius = 14
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false

        contentStackView.axis = .vertical
        contentStackView.distribution = .fillProportionally
        contentStackView.alignment = .leading
        contentStackView.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = .white

        subTitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        subTitleLabel.textColor = .lightGray

        let playButtonSize: CGFloat = 30
        playButton.backgroundColor = .primary
        playButton.layer.cornerRadius = playButtonSize / 2
        playButton.clipsToBounds = true
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.tintColor = .white
        playButton.translatesAutoresizingMaskIntoConstraints = false

        infoStackView.axis = .vertical
        infoStackView.distribution = .fillProportionally
        infoStackView.translatesAutoresizingMaskIntoConstraints = false

        rightContentLabel.textColor = .white
        rightContentLabel.font = .systemFont(ofSize: 14, weight: .light)
        rightContentLabel.translatesAutoresizingMaskIntoConstraints = false

        rightContentStackView.axis = .horizontal
        rightContentStackView.distribution = .fill
        rightContentStackView.spacing = 5
        rightContentStackView.translatesAutoresizingMaskIntoConstraints = false

        rightSubContentImgView.image = UIImage(systemName: "play.fill")
        rightSubContentImgView.contentMode = .scaleAspectFill
        rightSubContentImgView.tintColor = .white
        rightSubContentImgView.translatesAutoresizingMaskIntoConstraints = false

        rightSubContentLabel.font = .systemFont(ofSize: 10, weight: .regular)
        rightSubContentLabel.textColor = .lightGray
        rightSubContentLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    private func addContentViews() {
        contentView.addSubview(mainStackView)

        mainStackView.addArrangedSubview(imgView)
        mainStackView.addArrangedSubview(contentStackView)
        mainStackView.addArrangedSubview(playButton)
        mainStackView.addArrangedSubview(infoStackView)

        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(subTitleLabel)

        infoStackView.addArrangedSubview(rightContentLabel)
        infoStackView.addArrangedSubview(rightContentStackView)

        rightContentStackView.addArrangedSubview(rightSubContentImgView)
        rightContentStackView.addArrangedSubview(rightSubContentLabel)
    }

    private func addLayoutConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 10
            ),
            mainStackView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            ),
            mainStackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            mainStackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),

            imgView.heightAnchor.constraint(equalToConstant: 42),
            imgView.widthAnchor.constraint(equalToConstant: 42),

            playButton.heightAnchor.constraint(equalToConstant: 30),
            playButton.widthAnchor.constraint(equalToConstant: 30),

            rightSubContentImgView.heightAnchor.constraint(equalToConstant: 8),
            rightSubContentImgView.widthAnchor.constraint(equalToConstant: 8),
        ])
    }

    private func configureSong(
        name: String,
        artist: String,
        image: String,
        duration: String,
        totalPlay: String
    ) {
        imgView.image = UIImage(named: image)
        titleLabel.text = name
        subTitleLabel.text = artist
        rightContentLabel.text = duration
        rightSubContentLabel.text = totalPlay
    }

    private func configurePlaylist(
        name: String,
        artist: String,
        image: String,
        numberOfTrack: Int
    ) {
        imgView.image = UIImage(named: image)
        titleLabel.text = name
        subTitleLabel.text = artist
        rightSubContentLabel.text = "\(numberOfTrack) tracks"

        playButton.isHidden = true
        rightContentLabel.isHidden = true
    }

    private func configureArtist(name: String, followers: Int, image: String) {
        imgView.image = UIImage(named: image)
        imgView.layer.cornerRadius = 21

        titleLabel.text = name
        subTitleLabel.isHidden = true

        playButton.isHidden = true

        rightContentLabel.isHidden = true
        rightSubContentImgView.image = UIImage(named: "ic_people")
        rightSubContentImgView.tintColor = .colorGrey
        rightSubContentLabel.text = "\(followers) followers"
    }

    // This function remains the same
    func configure(with result: SearchResultType) {
        switch result {
        case let .song(
            name,
            artist,
            image,
            duration,
            totalPlay
        ):
            configureSong(
                name: name,
                artist: artist,
                image: image,
                duration: duration,
                totalPlay: totalPlay
            )
        case let .playlist(name, artist, image, numberOfTrack):
            configurePlaylist(
                name: name,
                artist: artist,
                image: image,
                numberOfTrack: numberOfTrack
            )
        case let .artist(name, followers, image):
            configureArtist(name: name, followers: followers, image: image)
        }

    }
}
