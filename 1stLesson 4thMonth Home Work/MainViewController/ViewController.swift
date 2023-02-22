//
//  ViewController.swift
//  1stLesson 4thMonth Home Work
//
//  Created by Islam on 18/2/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var categoryCollectionView: UICollectionView!
    @IBOutlet private weak var productTableView: UITableView!
    @IBOutlet private weak var menuCollectionView: UICollectionView!
    
    private func configureProductTV() {
        productTableView.dataSource = self
        productTableView.delegate = self
        
        productTableView.register(
            ProductTableViewCell.nib,
            forCellReuseIdentifier: ProductTableViewCell.reuseIdentifier
        )
    }
    
    private func configureMenuCV() {
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        menuCollectionView.register(
            UINib(
                nibName: String(describing: MenuCollectionViewCell.self),
                bundle: nil),
            forCellWithReuseIdentifier: MenuCollectionViewCell.menuReuseIdentifier
        )
    }
    
    private func configureCategoryCV() {
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.register(
            UINib(
                nibName: String(describing: CategoryCollectionViewCell.self),
                bundle: nil
            ),
            forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier
        )
    }

    private var products: [Product] = [
        .init(
            productName: "Burger Craze",
            openClose: "Open",
            time: "15-20",
            comment: "4.6(601)",
            typeOfBurger: "American : Burgers",
            delivery: "Delivery: Free",
            price: "Minimum 10$",
            locationOfDelivery: "1.5 km away",
            image: UIImage(named: "Humburger")!
        ),
        .init(
            productName: "Vegetarian Pizza",
            openClose: "Open",
            time: "10-15",
            comment: "4.5(600)",
            typeOfBurger: "Italian : Burgers",
            delivery: "Delivery: Free",
            price: "Minimum 10$",
            locationOfDelivery: "1.5 km away",
            image: UIImage(named: "Pizza")!
        ),
        .init(
            productName: "Какая-нибудь Pizza",
            openClose: "Open",
            time: "10-15",
            comment: "4.5(600)",
            typeOfBurger: "Italian : Burgers",
            delivery: "Delivery: Free",
            price: "Minimum 10$",
            locationOfDelivery: "1.5 km away",
            image: UIImage(named: "Pizza")!
        )
    ]
    
    private var menuArray: [String] = [
        "Delivery",
        "Pickup",
        "Catering",
        "Curbside"
    ]
    
    private var categories: [Category] = [
        .init(
            name: "Takeaways",
            image: UIImage(named: "Takeaways")!
        ),
        .init(
            name: "Grocery",
            image: UIImage(named: "Grocery")!
        ),
        .init(
            name: "Convenience",
            image: UIImage(named: "Convenience")!
        ),
        .init(
            name: "Pharmacy",
            image: UIImage(named: "Pharmacy")!
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureMenuCV()
        configureCategoryCV()
        configureProductTV()
    }
}

// MARK: UITableViewDataSource Extension
extension ViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        products.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ProductTableViewCell.reuseIdentifier,
            for: indexPath
        ) as? ProductTableViewCell else { fatalError("xib not found") }
        cell.display(item: products[indexPath.row])
        return cell
    }
}

// MARK: UITableViewDelegate Extension
extension ViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat { 340 }
}

// MARK: UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        if collectionView == menuCollectionView {
            return menuArray.count
        } else {
            return categories.count
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        if collectionView == menuCollectionView {
            guard let cellMenu = collectionView.dequeueReusableCell(
                withReuseIdentifier: MenuCollectionViewCell.menuReuseIdentifier,
                for: indexPath
            ) as? MenuCollectionViewCell else { fatalError("xib not found") }
            let model = menuArray[indexPath.item]
            cellMenu.display(item: model)
            return cellMenu
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier,
                for: indexPath
            ) as? CategoryCollectionViewCell else { fatalError("xib not found") }
            cell.display(item: categories[indexPath.row])
            return cell
        }
    }
}

// MARK: UICollectionViewDelegateFlowLayout extension
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        if collectionView == menuCollectionView {
            return CGSize(width: 100, height: 50)
        }else{
            return CGSize(width: 80, height: 105)
        }
    }
}
