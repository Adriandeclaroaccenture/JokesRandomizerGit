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

struct Design {
    struct Color {
        struct Primary{
            static let Blue = UIColor.rgba(red: 0, green: 122, blue: 255, alpha: 1)
            static let Black = UIColor.rgba(red: 21, green: 23, blue: 33, alpha: 1)
        }
    }
    struct Font {
        static let Fontbody = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
}

extension UIColor {
    static func rgba(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}
