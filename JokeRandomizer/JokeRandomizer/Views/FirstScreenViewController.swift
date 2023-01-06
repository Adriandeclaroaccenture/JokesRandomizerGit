//
//  ViewController.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 11/24/22.
//

import UIKit
import Combine
import CoreData

class FirstScreenViewController: UIViewController {
//MARK: - Property
    private let jokesVM = JokesViewModel()
    private let jokesCoreData = JokesDataManager()
    private let input: PassthroughSubject<JokesViewModel.Input, Never> = .init()
    private let refreshButtonView, favoriteButtonView, listButtonView: CustomButton
    private var cancellables = Set<AnyCancellable>()
    private var setupLabelView, punchlineLabelView: CustomLabel
//MARK: - Initializer
    init() {
        refreshButtonView = CustomButton(styles: jokesVM.refreshButtonStyle)
        favoriteButtonView = CustomButton(styles: jokesVM.favoriteButtonStyle)
        listButtonView = CustomButton(styles: jokesVM.listButtonStyle)
        setupLabelView = CustomLabel(styles: jokesVM.setupLabelStyle)
        punchlineLabelView = CustomLabel(styles: jokesVM.punchlineLabelStyle)
        super.init(nibName: nil, bundle: nil)
        refreshButtonView.addTarget(self, action: #selector(loadButtonJokes), for: .touchUpInside)
        favoriteButtonView.addTarget(self, action: #selector(tapFavorite), for: .touchUpInside)
        favoriteButtonView.addTarget(self, action: #selector(showAlertMessage), for: .touchUpInside)
        listButtonView.addTarget(self, action: #selector(tapList), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: listButtonView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: - StackView
//    private let stackView: UIStackView = {
//        let stack = UIStackView()
//        stack.spacing = 25.0
//        stack.axis = .vertical
//        stack.alignment = .center
//        stack.distribution = .equalSpacing
//        return stack
//    }()
//MARK: - Navigation
    private func navigationJokesItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet.circle"), style: .plain, target: self, action: #selector(tapList))
    }
//MARK: - loader
    let loader: UIActivityIndicatorView = {
        var loader = UIActivityIndicatorView(frame: .zero)
        loader.style = .medium
        return loader
    }()
    
//MARK: - viewDidLoad Function
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Jokes Randomizer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        addConstraints()
        navigationJokesItem()
        favoriteButtonConstriants()
        setupBinders()
    }
//MARK: - Private func setupBinders

    private func setupBinders() {
        let output = jokesVM.getTransFormJokes(input: input.eraseToAnyPublisher())
        output.sink { [weak self] event in
            switch event{
            case .fetchJokeSucceed(let joke):
                guard let joke = joke.randomElement() else {return}
                self?.setupLabelView.text = joke.setup
                self?.punchlineLabelView.text = joke.punchline
            case .fetchJokeDidFail(let error):
                self?.setupLabelView.text = error.localizedDescription
                self?.punchlineLabelView.text = error.localizedDescription
            }
        }
        .store(in: &cancellables)
    }
//MARK: - Constraints for Views in Jokes and Refresh Button
    private func addConstraints() {
   
        setupLabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        setupLabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        setupLabelView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        punchlineLabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        punchlineLabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        punchlineLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 40).isActive = true
        punchlineLabelView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40).isActive = true
        refreshButtonView.topAnchor.constraint(equalTo: setupLabelView.bottomAnchor, constant: 50).isActive = true
        refreshButtonView.leadingAnchor.constraint(equalTo: setupLabelView.leadingAnchor).isActive = true
    }
//MARK: - Favorite Button Constraints
    func favoriteButtonConstriants() {

        NSLayoutConstraint.activate([
                    favoriteButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    favoriteButtonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
                    favoriteButtonView.widthAnchor.constraint(equalToConstant: 44),
                    favoriteButtonView.heightAnchor.constraint(equalToConstant: 44)
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
        input.send(.refreshButtonTap)
    }
//MARK: - obj func tapFavorite
    @objc func tapFavorite() {
        jokesCoreData.addJoke(setup: setupLabelView.text!, punch: punchlineLabelView.text!)
        debugPrint("Added Favorites Joke")
    }
//MARK: - objc func tapList
    @objc func tapList() {
        let listVC = JokeListFavoriteViewController()
        navigationController?.pushViewController(listVC, animated: true)
    }
//MARK: - Func loadView
    override func loadView() {
        super.loadView()
//        stackView,
        [setupLabelView,punchlineLabelView,loader,favoriteButtonView,refreshButtonView].forEach { item in
            self.view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
    }
//MARK: - Func viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        input.send(.viewDidAppear)
    }
}
