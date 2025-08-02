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
    private let headerLabel = UILabel()
    private let headerClearAllButton = UIButton()
    private let headerStack = UIStackView()
    private let recentTableView = UITableView()
    private let resultTableView = UITableView()

    private var recentSearches = [
        "Ariana Grande",
        "Morgan Wallen",
        "Justin Bieber",
        "Drake",
        "Happy new year best music for eve night...",
        "Morgan Wallen",
    ]

    private var searchResults: [SearchResultType] = [
        .playlist(
            name: "Playlist1",
            artist: "Morgan Wallen",
            image: "img_thumbnal_song",
            numberOfTrack: 15
        ),
        .song(
            name: "ABC",
            artist: "Drake",
            image: "img_thumbnal_song",
            duration: "4:20",
            totalPlay: "1M"
        ),
        .artist(
            name: "Morgan Wallen",
            followers: 1_500_000,
            image: "img_thumbnal_song"
        ),
    ]

    private var searchKeyword: String = ""
    private var isSearching: Bool {
        !searchKeyword.isEmpty
    }

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
        updateTableViewVisibility()
        
        if let tabBarHeight = self.tabBarController?.tabBar.frame.height {
            recentTableView.contentInset = UIEdgeInsets(
                top: 0,
                left: 0,
                bottom: tabBarHeight,
                right: 0
            )
            recentTableView.scrollIndicatorInsets = recentTableView.contentInset

            resultTableView.contentInset = UIEdgeInsets(
                top: 0,
                left: 0,
                bottom: tabBarHeight,
                right: 0
            )
            resultTableView.scrollIndicatorInsets = resultTableView.contentInset
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
        recentTableView.showsVerticalScrollIndicator = false
        recentTableView.dataSource = self
        recentTableView.delegate = self
        recentTableView.register(type: RecentSearchCell.self)
        recentTableView.translatesAutoresizingMaskIntoConstraints = false

        resultTableView.backgroundColor = .clear
        resultTableView.separatorStyle = .none
        resultTableView.showsVerticalScrollIndicator = false
        resultTableView.dataSource = self
        resultTableView.delegate = self
        resultTableView.register(type: SearchResultCell.self)
        resultTableView.translatesAutoresizingMaskIntoConstraints = false

        searchBarView.delegate = self

        headerLabel.text = "Recent Search"
        headerLabel.font = UIFont.boldSystemFont(ofSize: 18)
        headerLabel.textColor = .white

        headerClearAllButton.setTitle("Clear All", for: .normal)
        headerClearAllButton.setTitleColor(UIColor.systemPurple, for: .normal)
        headerClearAllButton.titleLabel?.font = UIFont.boldSystemFont(
            ofSize: 18
        )
        headerClearAllButton.isHidden = isSearching

        headerStack.axis = .horizontal
        headerStack.alignment = .center
        headerStack.spacing = 8
        headerStack.translatesAutoresizingMaskIntoConstraints = false
    }

    private func addContentViews() {
        view.addSubview(mainStackView)

        mainStackView.addArrangedSubview(spacingView(height: 20))
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(spacingView(height: 12))
        mainStackView.addArrangedSubview(searchBarView)
        mainStackView.addArrangedSubview(spacingView(height: 30))
        mainStackView.addArrangedSubview(headerStack)
        mainStackView.addArrangedSubview(recentTableView)
        mainStackView.addArrangedSubview(resultTableView)

        headerStack.addArrangedSubview(headerLabel)
        headerStack.addArrangedSubview(headerClearAllButton)
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

    private func updateTableViewVisibility() {
        recentTableView.isHidden = isSearching
        resultTableView.isHidden = !isSearching
        headerStack.isHidden = isSearching
    }

    private func handleSearch(query: String) {
        searchKeyword = query
        updateTableViewVisibility()
    }

    private func getTypeCellFromResultType(_ resultType: SearchResultType) {

    }
}

extension SearchViewController: SearchBarDelegate {
    func searchBar(_ searchBar: SearchBar, textDidChange text: String) {
        handleSearch(query: text)
    }

    func searchBarCancelButtonClicked(_ searchBar: SearchBar) {
        handleSearch(query: "")
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        if tableView == recentTableView {
            return recentSearches.count
        }
        return searchResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        if tableView == recentTableView {
            guard
                let cell = tableView.dequeueCell(
                    type: RecentSearchCell.self,
                    indexPath: indexPath
                )
            else {
                return UITableViewCell()
            }
            cell.configure(with: recentSearches[indexPath.row])
            return cell
        } else {
            guard
                let cell = tableView.dequeueCell(
                    type: SearchResultCell.self,
                    indexPath: indexPath
                )
            else {
                return UITableViewCell()
            }

            cell.configure(with: searchResults[indexPath.row])
            return cell
        }
    }

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Handle search selection
    }
}

// MARK: - Search Result Types
enum SearchResultType {
    case song(
        name: String,
        artist: String,
        image: String,
        duration: String,
        totalPlay: String
    )
    case playlist(
        name: String,
        artist: String,
        image: String,
        numberOfTrack: Int
    )
    case artist(name: String, followers: Int, image: String)
}

#if DEBUG
    #Preview {
        let vc = SearchViewController()
        return vc
    }
#endif
