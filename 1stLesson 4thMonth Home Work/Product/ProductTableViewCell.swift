//
//  ProductTableViewCell.swift
//  1stLesson 4thMonth Home Work
//
//  Created by Islam on 20/2/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    static let reuseIdentifier = String(describing: ProductTableViewCell.self)
    static let nib = UINib(nibName: reuseIdentifier, bundle: nil)
    
    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet private weak var openClose: UILabel!
    @IBOutlet private weak var time: UILabel!
    @IBOutlet private weak var comment: UILabel!
    @IBOutlet private weak var typeOfBurger: UILabel!
    @IBOutlet private weak var delivery: UILabel!
    @IBOutlet private weak var price: UILabel!
    @IBOutlet private weak var locationOfDelivery: UILabel!
    
    func display(item: Product) {
        productImageView.image = item.image
        productName.text = item.productName
        openClose.text = item.openClose
        time.text = item.time
        comment.text = item.comment
        typeOfBurger.text = item.typeOfBurger
        delivery.text = item.delivery
        price.text = item.price
        locationOfDelivery.text = item.locationOfDelivery
    }
}

struct Product {
    let productName: String
    let openClose: String
    let time: String
    let comment: String
    let typeOfBurger: String
    let delivery: String
    let price: String
    let locationOfDelivery: String
    let image: UIImage
}
