//
//  AddNewItemViewController.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 12/1/22.
//

//import UIKit
//import CoreData
//
//protocol AddNewItemViewControllerDelegate: class {
////MARK: - Func saveNewItem
//    func saveNewItem(item: String)
//}
//
//final class AddNewItemViewController: UIViewController {
//    weak var delegate: AddNewItemViewControllerDelegate?
////MARK: - titleLabel
//    private lazy var titleLabel: UILabel = {
//        let v = UILabel()
//        v.translatesAutoresizingMaskIntoConstraints = false
//        v.font = UIFont.systemFont(ofSize: 16, weight: .bold)
//        v.text = "Add"
//        v.textColor = .red
//        v.numberOfLines = 0
//        return v
//    }()
////MARK: - titleField
//    private lazy var titleField: UITextField = {
//        let v = UITextField()
//        v.translatesAutoresizingMaskIntoConstraints = false
//        v.borderStyle = .roundedRect
//        v.textColor = .black
//        v.placeholder = "Add New Joke"
//        return v
//    }()
////MARK: - Func saveButton
//    private lazy var saveButton: UIButton = {
//        let v = UIButton()
//        v.translatesAutoresizingMaskIntoConstraints = false
//        v.setTitle("Save", for: .normal)
//        v.addTarget(self, action: #selector(didTapSave(_:)), for: .touchUpInside)
//        v.setTitleColor(.white, for: .normal)
//        v.backgroundColor = .blue
//        return v
//    }()
////MARK: - viewDidLoad
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupView()
//    }
////MARK: - Func setupView
//    private func setupView() {
//        view.backgroundColor = .white
//        [titleLabel, titleField, saveButton].forEach { (v) in
//            view.addSubview(v)
//        }
//        setupConstraints()
//    }
////MARK: - Func setupConstraints
//    private func setupConstraints() {
//        //titleLabel
//        NSLayoutConstraint.activate([
//            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 32)
//        ])
//        //titleField
//        NSLayoutConstraint.activate([
//            titleField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            titleField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            titleField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8)
//        ])
//        //button
//        NSLayoutConstraint.activate([
//            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            saveButton.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 16),
//            saveButton.heightAnchor.constraint(equalToConstant: 50)
//        ])
//    }
////MARK: - Objc didTapSave
//    @objc private func didTapSave(_ sender: UIButton) {
//        guard let text = titleField.text, !text.isEmpty else {
//            return
//        }
//        delegate?.saveNewItem(item: text)
//        dismiss(animated: true, completion: nil)
//    }
//}
//
