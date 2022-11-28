//
//  ViewController.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 11/24/22.
//

import UIKit

class FirstScreen: UIViewController {
//MARK: - Property
    let nextButton = CustomButton()

//MARK: - lazy label
    private lazy var label: UILabel = {
        let label  = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Loading Jokes"
        label.sizeToFit()
        return label
    }()//endlabel
//MARK: - Refresh Button
    private lazy var refreshButton: UIButton = {
        let button = UIButton(frame: .zero)
        let image = UIImage(systemName: "arrow.clockwise")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(loadData), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()//refreshbutton
//MARK: - URL Session
    private var dataTask: URLSessionDataTask?
    
//MARK: - Holding Variable for Jokes
    private var joke: [Jokes]? {
        didSet {
            guard let joke = joke?.randomElement() else { return }
            label.text = "\(joke.setup)\n\(joke.punchline)"
            label.sizeToFit()
        }
    }
    
    
//MARK: - viewDidLoad Function
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtomButtonConstraints()
        addActionToButtomButton()
        nextButton.setTitle("Favorite Jokes", for: .normal)
        view.backgroundColor = .systemBackground
        title = "Jokes Randomizer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
//MARK: - Views
        view.addSubview(label)
        view.addSubview(refreshButton)
        addConstraints()
        loadData()
    }
    //MARK: - Object Load Data
        @objc private func loadData() {
            guard let url = URL(string: "https://official-joke-api.appspot.com/random_ten") else {
                    return
            }
            dataTask?.cancel()
            dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                if let decodedData = try? JSONDecoder().decode([Jokes].self, from: data) {
                    DispatchQueue.main.async {
                        self.joke = decodedData
                    }
                }
            }
            dataTask?.resume()
        }
        

//MARK: - Constraints for Views in Jokes and Refresh Button
    private func addConstraints() {
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 200).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        refreshButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        refreshButton.leadingAnchor.constraint(equalTo: label.leadingAnchor).isActive = true
        
    }
    
//MARK: - Setup Botton Constraints
    func setupButtomButtonConstraints() {
        view.addSubview(nextButton)
       
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 280).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
        
    }

//MARK: - Add Action to Bottom Button
    func addActionToButtomButton() {
        nextButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
    }
    
//MARK: - Object Next Screen
    @objc func goToNextScreen() {
        let nextScreen = SecondScreen()
        navigationController?.pushViewController(nextScreen, animated: true)
    }
}

