//
//  JokesListFavorite.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 12/1/22.
//

import UIKit
import CoreData

class JokesListFavorite: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    private var model = [JokeListItem]()
//MARK: - viewDidLoad
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        title = "Favorite Jokes"
    }
//MARK: - Func tableView numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
//MARK: - Func tableView cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = model[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        cell.setup.text = model.setup
        cell.punchline.text = model.punchline
        return cell
    }
//MARK: - Func tableView editingStyleForRowAt
    func tableView(_ tableView: UITableView,  editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
//MARK: - Func tableView
    func  tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            let model = model[indexPath.row]
            self.deleteJoke(item: model)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            tableView.endUpdates()
        }
    }
//MARK: - Func getAllJokes
    func getAllJokes() {
        do {
            model = try context.fetch(JokeListItem.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            //error
        }
    }
//MARK: - Func AddJoke
    func addJoke(setup: String, punch: String) {
        let newJoke = JokeListItem(context: context)
        newJoke.setup = setup
        newJoke.punchline = punch
        
        saveData()
    }
//MARK: - Func deleteJoke
    func deleteJoke(item: JokeListItem) {
        context.delete(item)
        
        saveData()
    }
//MARK: - Func saveData
    func saveData() {
        do {
            try context.save()
            getAllJokes()
        } catch {
            
        }
    }
}

