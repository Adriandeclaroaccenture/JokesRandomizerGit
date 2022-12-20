//
//  CustomButton.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 11/28/22.
//

import UIKit

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
            setImage(UIImage(systemName: "arrow.clockwise.circle.fill"), for: .normal)
            defaultProperties()
            
        case .favoriteButton:
            super.init(frame: .zero)
            setImage(UIImage(systemName: "plus"), for: .normal)
            defaultProperties()
            shakeFavorite()
        case .listButton:
            super.init(frame: .zero)
            setImage(UIImage(systemName: "list.bullet.circle" ), for: .normal)
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
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupButton()
//    }
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupButton()
//    }
    
//    func setupButton() {
//        setShadow()
//        shake()
//        let image = UIImage(systemName: "arrow.clockwise.circle.fill")
//        setImage(image, for: .normal)
//        setTitleColor(.white, for: .normal)
//        backgroundColor = .blue
//        layer.cornerRadius = 25
//        layer.borderWidth = 3.0
//        layer.borderColor = UIColor.darkGray.cgColor
//    }
//
//    private func setShadow() {
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
//        layer.shadowRadius = 8
//        layer.shadowOpacity = 0.5
//        clipsToBounds = true
//        layer.masksToBounds = false
//    }
//
//    func shake() {
//        let shake = CABasicAnimation(keyPath: "position")
//        shake.duration = 0.1
//        shake.repeatCount = 2
//        shake.autoreverses = true
//
//        let fromPoint = CGPoint(x: center.x - 8, y: center.y)
//        let fromValue = NSValue(cgPoint: fromPoint)
//
//        let toPoint = CGPoint(x: center.x + 8, y: center.y)
//        let toValue = NSValue(cgPoint: toPoint)
//
//        shake.fromValue = fromValue
//        shake.toValue = toValue
//
//        layer.add(shake, forKey: "position")
//    }



