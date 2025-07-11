//
//  SaleViewController.swift
//  IOS4MyMuzic
//
//  Created by Anhtran on 6/7/25.
//

import UIKit

class SaleViewController: UIViewController, UIScrollViewDelegate {

    private let imageNames = ["Slide 1", "Slide 2", "Slide 3", "Slide 4"]
    private var timer: Timer?

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Rectangle")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let musicImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "playicon")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let musicVipImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "musicvip_image")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "text")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let pageDotsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 1
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let featuresLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false

        let text = "• Access over VIP Music\n• Advanced tools\n• Next, repeat..\n• No ADS"

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 25

        let attributedString = NSAttributedString(
            string: text,
            attributes: [
                .paragraphStyle: paragraphStyle,
                .foregroundColor: UIColor.white,
                .font: UIFont.systemFont(ofSize: 20)
            ]
        )

        label.attributedText = attributedString
        return label
    }()
    
    private let features1Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        let text = "Terms of Use | Privacy Policy | Restore Purchases"

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 25

        let attributedString = NSAttributedString(
            string: text,
            attributes: [
                .paragraphStyle: paragraphStyle,
                .foregroundColor: UIColor(red: 140/255, green: 150/255, blue: 162/255, alpha: 1.0),
                .font: UIFont.systemFont(ofSize: 10)
            ]
        )
        label.attributedText = attributedString
        return label
    }()


    private let yearButton = SaleViewController.makeSaleButton(title: "799.000 đ/ year")
    private let monthButton = SaleViewController.makeSaleButton(title: "329.000 đ/ month")
    private let weekButton = SaleViewController.makeSaleButton(title: "99.000 đ/ week")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        setupUI()
        setupCarouselImages()
        setupPageDots()
        startAutoScroll()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
    }
    private func setupCarouselImages() {
        let bannerWidth = view.frame.width - 40
        let bannerHeight: CGFloat = 180

        for (index, imageName) in imageNames.enumerated() {
            let imageView = UIImageView()
            imageView.image = UIImage(named: imageName)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 20
            imageView.frame = CGRect(x: CGFloat(index) * bannerWidth, y: 0, width: bannerWidth, height: bannerHeight)
            scrollView.addSubview(imageView)
        }
        scrollView.contentSize = CGSize(width: bannerWidth * CGFloat(imageNames.count), height: bannerHeight)
    }

    private func setupPageDots() {
        for _ in 0..<imageNames.count {
            let dot = UIImageView()
            dot.image = UIImage(named: "Frame1")
            dot.contentMode = .scaleAspectFit
            dot.transform = CGAffineTransform(scaleX: 0.45, y: 0.45)
            dot.layer.cornerRadius = 10
            dot.clipsToBounds = true
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.widthAnchor.constraint(equalToConstant: 13).isActive = true
            dot.heightAnchor.constraint(equalToConstant: 13).isActive = true
            pageDotsStackView.addArrangedSubview(dot)
        }
        updatePageDots(currentPage: 0)
    }

    private func updatePageDots(currentPage: Int) {
        for (index, view) in pageDotsStackView.arrangedSubviews.enumerated() {
            if let dot = view as? UIImageView {
                if index == currentPage {
                    dot.layer.borderWidth = 2
                    dot.layer.borderColor = UIColor.white.cgColor
                } else {
                    dot.layer.borderWidth = 0
                    dot.layer.borderColor = nil
                }
            }
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = Int(round(scrollView.contentOffset.x / (view.frame.width - 40)))
        updatePageDots(currentPage: page)
    }

    private func startAutoScroll() {
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] _ in
            self?.moveToNextPage()
        }
    }

    private func moveToNextPage() {
        let bannerWidth = view.frame.width - 40
        let currentPage = Int(round(scrollView.contentOffset.x / bannerWidth))
        let nextPage = (currentPage + 1) % imageNames.count
        let offsetX = CGFloat(nextPage) * bannerWidth

        scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        updatePageDots(currentPage: nextPage)
    }

    @objc private func closeTapped() {
        dismiss(animated: true, completion: nil)
    }

    static func makeSaleButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 22
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    private func setupUI() {
        view.addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        [closeButton,musicImageView,musicVipImageView, scrollView, pageDotsStackView, featuresLabel, yearButton, monthButton, weekButton, features1Label].forEach {
            view.addSubview($0)
        }

        closeButton.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([
            musicImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            musicImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            musicImageView.widthAnchor.constraint(equalToConstant: 120),
            musicImageView.heightAnchor.constraint(equalToConstant: 120),
            
            musicVipImageView.centerYAnchor.constraint(equalTo: musicImageView.centerYAnchor),
            musicVipImageView.leadingAnchor.constraint(equalTo: musicImageView.trailingAnchor, constant: 10),
            musicVipImageView.widthAnchor.constraint(equalToConstant: 40),
            musicVipImageView.heightAnchor.constraint(equalToConstant: 40),

            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scrollView.heightAnchor.constraint(equalToConstant: 180),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),

            scrollView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scrollView.heightAnchor.constraint(equalToConstant: 180),

            pageDotsStackView.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 12),
            pageDotsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            featuresLabel.topAnchor.constraint(equalTo: pageDotsStackView.bottomAnchor, constant: 60),
            featuresLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            featuresLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

            yearButton.topAnchor.constraint(equalTo: featuresLabel.bottomAnchor, constant: 30),
            yearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yearButton.widthAnchor.constraint(equalToConstant: 400),
            yearButton.heightAnchor.constraint(equalToConstant: 54),

            monthButton.topAnchor.constraint(equalTo: yearButton.bottomAnchor, constant: 30),
            monthButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            monthButton.widthAnchor.constraint(equalToConstant: 400),
            monthButton.heightAnchor.constraint(equalToConstant: 54),

            weekButton.topAnchor.constraint(equalTo: monthButton.bottomAnchor, constant: 30),
            weekButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weekButton.widthAnchor.constraint(equalToConstant: 400),
            weekButton.heightAnchor.constraint(equalToConstant: 54),
            
            features1Label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            features1Label.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        ])
    }

    
}
