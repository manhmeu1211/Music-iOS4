//
//  ProfileViewController.swift
//  IOS4MyMuzic
//
//  Created by Anhtran on 6/7/25.
//

import UIKit

class ProfileViewController: UIViewController {

    private let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bg_image")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20 
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let choseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "photoSelection_btn")
        imageView.contentMode = .scaleAspectFill
       // imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 20
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor") ?? .black
        setupUI()
    }

    private func setupUI() {
        view.addSubview(bannerImageView)
        view.addSubview(avatarImageView)
        view.addSubview(choseImageView)
        view.addSubview(stackView)

        setupConstraints()
        setupFunctionButtons()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: view.topAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bannerImageView.heightAnchor.constraint(equalToConstant: 200),

            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor, constant: -50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 130),
            avatarImageView.heightAnchor.constraint(equalToConstant: 130),

            choseImageView.trailingAnchor.constraint(equalTo: avatarImageView.trailingAnchor),
            choseImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            choseImageView.widthAnchor.constraint(equalToConstant: 30),
            choseImageView.heightAnchor.constraint(equalToConstant: 20),

            stackView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func setupFunctionButtons() {
        let functions = [
            ("Restore Purchases", "arrow.counterclockwise"),
            ("Rate app", "star"),
            ("Feedback", "envelope"),
            ("Share app", "square.and.arrow.up.on.square")
        ]

        for (title, systemIcon) in functions {
            let button = createFunctionButton(title: title, iconName: systemIcon)
            stackView.addArrangedSubview(button)
        }
    }

    private func createFunctionButton(title: String, iconName: String) -> UIView {
        let imageView = UIImageView(image: UIImage(systemName: iconName))
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true

        let label = UILabel()
        label.text = title
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)

        let hStack = UIStackView(arrangedSubviews: [imageView, label])
        hStack.axis = .horizontal
        hStack.spacing = 12
        hStack.alignment = .center

        return hStack
    }
}
