//
//  ToDoListViewController.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 12/1/22.
//

//import UIKit
//
//final class ToDoListViewController: UIViewController {
//    var folder: String
//    
//    private lazy var tableView: GenericTableView<ToDoTableViewCell, ToDo> = {
//        let sortD = [NSSortDescriptor(key: "title", ascending: true)]
//        let predicate = NSPredicate(format: "folder == %@", folder)
//        let dataProvider = DataProvider<ToDo>(managedObjectContext: CoreDataManager.shared.managedObjectContext, sortDescriptors: sortD, predicate: predicate)
//        let v = GenericTableView<ToDoTableViewCell, ToDo>(dataProvider: dataProvider) { (cell, todo) in
//            cell.model = todo
//        } selectionHandler: { (todo) in
//            print("\(todo.setup ?? "") selected")
//        }
//        return v
//    }()
////MARK: - Func addButton
//    private lazy var addNewItem: UIButton = {
//        let v = UIButton()
//        v.translatesAutoresizingMaskIntoConstraints = false
//        let config = UIImage.SymbolConfiguration(pointSize: 32.0, weight: .bold)
//        let image = UIImage(systemName: "plus", withConfiguration: config)
//        v.setImage(image, for: .normal)
//        v.tintColor = .white
//        v.backgroundColor = .blue
//        v.layer.cornerRadius = 10
//        v.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
//        v.addTarget(self, action: #selector(didTapApp(_:)), for: .touchUpInside)
//        return v
//    }()
//    init(folder: String) {
//        self.folder = folder
//        
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
////MARK: - viewDidLoad
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupView()
//        tableView.performFetch()
//    }
////MARK: - Func setupView
//    private func setupView() {
//        title = folder
//        view.addSubview(tableView)
//        view.addSubview(addNewItem)
//        
//        setupConstraints()
//    }
////MARK: - Func setupContraints
//    private func setupConstraints() {
//        //tableView
//        NSLayoutConstraint.activate([
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//        //addNew
//            NSLayoutConstraint.activate([
//                addNewItem.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//                addNewItem.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
//                addNewItem.widthAnchor.constraint(equalToConstant: 44),
//                addNewItem.heightAnchor.constraint(equalToConstant: 44)
//            ])
//    }
////MARK: - Objc didTapAdd
//    @objc private func didTapApp(_ sender: UIButton) {
//        let vc = AddNewItemViewController()
//        vc.delegate = self
//        present(vc, animated: true, completion: nil)
//    }
//}
////MARK: - Extension ToDoListViewController
//extension ToDoListViewController: AddNewItemViewControllerDelegate {
////MARK: - Func saveNewItem
//    func saveNewItem(item: String) {
//        CoreDataManager.shared.saveToDo(folder: folder, todoItem: item)
//        tableView.performFetch()
//    }
//}
