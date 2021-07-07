//
//  EmployeeModel.swift
//  Directory
//
//  Created by Cole Roberts on 2/17/21.
//

import Foundation

// MARK: - EmployeeType

enum EmployeeType: String, Codable {
    case fulltime, parttime, contractor, unknown
    
    init?(rawValue: String) {
        switch rawValue {
        case "FULL_TIME":
            self = .fulltime
        
        case "PART_TIME":
            self = .parttime
            
        case "CONTRACTOR":
            self = .contractor
            
        default:
            self = .unknown
        }
    }
}

// MARK: - EmployeeModel

public class EmployeeModel: FetchableModel {
    
    public class var path: String {
        return "employees"
    }
    
    public class var rootKey: String {
        return "employees"
    }
    
    /// The unique identifier for the employee. Represented as a UUID.
    let uuid: String
    
    /// The full name of the employee.
    let fullName: String
    
    /// The phone number of the employee, sent as an unformatted string (eg, 5556661234).
    let phoneNumber: String?
    
    /// The email address of the employee.
    let emailAddress: String
    
    /// A short, tweet-length (~300 chars) string that the employee provided to describe themselves.
    let biography: String?
    
    /// The URL of the employee’s small photo. Useful for list view.
    let photoUrlSmall: String?
    
    /// The URL of the employee’s full-size photo.
    let photoUrlLarge: String?
    
    /// The team they are on, represented as a human readable string.
    let team: String
    
    /// How the employee is classified.
    let employeeType: EmployeeType
}

// MARK: - Comparable

extension EmployeeModel: Comparable {
    public static func < (lhs: EmployeeModel, rhs: EmployeeModel) -> Bool {
        return lhs.fullName < rhs.fullName
    }
    
    public static func == (lhs: EmployeeModel, rhs: EmployeeModel) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}

// MARK: - Hashable

extension EmployeeModel: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}
