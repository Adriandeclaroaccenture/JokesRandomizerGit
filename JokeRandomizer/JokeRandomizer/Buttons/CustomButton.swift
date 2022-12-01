//
//  CustomButton.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 11/28/22.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
        setShadow()
        
        setTitleColor(.white, for: .normal)
        
        backgroundColor = .blue
        titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 10)
        layer.cornerRadius = 25
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.darkGray.cgColor
    }
    
    private func setShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.5
        clipsToBounds = true
        layer.masksToBounds = false
    }
    
    func shake() {
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
