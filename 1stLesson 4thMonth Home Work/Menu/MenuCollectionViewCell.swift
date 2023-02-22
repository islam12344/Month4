//
//  MenuCollectionViewCell.swift
//  1stLesson 4thMonth Home Work
//
//  Created by Islam on 22/2/23.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {

    static let menuReuseIdentifier = String(describing: MenuCollectionViewCell.self)
    
    @IBOutlet private weak var menuLabel: UILabel!
    
    func display(item: String) {
        menuLabel.text = item
    }


}
