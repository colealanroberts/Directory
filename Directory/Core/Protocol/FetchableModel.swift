//
//  FetchableModel.swift
//  Directory
//
//  Created by Cole Roberts on 2/18/21.
//

import Foundation

// MARK: - FetchableModel

public protocol FetchableModel: Codable, Hashable, Comparable {
    
    /// The path to the model resource
    /// i.e. "employees, this may differ from the rootKey
    static var path: String { get }
    
    /// The root key of the returned dictionary
    /// i.e. "employees
    static var rootKey: String { get }
}
