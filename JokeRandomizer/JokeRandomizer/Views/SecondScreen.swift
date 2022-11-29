//
//  SecondScreen.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 11/24/22.
//

import UIKit

class SecondScreen: UIViewController {
//MARK: - Property
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        view.backgroundColor = .systemBackground
        title = "Favorite Jokes"
        
    }
//MARK: - Configure Table View
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegate()
        tableView.rowHeight = 100
        tableView.pin(to: view)
    }
//MARK: - Table View Delegate
    func setTableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension SecondScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection indexPath: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
