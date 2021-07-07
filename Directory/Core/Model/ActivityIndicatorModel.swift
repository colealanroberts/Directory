//
//  ActivityIndicatorModel.swift
//  Directory
//
//  Created by Cole Roberts on 2/19/21.
//

import Foundation

public final class ActivityIndicatorModel {
    let uuid = UUID().uuidString
}

// MARK: - Equatable
 
extension ActivityIndicatorModel: Equatable {
    public static func == (lhs: ActivityIndicatorModel, rhs: ActivityIndicatorModel) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}

// MARK: - Hashable

extension ActivityIndicatorModel: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}
