//
//  EmptyResultModel.swift
//  Directory
//
//  Created by Cole Roberts on 2/19/21.
//

import Foundation

public final class EmptyResultModel {
    let uuid = UUID().uuidString
}

// MARK: - Equatable

extension EmptyResultModel: Equatable {
    public static func == (lhs: EmptyResultModel, rhs: EmptyResultModel) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}

// MARK: - Hashable

extension EmptyResultModel: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}
