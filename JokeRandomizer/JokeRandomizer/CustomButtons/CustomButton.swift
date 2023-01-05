//
//  CustomButton.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 11/28/22.
//

import UIKit
import Foundation

class CustomButton: UIButton {
    
    enum ButtonTypes {
        case refreshButton
        case favoriteButton
        case listButton
    }
    
    override init (frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(styles: ButtonTypes) {
        switch styles {
        case .refreshButton:
            super.init(frame: .zero)
            setImage(Design.Image.refresh_image, for: .normal)
            defaultProperties()
            
        case .favoriteButton:
            super.init(frame: .zero)
            setImage(Design.Image.add_image, for: .normal)
            defaultProperties()
            shakeFavorite()
        case .listButton:
            super.init(frame: .zero)
            setImage(Design.Image.list_image, for: .normal)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not yet implemented")
    }
    
    private func defaultProperties() {
        titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        setTitleColor(.white , for: .normal)
        layer.borderWidth = 1
        layer.cornerRadius = 6
        layer.borderColor = UIColor.lightGray.cgColor
        contentMode = .scaleAspectFit
        layer.masksToBounds = false
        clipsToBounds = false
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
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
}

