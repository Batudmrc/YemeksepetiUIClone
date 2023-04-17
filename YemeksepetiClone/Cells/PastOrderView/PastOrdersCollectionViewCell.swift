//
//  PastOrdersCollectionViewCell.swift
//  YemeksepetiClone
//
//  Created by Batuhan Demircioğlu on 17.04.2023.
//

import UIKit

class PastOrdersCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var servicePrice: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier = String(describing: PastOrdersCollectionViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(restaurant: Restaurant) {
        titleLabel.text = restaurant.title
        categoryLabel.text = restaurant.category
        servicePrice.text = restaurant.servicePrice
        imageView.image = UIImage(named: restaurant.image)
    }

}

struct Restaurant {
    let title: String
    let category: String
    let servicePrice: String
    let image: String
}
