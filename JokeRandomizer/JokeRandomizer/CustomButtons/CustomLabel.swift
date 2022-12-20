//
//  CustomLabel.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 12/7/22.
//

import UIKit

//fileprivate let defaultFontSize: CGFloat = 15.0

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

//final class AuthLabel: UIView {
//    let setupLabelJoke: UILabel = {
//        let jkLabel = UILabel()
//        jkLabel.numberOfLines = 0
//        jkLabel.textAlignment = .left
//        jkLabel.font = .systemFont(ofSize: defaultFontSize - 2, weight: .semibold)
//        jkLabel.translatesAutoresizingMaskIntoConstraints = false
//        return jkLabel
//    }()
//    let punchlineLabelJoke: UILabel = {
//        let jkLabel = UILabel()
//        jkLabel.numberOfLines = 0
//        jkLabel.textAlignment = .left
//        jkLabel.font = .systemFont(ofSize: defaultFontSize - 2, weight: .semibold)
//        jkLabel.translatesAutoresizingMaskIntoConstraints = false
//        return jkLabel
//    }()
//
//    init (frame: CGRect = .zero, title: String) {
//        super.init(frame: frame)
//        setTitle(title: title)
//        configure()
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        configure()
//    }
//
//    func setTitle(title: String) {
//        setupLabelJoke.text = title.lowercased()
//        punchlineLabelJoke.text = title.lowercased()
//    }
//
//    private func configure() {
//        addSubview(setupLabelJoke)
//        NSLayoutConstraint.activate([
//            setupLabelJoke.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//            setupLabelJoke.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
//            setupLabelJoke.centerYAnchor.constraint(equalTo: centerYAnchor),
//            punchlineLabelJoke.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//            punchlineLabelJoke.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
//            punchlineLabelJoke.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 40),
//            punchlineLabelJoke.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 40)
//
//        ])
//    }
//}
