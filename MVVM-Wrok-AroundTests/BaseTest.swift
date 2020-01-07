//
//  BaseTest.swift
//  MVVM-Wrok-AroundUITests
//
//  Created by Sultan Ali on 2020-01-07.
//  Copyright © 2020 Sultan Ali. All rights reserved.
//

import XCTest
@testable import MVVM_Wrok_Around


/// Configuration before the test start and getting all todo list. It will get all tod list and
class BaseTest: XCTestCase {
    
    var todoViewModal: TodoViewModel!
    private var todoExpectation: XCTestExpectation!
    
    let timeOut: TimeInterval = 15
    
    
    override func setUp() {
        super.setUp()
        todoViewModal = TodoViewModelImp(delegate: self)
        todoExpectation = XCTestExpectation(description: "expectation for getting all to dos")
        wait(for: [todoExpectation], timeout: timeOut)
    }
    
    
    
}

extension BaseTest: TodoDelegate {
    
    func didReceive(data: Any?, error: Error?) {
        if let err = error {
            XCTFail("Test Failed due to: \(err.localizedDescription)")
            todoExpectation.fulfill()
            return
        }
        todoExpectation.fulfill()
        
    }
    
}
