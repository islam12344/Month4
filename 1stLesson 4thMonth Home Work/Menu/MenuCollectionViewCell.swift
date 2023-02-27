//
//  MenuCollectionViewCell.swift
//  1stLesson 4thMonth Home Work
//
//  Created by Islam on 22/2/23.
//

import UIKit

@IBDesignable
class MenuCollectionViewCell: UICollectionViewCell {
    
    @IBInspectable var cornerRadius: CGFloat {
        get { self.layer.cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }
    
    @IBInspectable
    private var borderWidth: CGFloat {
        get { self.layer.borderWidth }
        set { self.layer.borderWidth = newValue }
    }
    
    @IBInspectable
    private var borderColor: UIColor? {
        get { UIColor(cgColor: self.layer.borderColor!) }
        set { self.layer.borderColor = newValue?.cgColor }
    }


    static let menuReuseIdentifier = String(describing: MenuCollectionViewCell.self)
    
    @IBOutlet private weak var menuLabel: UILabel!
    
    func display(item: String) {
        menuLabel.text = item
    }

}
