//
//  StackView.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 1/3/23.
//

import UIKit

class StackView: UIViewController {
    //MARK: - StackView
        private let classStackView: UIStackView = {
            let stack = UIStackView()
            stack.spacing = 25.0
            stack.axis = .vertical
            stack.alignment = .center
            stack.distribution = .equalSpacing
            return stack
        }()
}
