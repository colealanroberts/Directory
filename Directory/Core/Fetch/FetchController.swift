//
//  FetchController.swift
//  Directory
//
//  Created by Cole Roberts on 2/17/21.
//

import Foundation

// MARK: - FetchControllerState

public enum FetchControllerState {
    case initial, fetching, complete
}

// MARK: - FetchControllerDelegate

public protocol FetchControllerDelegate: AnyObject {
    func fetchControllerDidUpdate<T>(_ fetchController: FetchController<T>, from fromState: FetchControllerState, error: Error?)
}

// MARK: - FetchController

public final class FetchController<T: FetchableModel> {
    
    // MARK: - Properties
    
    public weak var delegate: FetchControllerDelegate?
    
    public private(set) var data: [T]
    public private(set) var state: FetchControllerState

    // NARK: - Init
    
    public init() {
        self.data = []
        self.state = .initial
    }
    
    // MARK: - Public
    
    public func fetch(delay: TimeInterval = 0.0) {
        transition(to: .fetching)
    
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            ModelController.shared.request(type: T.self) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let data):
                    self.data = data.sorted(by: <)
                    self.transition(to: .complete)
                    
                case .failure(let error):
                    self.transition(to: .complete, error: error)
                }
            }
        }
    }
    
    // MARK: - Private
    
    private func transition(to state: FetchControllerState, error: Error? = nil) {
        let previousState = self.state
        self.state = state
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.delegate?.fetchControllerDidUpdate(self, from: previousState, error: error)
        }
    }
}
