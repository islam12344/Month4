//
//  PostCollectionViewCell.swift
//  1stLesson 4thMonth Home Work
//
//  Created by Islam on 26/2/23.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = String(describing: PostCollectionViewCell.self)
    
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var price: UILabel!
    @IBOutlet private weak var discountPercentage: UILabel!
    @IBOutlet private weak var rating: UILabel!
    @IBOutlet private weak var stock: UILabel!
    @IBOutlet private weak var brand: UILabel!
    @IBOutlet private weak var category: UILabel!
    @IBOutlet private weak var thumbnailImage: UIImageView!
    //    @IBOutlet private weak var image: UIImageView!
    
    func display(item: Products) {
        title.text = item.title
        descriptionLabel.text = item.description
        price.text = "Price: \(item.price)$"
        discountPercentage.text = "Discount:-\(item.discountPercentage)%"
        rating.text = "Reiting: \(item.rating)"
        stock.text = "Stock: \(item.stock)"
        brand.text = item.brand
        category.text = item.category
        downloadImage(thumbnail: item.thumbnail, to: thumbnailImage)
    }
    
    func downloadImage(thumbnail: String, to imageView: UIImageView) {
        guard let url = URL(string: thumbnail) else {
            print("нет такой url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.thumbnailImage.image = UIImage(data: data)
            }
        }
        task.resume()
    }
}
