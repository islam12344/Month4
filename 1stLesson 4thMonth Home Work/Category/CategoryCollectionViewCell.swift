//
//  CategoryCollectionViewCell.swift
//  1stLesson 4thMonth Home Work
//
//  Created by Islam on 18/2/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: CategoryCollectionViewCell.self)
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet private weak var categoryLabel: UILabel!
    
    func display(item: Category) {
        categoryLabel.text = item.name
        categoryImageView.image = item.image
        
    }
}

struct Category {
    let name: String
    let image: UIImage
}
