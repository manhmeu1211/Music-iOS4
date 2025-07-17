//
//  SearchBar.swift
//  IOS4MyMuzic
//
//  Created by Nguyen Dinh Nhat Quang on 10/7/25.
//

import UIKit

protocol SearchBarDelegate: AnyObject {
    func searchBar(_ searchBar: SearchBar, textDidChange text: String)
    func searchBarCancelButtonClicked(_ searchBar: SearchBar)
}

class SearchBar: UIView {
    weak var delegate: SearchBarDelegate?

    private let contentView = UIView()
    private let textField = UITextField()
    private let icImageView = UIImageView()
    private let cancelTextButton = UIButton(type: .system)

    private var cancelTextButtonWidthConstraint: NSLayoutConstraint!

    override init(frame: CGRect) {
        super.init(frame: frame)
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
        contentView.backgroundColor = UIColor.primary.withAlphaComponent(0.2)
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.primary.cgColor
        contentView.translatesAutoresizingMaskIntoConstraints = false

        icImageView.image = UIImage(named: "ic_search")
        icImageView.tintColor = .white
        icImageView.translatesAutoresizingMaskIntoConstraints = false

        textField.textColor = .white
        textField.font = UIFont.systemFont(
            ofSize: 18,
            weight: UIFont.Weight.bold
        )
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(
            self,
            action: #selector(textFieldDidChange(_:)),
            for: .editingChanged
        )

        cancelTextButton.setTitle("Cancel", for: .normal)
        cancelTextButton.setTitleColor(UIColor.primary, for: .normal)
        cancelTextButton.titleLabel?.font = UIFont.systemFont(
            ofSize: 18,
            weight: UIFont.Weight.bold
        )
        cancelTextButton.translatesAutoresizingMaskIntoConstraints = false
        cancelTextButton.alpha = 0
        cancelTextButton.addTarget(
            self,
            action: #selector(cancelButtonTapped),
            for: .touchUpInside
        )
    }

    private func addContentViews() {
        self.addSubview(contentView)
        self.addSubview(cancelTextButton)

        contentView.addSubview(icImageView)
        contentView.addSubview(textField)
    }

    private func addLayoutConstraints() {
        cancelTextButtonWidthConstraint = cancelTextButton.widthAnchor
            .constraint(equalToConstant: 0)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(
                equalTo: cancelTextButton.leadingAnchor,
                constant: -8
            ),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            icImageView.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor
            ),
            icImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 6
            ),
            icImageView.widthAnchor.constraint(equalToConstant: 28),
            icImageView.heightAnchor.constraint(equalToConstant: 28),

            textField.leadingAnchor.constraint(
                equalTo: icImageView.trailingAnchor,
                constant: 12
            ),
            textField.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -6
            ),
            textField.topAnchor.constraint(equalTo: contentView.topAnchor),
            textField.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            ),

            cancelTextButton.trailingAnchor.constraint(
                equalTo: self.trailingAnchor
            ),
            cancelTextButton.centerYAnchor.constraint(
                equalTo: self.centerYAnchor
            ),
            cancelTextButtonWidthConstraint,
        ])
    }

    @objc private func textFieldDidChange(_ textField: UITextField) {
        delegate?.searchBar(self, textDidChange: textField.text ?? "")
        updateCancelButtonVisibility(animated: true)
    }

    @objc private func cancelButtonTapped() {
        textField.text = ""
        delegate?.searchBar(self, textDidChange: "")
        textField.resignFirstResponder()
        delegate?.searchBarCancelButtonClicked(self)
        updateCancelButtonVisibility(animated: true)
    }

    private func updateCancelButtonVisibility(animated: Bool) {
        let shouldShow = textField.isEditing && !(textField.text ?? "").isEmpty

        let isCurrentVisible = cancelTextButton.alpha == 1

        guard shouldShow != isCurrentVisible else { return }

        let animation = {
            self.cancelTextButtonWidthConstraint.constant =
                shouldShow
                ? self.cancelTextButton.intrinsicContentSize.width : 0
            self.cancelTextButton.alpha = shouldShow ? 1 : 0
            self.layoutIfNeeded()
        }

        if animated {
            UIView.animate(withDuration: 0.25, animations: animation)
        } else {
            animation()
        }
    }
}
