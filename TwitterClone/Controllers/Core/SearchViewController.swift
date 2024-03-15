//
//  SearchViewController.swift
//  TwitterClone
//
//  Created by Amr Hossam on 22/02/2022.
//

import UIKit

class SearchViewController: UIViewController {

    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: SearchResultsViewController())
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.placeholder = "Search with @usernames"
        return searchController
    }()

    private let promptLabel: UILabel = {
        let label = UILabel()
        label.text = "Search for users and get connected"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .placeholderText
        return label
    }()

    let viewModel: SearchViewViewModel

    init(viewModel: SearchViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(promptLabel)
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        configureConstraints()
    }

    private func configureConstraints() {
        let promptLabelConstraints = [
            promptLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            promptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            promptLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ]

        NSLayoutConstraint.activate(promptLabelConstraints)
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let resultsViewController = searchController.searchResultsController as? SearchResultsViewController,
              let query = searchController.searchBar.text
        else { return }
        viewModel.search(with: query) { users in
            resultsViewController.update(users: users)
        }
    }
}
