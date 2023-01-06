//
//  CustomLabel.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 12/7/22.
//

import UIKit



class CustomLabel: UILabel {
    
    enum LabelTypes {
        
        case setupLabel
        case punchlineLabel
    }
    
    init(styles: LabelTypes) {
        switch styles {
        case .setupLabel:
            super.init(frame: .zero)
            text = "Loading Joke"
        case .punchlineLabel:
            super.init(frame: .zero)
            self.textColor = .default_blue
            text = ""
        }
        defaultProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not yet implemented")
    }
    
    private func defaultProperties() {
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
        sizeToFit()
    }
}

