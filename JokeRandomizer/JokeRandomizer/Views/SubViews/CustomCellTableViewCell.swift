//
//  CustomCell.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 12/1/22.
//

import Foundation
import UIKit

class CustomCellTableViewCell: UITableViewCell {
    let punchline = UILabel()
    let setup = UILabel()
    static let identifier = "CustomCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //setup
        setup.translatesAutoresizingMaskIntoConstraints = false
        setup.numberOfLines = 5
        setup.sizeToFit()
        //punlince
        punchline.translatesAutoresizingMaskIntoConstraints = false
        punchline.sizeToFit()
        //view
        contentView.addSubview(setup)
        contentView.addSubview(punchline)
//MARK: - Constraints
        NSLayoutConstraint.activate([
        //setup
            setup.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            setup.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            setup.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -20),
            setup.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        //punchline
            punchline.leadingAnchor.constraint(equalTo: setup.leadingAnchor),
            punchline.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            punchline.topAnchor.constraint(equalTo: setup.bottomAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
