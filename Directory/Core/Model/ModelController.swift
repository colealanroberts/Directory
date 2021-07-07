//
//  ModelController.swift
//  Directory
//
//  Created by Cole Roberts on 2/17/21.
//

import Foundation

// MARK: - DecodingError

public enum DecodingError: Error {
    case noMatchingKey
}

// MARK: - ModelController

public final class ModelController {
    
    // MARK: - Singleton
    
    public static let shared = ModelController()
    
    // MARK: - Properties
    
    private lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return decoder
    }()
    
    // MARK: - Init
    
    private init() {}
    
    // MARK: - Public Methods
    
    public func request<T: FetchableModel>(type: T.Type, _ completion: @escaping(Result<[T], Error>) -> ()) {
        guard let url = URL(string: "\(Endpoint.base)\(T.path).json") else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let results = try self.decoder.decode([String: [T]].self, from: data)
                guard let models = results[T.rootKey] else {
                    throw DecodingError.noMatchingKey
                }
                
                completion(.success(models))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
