//
//  ViewController.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 11/24/22.
//

import UIKit

class FirstScreenViewController: UIViewController {
//MARK: - Property
    private let jokesVM = JokesViewModel()
    var jokes: JokesModel!
    var customButton = CustomButton()
    var addFavButton = addFavoriteButton()
    
    
//MARK: - setupLabel
    private let setupLabel: UILabel = {
        let stpLabel = UILabel(frame: .zero)
        stpLabel.frame = CGRect(x: 10.0, y: 40.0, width: UIScreen.main.bounds.size.width - 20.0, height: 100.0)
        stpLabel.lineBreakMode = .byWordWrapping
        stpLabel.translatesAutoresizingMaskIntoConstraints = false
        stpLabel.numberOfLines = 0
        stpLabel.textAlignment = .left
        stpLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        stpLabel.text = "Loading Jokes"
        stpLabel.sizeToFit()
        return stpLabel
    }()
//MARK: - punchLineLabel
    private let punchLineLabel: UILabel = {
        let pnchlLabel = UILabel(frame: .zero)
        pnchlLabel.frame = CGRect(x: 10.0, y: 40.0, width: UIScreen.main.bounds.size.width - 20.0, height: 100.0)
        pnchlLabel.translatesAutoresizingMaskIntoConstraints = false
        pnchlLabel.numberOfLines = 0
        pnchlLabel.lineBreakMode = .byWordWrapping
        pnchlLabel.textAlignment = .left
        pnchlLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        pnchlLabel.text = " "
        pnchlLabel.sizeToFit()
        return pnchlLabel
    }()
//MARK: - Refresh Button
    private lazy var refreshButton: UIButton = {
        let button = CustomButton(frame: .zero)
        let image = UIImage(systemName: "arrow.clockwise.circle.fill")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(loadButtonJokes), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()//refreshbutton
//MARK: - private let favoriteButton
    private let favoriteButton: UIButton = {
        
        let faveButton = addFavoriteButton()
        faveButton.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 32.0, weight: .bold)
        let image = UIImage(systemName: "plus", withConfiguration: config)
        faveButton.setImage(image, for: .normal)
        faveButton.tintColor = .white
        faveButton.backgroundColor = .blue
        faveButton.layer.cornerRadius = 10
        faveButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        faveButton.addTarget(self, action: #selector(tapFavorite), for: .touchUpInside)
        faveButton.addTarget(self, action: #selector(showAlertMessage), for: .touchUpInside)
        return faveButton
    }()
//MARK: - Navigation
    private func navigationJokesItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet.circle"), style: .plain, target: self, action: #selector(tapList))
    }
    
//MARK: - viewDidLoad Function
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Jokes Randomizer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
//MARK: - Views
        view.addSubview(setupLabel)
        view.addSubview(refreshButton)
        view.addSubview(favoriteButton)
//       refreshButtonConstraints()
        addConstraints()
        navigationJokesItem()
//        addFavButton
        favoriteButtonConstriants()
        Task {
            await populateJokes()
        }
    }
    
//MARK: - Private joeks
    private func populateJokes() async {
       await jokesVM.getJokesVM(url: Constants.Urls.urlString)
        guard let joke = jokesVM.joke.randomElement() else { return }
        setupLabel.text = """
                \(joke.setup)\n
                \(joke.punchline)
                """
        setupLabel.sizeToFit()
    }
    
//MARK: - Constraints for Views in Jokes and Refresh Button
    private func addConstraints() {
        //newconstraint
//        setupLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
//        setupLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
//        setupLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//
//        punchLineLabel.topAnchor.constraint(equalTo: setupLabel.bottomAnchor, constant: 10).isActive = true
//        punchLineLabel.leadingAnchor.constraint(equalTo: setupLabel.leadingAnchor).isActive = true
//
//        refreshButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
//        refreshButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
//        refreshButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
//        refreshButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //old constraints
        setupLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        setupLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        setupLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        refreshButton.topAnchor.constraint(equalTo: setupLabel.bottomAnchor, constant: 10).isActive = true
        refreshButton.leadingAnchor.constraint(equalTo: setupLabel.leadingAnchor).isActive = true
        

    }

//MARK: - Favorite Button Constraints
    func favoriteButtonConstriants() {

        NSLayoutConstraint.activate([
                    favoriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    favoriteButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
                    favoriteButton.widthAnchor.constraint(equalToConstant: 44),
                    favoriteButton.heightAnchor.constraint(equalToConstant: 44)
                ])
    }

//MARK: - faveJoke Alert Message
    @objc func showAlertMessage() {

        let alert = UIAlertController(title: "Save Favorite Joke", message: "Sucessfuly Saved", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
            print("tapped Dismiss")
        }))
        present(alert, animated: true)
    }
//MARK: - Laod DAta for Jokes
    @objc func loadButtonJokes() {
        Task {
            await populateJokes()
        }
    }
//MARK: - obj func tapFavorite
    @objc func tapFavorite() {
        let listVC = JokeListFavoriteViewController()
        listVC.addJoke(setup: setupLabel.text!, punch: punchLineLabel.text!)
    }
//MARK: - objc func tapList
    @objc func tapList() {
        let listVC = JokeListFavoriteViewController()
        navigationController?.pushViewController(listVC, animated: true)
    }
}

