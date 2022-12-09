////
////  JokeListFavorite.swift
////  JokeRandomizer
////
////  Created by john.adrian.de.claro on 12/2/22.
////
//
import UIKit
import CoreData

class JokeListFavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(CustomCellTableViewCell.self, forCellReuseIdentifier: CustomCellTableViewCell.identifier)
        return table
    }()
    
    private let jokesCoreData = JokesDataManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
//        title = "Favorite Jokes"
        view.addSubview(tableView)
        jokesCoreData.getAllJokes()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
//        tableView.estimatedRowHeight = 55.0
        tableView.register(CustomCellTableViewCell.self, forCellReuseIdentifier: "customCell")
        tableView.rowHeight = 100
        tableView.tableFooterView = UIView()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        title = "Favorite Jokes"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokesCoreData.jokesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = jokesCoreData.jokesData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCellTableViewCell
        cell.setup.text = model.setup
        cell.punchline.text = model.punchline
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func  tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            let model = jokesCoreData.jokesData[indexPath.row]
            jokesCoreData.deleteJoke(item: model)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            tableView.endUpdates()
        }
    }
}
