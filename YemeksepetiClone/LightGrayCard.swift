//
//  CardView.swift
//  YemeksepetiClone
//
//  Created by Batuhan Demircioğlu on 17.04.2023.
//

import UIKit

class LightGrayCard: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    // This class adds shadowing effect in UIView's
    private func initialSetup() {
        layer.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 0.05)
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.2
        layer.cornerRadius = 5

    }
}
