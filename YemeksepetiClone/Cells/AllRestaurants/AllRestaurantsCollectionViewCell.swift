//
//  AllRestaurantsCollectionViewCell.swift
//  YemeksepetiClone
//
//  Created by Batuhan Demircioğlu on 19.04.2023.
//

import UIKit

class AllRestaurantsCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var delvieryPrice: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    static let identifier = String(describing: AllRestaurantsCollectionViewCell.self)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(restaurant: Restaurant) {
        nameLabel.text = restaurant.title
        categoryLabel.text = restaurant.category
        delvieryPrice.text = restaurant.servicePrice
        imageView.image = UIImage(named: restaurant.image)
    }

}


