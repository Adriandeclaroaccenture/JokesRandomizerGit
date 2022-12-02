//
//  FavoriteButton.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 12/2/22.
//

import UIKit

class AddFavoriteButton: UIButton {
    private lazy var addFavoriteButton: UIButton = {
            let v = UIButton()
            v.translatesAutoresizingMaskIntoConstraints = false
            let config = UIImage.SymbolConfiguration(pointSize: 32.0, weight: .bold)
            let image = UIImage(systemName: "plus", withConfiguration: config)
            v.setImage(image, for: .normal)
            v.tintColor = .white
            v.backgroundColor = .blue
            v.layer.cornerRadius = 10
            v.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
            return v
        }()
}
