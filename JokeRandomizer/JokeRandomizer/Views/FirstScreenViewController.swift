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
    private var cancellables = Set<AnyCancellable>()
    private let refreshButtonView, favoriteButtonView, listButtonView: CustomButton
    private var setupLabelView, punchlineLabelView: CustomLabel
//    var customButton = CustomButton()
//    var addFavButton = AddFavoriteButton()

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
    
    
    
//MARK: - setupLabel
//    private let setupLabel: UILabel = {
//        let stpLabel = UILabel(frame: .zero)
//        stpLabel.frame = CGRect(x: 10.0, y: 40.0, width: UIScreen.main.bounds.size.width - 20.0, height: 100.0)
//        stpLabel.lineBreakMode = .byWordWrapping
//        stpLabel.translatesAutoresizingMaskIntoConstraints = false
//        stpLabel.numberOfLines = 0
//        stpLabel.textAlignment = .left
//        stpLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
//        stpLabel.text = "Loading Jokes"
//        stpLabel.sizeToFit()
//        return stpLabel
//    }()
//MARK: - punchLineLabel
//    private let punchLineLabel: UILabel = {
//        let pnchlLabel = UILabel(frame: .zero)
//        pnchlLabel.frame = CGRect(x: 10.0, y: 40.0, width: UIScreen.main.bounds.size.width - 20.0, height: 100.0)
//        pnchlLabel.translatesAutoresizingMaskIntoConstraints = false
//        pnchlLabel.numberOfLines = 0
//        pnchlLabel.lineBreakMode = .byWordWrapping
//        pnchlLabel.textAlignment = .left
//        pnchlLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
//        pnchlLabel.text = " "
//        pnchlLabel.sizeToFit()
//        return pnchlLabel
//    }()
//MARK: - Refresh Button
//    private lazy var refreshButton: UIButton = {
//        let button = UIButton()
//        let image = UIImage(systemName: "arrow.clockwise.circle.fill")
//        button.setImage(image, for: .normal)
//        button.addTarget(self, action: #selector(loadButtonJokes), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()//refreshbutton
//MARK: - private let favoriteButton
//    private let favoriteButton: UIButton = {
//
//        let faveButton = AddFavoriteButton()
//        faveButton.translatesAutoresizingMaskIntoConstraints = false
//        let config = UIImage.SymbolConfiguration(pointSize: 32.0, weight: .bold)
//        let image = UIImage(systemName: "plus", withConfiguration: config)
//        faveButton.setImage(image, for: .normal)
//        faveButton.tintColor = .white
//        faveButton.backgroundColor = .blue
//        faveButton.layer.cornerRadius = 10
//        faveButton.layer.borderWidth = 1.5
//        faveButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
//        faveButton.addTarget(self, action: #selector(tapFavorite), for: .touchUpInside)
//        faveButton.addTarget(self, action: #selector(showAlertMessage), for: .touchUpInside)
//        return faveButton
//    }()
//MARK: - StackView
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 25.0
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        return stack
    }()
    
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
        
//        view.addSubview(setupLabel)
//        view.addSubview(refreshButton)
//        view.addSubview(favoriteButton)
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
//            case .toggleButton(let isEnabled):
//                self?.refreshButtonView.isEnabled = isEnabled
//            case .toggleLoading(let loading):
//                loading ? self?.loader.startAnimating() : self?.loader.stopAnimating()
//                if(loading == false){
//                    self?.setupLabelView.isHidden = false
//                    self?.punchlineLabelView.isHidden = false
//                    self?.loader.isHidden = true
//                }
                
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
        [stackView,setupLabelView,punchlineLabelView,loader,favoriteButtonView,refreshButtonView].forEach { item in
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

