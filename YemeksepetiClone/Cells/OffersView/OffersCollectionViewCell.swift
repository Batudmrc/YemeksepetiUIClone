//
//  OffersCollectionViewCell.swift
//  YemeksepetiClone
//
//  Created by Batuhan Demircioğlu on 19.04.2023.
//

import UIKit

class OffersCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageVew: UIImageView!
    
    static let identifier = String(describing: OffersCollectionViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup(offer: Offer) {
        imageVew.image = UIImage(named: offer.image)
    }
}

struct Offer {
    let image: String
}
