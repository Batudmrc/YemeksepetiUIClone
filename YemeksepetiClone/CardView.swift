//
//  CardView.swift
//  YemeksepetiClone
//
//  Created by Batuhan Demircioğlu on 17.04.2023.
//

import UIKit

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    // This class adds shadowing effect in UIView's
    private func initialSetup() {
        layer.backgroundColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.1
        layer.cornerRadius = 5

    }
}
