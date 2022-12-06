//
//  FavoriteButton.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 12/2/22.
//

import UIKit



class addFavoriteButton: UIButton {
    
    private lazy var addFavoriteButton: UIButton = {
            let favButton = UIButton()
            favButton.translatesAutoresizingMaskIntoConstraints = false
            let config = UIImage.SymbolConfiguration(pointSize: 32.0, weight: .bold)
            let image = UIImage(systemName: "plus", withConfiguration: config)
            favButton.setImage(image, for: .normal)
            favButton.tintColor = .white
            favButton.backgroundColor = .blue
            favButton.layer.cornerRadius = 10
            favButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
            return favButton
        }()
    
    func shakeFavorite() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 8, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 8, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
        
    }
    
    func AddFavoriteButtonConstriants() {

        NSLayoutConstraint.activate([
                    addFavoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                    addFavoriteButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
                    addFavoriteButton.widthAnchor.constraint(equalToConstant: 44),
                    addFavoriteButton.heightAnchor.constraint(equalToConstant: 44)
                ])
    }
}






