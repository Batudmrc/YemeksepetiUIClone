//
//  CategoryCollectionViewCell.swift
//  YemeksepetiClone
//
//  Created by Batuhan Demircioğlu on 17.04.2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(category: Category) {
        categoryLabel.text = category.label
        imageView.image = UIImage(named: category.image)
    }
}
struct Category {
    let label, image: String
}
