//
//  PostViewController.swift
//  1stLesson 4thMonth Home Work
//
//  Created by Islam on 24/2/23.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var findProductSearchBar: UISearchBar!
    @IBOutlet private weak var postCollectionView: UICollectionView!
    
    private func configureSearchBar() {
        findProductSearchBar.delegate = self
    }
    
    private func configurePCV() {
        postCollectionView.dataSource = self
        postCollectionView.delegate = self
        postCollectionView.register(
            UINib(nibName: PostCollectionViewCell.reuseID, bundle: nil),
            forCellWithReuseIdentifier: PostCollectionViewCell.reuseID
        )
    }
    
    private func showError(with message: Error) {
        let alert = UIAlertController(title: "Error", message: message.localizedDescription, preferredStyle: .alert)
        alert.addAction(.init(title: "Okay", style: .cancel))
        present(alert, animated: true)
    }
    
    private func searchProducts(text: String) {
//        ServerLayer.shared.findProductsData(text: text) { result in
//            switch result {
//            case .success(let postModel):
//                self.postsArrayP = postModel.products
//                DispatchQueue.main.async {
//                    self.postCollectionView.reloadData()
//                }
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    self.showError(with: error)
//                }
//            }
//        }
//        
        Task {
            do {
                self.postsArrayP = try await ServerLayer.shared.findAsync(text: text).products
                DispatchQueue.main.async {
                    self.postCollectionView.reloadData()
                }
            } catch {
                DispatchQueue.main.async {
                    self.showError(with: error)
                }
            }
        }
    }
    private var postsArrayP: [Products] = []
    private var filteredProducts = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePCV()
        searchProducts(text: "")
    }
}

extension PostViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        postsArrayP.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PostCollectionViewCell.reuseID,
            for: indexPath
        ) as? PostCollectionViewCell else { fatalError("xib not found") }
        guard !postsArrayP.isEmpty else { return UICollectionViewCell() }
        let post = postsArrayP[indexPath.row]
        cell.display(item: post)
        return cell
    }
}

extension PostViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 400)
    }
}

extension PostViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        postsArrayP.removeAll()
        searchProducts(text: searchText)
    }
}
