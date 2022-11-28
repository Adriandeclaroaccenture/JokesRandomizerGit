//
//  FavoriteJokes.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 11/28/22.
//

import UIKit

class FavoriteJokes: UITableViewCell {

    let favoriteJokes = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(favoriteJokes)
        configureJokes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureJokes() {
        
        favoriteJokes.clipsToBounds = true
        favoriteJokes.numberOfLines = 0
        favoriteJokes.adjustsFontSizeToFitWidth = true
    }
    
}
