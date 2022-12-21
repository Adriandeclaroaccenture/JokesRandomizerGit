//
//  JokesViewModel.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 11/24/22.
//


import Foundation
import Combine

class JokesViewModel {
    private var cancellables = Set<AnyCancellable>()
    var refreshButtonStyle, favoriteButtonStyle, listButtonStyle: CustomButton.ButtonTypes
    var setupLabelStyle, punchlineLabelStyle: CustomLabel.LabelTypes
    
    enum Input {
        case viewDidAppear
        case refreshButtonTap
    }

    enum Output {
        case fetchJokeDidFail(error: Error)
        case fetchJokeSucceed(jokes: [JokesModel])

    }
    
    private let jokeServiceType: JokesServiceType
    private let output: PassthroughSubject<Output, Never> = .init()
    
    init(jokeServiceType: JokesServiceType = WebService()) {
        self.jokeServiceType = jokeServiceType
        refreshButtonStyle = .refreshButton
        favoriteButtonStyle = .favoriteButton
        listButtonStyle = .listButton
        setupLabelStyle = .setupLabel
        punchlineLabelStyle = .punchlineLabel
    }
//MARK: - Func getRandomJokes
    func getRandomJokes() {
        jokeServiceType.getRandomJokes().sink { [weak self] completion in
            switch completion {
                case .failure(let errror):
                    self?.output.send(.fetchJokeDidFail(error: errror))
                case .finished:
                    debugPrint("Random Jokes Fetch")
                }
            } receiveValue: { [weak self] joke in
                        self?.output.send(.fetchJokeSucceed(jokes: joke))
        } .store(in: &cancellables)
    }
//MARK: - Func getTransformJokes
    func getTransFormJokes(input: AnyPublisher<Input, Never>) -> AnyPublisher<Output, Never> {
        input.sink { [weak self] event in
            switch event {
            case .refreshButtonTap, .viewDidAppear:
                self?.getRandomJokes()
            }
        } .store(in: &cancellables)
        return output.eraseToAnyPublisher()
    }
}
