//
//  SearchProductViewController.swift
//  1stLesson 4thMonth Home Work
//
//  Created by ibaikaa on 22/2/23.
//

import UIKit

class SearchProductViewController: UIViewController {
    @IBOutlet weak var searchProductSearchBar: UISearchBar!
    @IBOutlet weak var productsTableView: UITableView!
    
    private func configureSearchProductSearchBar(){
        searchProductSearchBar.delegate = self
    }
    
    private func configureProductsTV() {
        productsTableView.delegate = self
        productsTableView.dataSource = self
        productsTableView.register(
            ProductTableViewCell.nib,
            forCellReuseIdentifier: ProductTableViewCell.reuseIdentifier
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureProductsTV()
    }
}

// MARK: UITableViewDataSource extension
extension SearchProductViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 5
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = productsTableView
            .dequeueReusableCell(
                withIdentifier: ProductTableViewCell.reuseIdentifier,
                for: indexPath
            ) as? ProductTableViewCell else { fatalError("xib not found") }
        cell.backgroundColor = .blue
        return cell
    }
}

// MARK: UITableViewDelegate extension
extension SearchProductViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat { 340 }
}

// MARK: UISearchBarDelegate
extension SearchProductViewController: UISearchBarDelegate {
    func searchBar(
        _ searchBar: UISearchBar,
        textDidChange searchText: String
    ) {
        print(searchText)
    }
}
