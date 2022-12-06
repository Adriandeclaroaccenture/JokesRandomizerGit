//
//  LabelText.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 12/6/22.
//

import UIKit

class Label: UILabel {
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 10.0, y: 40.0, width: UIScreen.main.bounds.size.width - 20.0, height: 100.0)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        lbl.text = " "
        lbl.sizeToFit()
        return lbl
    }()
}
