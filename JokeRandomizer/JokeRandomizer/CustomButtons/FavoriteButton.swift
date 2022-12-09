//
//  FavoriteButton.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 12/2/22.
//

import UIKit


class AddFavoriteButton: UIButton {
    
    private let addFavoriteButton: UIButton = {
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

//MARK: - Custom Button Reusable
class FavoriteButtonCustom: UIButton {

    enum Style {
        case addFavoriteJoke
        case refreshButtonJoke
    }
    enum Size {
        case small
        case medium
        case large
    }
    enum Corner {
        case small
        case medium
        case large
    }
//MARK: - Initializer
    public private(set) var style: Style
    public private(set) var size: Size
    public private(set) var corner: Corner
    public private(set) var title: String
    init(style: Style, size: Size, corner: Corner, title: String) {
        self.style = style
        self.size = size
        self.corner = corner
        self.title = title
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: - Methods
    private func setupButton() {
        handleSizeButton()
        handleStyleButton()
        handleCornerButton()
        buttonSetupTitle()
    }
    private func buttonSetupTitle() {
        setTitle(title, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
    private func handleCornerButton() {
        switch corner {
        case .small:
            layer.cornerRadius = 4
        case .medium:
            layer.cornerRadius = 8
        case .large:
            layer.cornerRadius = 15
        }
    }
    private func handleStyleButton() {
        switch style {
        case .addFavoriteJoke:
            backgroundColor = .blue
        case .refreshButtonJoke:
            backgroundColor = .darkGray
            tintColor = .white
        }
    }
//MARK: - EdgeInsets
    private var smallContentEdgeInsets: UIEdgeInsets {
        UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }
    private var mediumContentEdgeInsets: UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    private var largeContentEdgeInsets: UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    private func handleSizeButton() {
        switch size {
        case .small:
            contentEdgeInsets = smallContentEdgeInsets
        case .medium:
            contentEdgeInsets = mediumContentEdgeInsets
        case .large:
            contentEdgeInsets = largeContentEdgeInsets
        }
    }
}
