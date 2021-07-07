//
//  ModelControllerTests.swift
//  DirectoryTests
//
//  Created by Cole Roberts on 2/18/21.
//

import XCTest

@testable import Directory

// MARK: - TimeInterval

fileprivate extension TimeInterval {
    static let standardTimeout: TimeInterval = 10
}

// MARK: - ModelControllerTests

class ModelControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetEmployees() throws {
        let expectation = self.expectation(description: #function)
        
        ModelController.shared.request(type: EmployeeModel.self) { (result) in
            switch result {
            case .success(let employees):
                XCTAssert(!employees.isEmpty)
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: .standardTimeout, handler: nil)
    }
    
    func testGetMalformedEmployees() throws {
        let expectation = self.expectation(description: #function)
        
        ModelController.shared.request(type: MalformedEmployeeModel.self) { (result) in
            switch result {
            case .failure( _):
                XCTAssertTrue(true)
                expectation.fulfill()
                
            default:
                XCTFail()
            }
        }
        
        waitForExpectations(timeout: .standardTimeout, handler: nil)
    }
    
    func testGetEmptyEmployees() throws {
        let expectation = self.expectation(description: #function)
        
        ModelController.shared.request(type: EmptyEmployeeModel.self) { (result) in
            switch result {
            case .success(let employees):
                XCTAssertTrue(employees.isEmpty)
                expectation.fulfill()
            
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: .standardTimeout, handler: nil)
    }
}
