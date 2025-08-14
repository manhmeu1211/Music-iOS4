//
//  HomeViewController.swift
//  IOS4MyMuzic
//
//  Created by Tran Viet Anh on 1/7/25.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    private lazy var viewModel: HomeViewModel = HomeViewModel()
    private var cancellables = Set<AnyCancellable>()
    let trendingLabel = UILabel()
    let adsView = UIView()
    let containerView = UIView()
    let tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.fetchData()
        bindViewModel()
    }
    private func setupUI() {
        configUI()
        setUpContent()
        setUpConstraints()
        setUpEvent()
    }
    private func configUI() {
    
        tableView.register(MusicSectionTableViewCell.self, forCellReuseIdentifier: MusicSectionTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear

        view.backgroundColor = .colorBg
        
        trendingLabel.text = "Trending"
        trendingLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        trendingLabel.textColor = .white
        trendingLabel.translatesAutoresizingMaskIntoConstraints = false
      
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        adsView.translatesAutoresizingMaskIntoConstraints = false
        adsView.backgroundColor = .white
        
      
        
    }
    private func setUpContent() {
        view.addSubview(containerView)
        containerView.addSubview(trendingLabel)
        containerView.addSubview(adsView)
        containerView.addSubview(tableView)
    }
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            trendingLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            trendingLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25),
            trendingLabel.heightAnchor.constraint(equalToConstant: 42),
            
            adsView.topAnchor.constraint(equalTo: trendingLabel.bottomAnchor, constant: 5),
            adsView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            adsView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            adsView.heightAnchor.constraint(equalToConstant: 41),
            
            tableView.topAnchor.constraint(equalTo: adsView.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 12),
            tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
        ])
    }
    private func setUpEvent() {
        
    }
    
}

//MARK: setup tableview
extension HomeViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections  = viewModel.trendingSections else { return 0}
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicSectionTableViewCell.identifier, for: indexPath) as? MusicSectionTableViewCell else {
            return UITableViewCell()
        }
    
        guard let section = viewModel.trendingSections?[indexPath.row] else { return UITableViewCell() }
        
        cell.configure(title: section.title , data: section.items.collection, isFirstSession: indexPath.row == 0)
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return indexPath.row == 0 ? 100 : 230
    }
    
}
//MARK: setup section
extension HomeViewController  {
    func setUpSection() {
        guard let sections  = viewModel.trendingSections else { return }
        
        for section in sections{
            
            let titleView = UILabel()
            titleView.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            titleView.textColor = .white
            titleView.text = section.title

            let stackSectionView = UIStackView()
            stackSectionView.axis = .vertical
            stackSectionView.spacing = 10
            stackSectionView.alignment = .leading
            stackSectionView.translatesAutoresizingMaskIntoConstraints = false
            
        }
    }
    
}
// MARK: Bind data
extension HomeViewController {
    private func bindViewModel() {
        viewModel.$trendingSections
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
}
