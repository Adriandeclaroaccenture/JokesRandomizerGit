//
//  ToDoTableViewCell.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 12/1/22.
//

//import UIKit
//
//class ToDoTableViewCell: UITableViewCell {
//    
//    var model: ToDo? {
//        didSet {
//            if let item = model {
//                todoTitle.text = item.setup
//            }
//        }
//    }
//    private lazy var todoTitle: UILabel = {
//        let v = UILabel()
//        v.translatesAutoresizingMaskIntoConstraints = false
//        v.font = UIFont.systemFont(ofSize: 16, weight: .bold)
//        v.textColor = .red
//        v.numberOfLines = 0
//        return v
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupView()
//    }
//    required init?(coder: NSCoder) {
//        fatalError("Not Implemented")
//    }
////MARK: - Func setupView
//   private func setupView() {
//       contentView.addSubview(todoTitle)
//        setupConstraints()
//    }
////MARK: - Func setupConstraints
//    private func setupConstraints() {
//        NSLayoutConstraint.activate([
//            todoTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            todoTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            todoTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            todoTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
//        ])
//    }
//}
