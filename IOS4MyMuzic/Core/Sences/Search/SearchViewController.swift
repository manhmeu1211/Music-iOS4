//
//  SearchViewController.swift
//  IOS4MyMuzic
//
//  Edited by Quang on 10/7/25.
//

import UIKit

class SearchViewController: UIViewController {
    private let mainStackView = UIStackView()
    private let titleLabel = UILabel()
    private let searchBarView = SearchBar()
    private let recentTableView = UITableView()

    private var recentSearches = [
        "Ariana Grande",
        "Morgan Wallen",
        "Justin Bieber",
        "Drake",
        "Happy new year best music for eve night...",
        "Morgan Wallen",
    ]

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

    override func viewDidLoad() {
        if let tabBarHeight = self.tabBarController?.tabBar.frame.height {
            recentTableView.contentInset = UIEdgeInsets(
                top: 0,
                left: 0,
                bottom: tabBarHeight,
                right: 0
            )
            recentTableView.scrollIndicatorInsets = recentTableView.contentInset
        }
    }

    private func setUp() {
        configUI()
        addContentViews()
        addLayoutConstraints()
    }

    private func configUI() {
        view.backgroundColor = UIColor.colorBg

        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fill
        mainStackView.spacing = 0
        mainStackView.backgroundColor = .clear
        mainStackView.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.text = "Search"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 36)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        recentTableView.backgroundColor = .clear
        recentTableView.separatorStyle = .none
        recentTableView.backgroundColor = .clear
        recentTableView.showsVerticalScrollIndicator = false
        recentTableView.dataSource = self
        recentTableView.delegate = self
        recentTableView.register(
            RecentSearchCell.self,
            forCellReuseIdentifier: "RecentSearchCell"
        )
        recentTableView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func addContentViews() {
        view.addSubview(mainStackView)

        mainStackView.addArrangedSubview(spacingView(height: 20))
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(spacingView(height: 12))
        mainStackView.addArrangedSubview(searchBarView)
        mainStackView.addArrangedSubview(spacingView(height: 30))
        mainStackView.addArrangedSubview(headerStack())
        mainStackView.addArrangedSubview(recentTableView)
    }

    private func addLayoutConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            mainStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 16
            ),
            mainStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -16
            ),
            mainStackView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),

            searchBarView.heightAnchor.constraint(equalToConstant: 40),
        ])
    }

    private func spacingView(height: CGFloat) -> UIView {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: height).isActive = true
        return v
    }

    private func headerStack() -> UIStackView {
        let label = UILabel()
        label.text = "Recent Searches"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white

        let button = UIButton(type: .system)
        button.setTitle("Clear All", for: .normal)
        button.setTitleColor(UIColor.systemPurple, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)

        let stack = UIStackView(arrangedSubviews: [label, UIView(), button])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        return recentSearches.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "RecentSearchCell",
                for: indexPath
            )
                as? RecentSearchCell
        else {
            return UITableViewCell()
        }
        cell.configure(with: recentSearches[indexPath.row])
        return cell
    }
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Handle search selection
    }
}

#if DEBUG
    #Preview {
        let vc = SearchViewController()
        return vc
    }
#endif
