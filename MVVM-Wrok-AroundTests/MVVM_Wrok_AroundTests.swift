//
//  MVVM_Wrok_AroundTests.swift
//  MVVM-Wrok-AroundTests
//
//  Created by Sultan Ali on 2020-01-06.
//  Copyright © 2020 Sultan Ali. All rights reserved.
//

import XCTest
@testable import MVVM_Wrok_Around

class MVVM_Wrok_AroundTests: BaseTest {

    override func setUp() {
        super.setUp()
    }

    func testForCompletedTodo() {
        XCTAssertNotEqual(self.todoViewModal.todoCellViewModal.count, 0)
        if let completedTodo = self.todoViewModal.todoCellViewModal.first(where: { $0.isCompleted }) {
            XCTAssertEqual(completedTodo.accessryType, .detailDisclosureButton)
            XCTAssertNotNil(completedTodo.id)
            XCTAssertNotNil(completedTodo.title)
            XCTAssertNotNil(completedTodo.userId)
        }
        
    }
    
    func testForInCompletedTodo() {
        XCTAssertNotEqual(self.todoViewModal.todoCellViewModal.count, 0)
        if let inCompletedTodo = self.todoViewModal.todoCellViewModal.first(where: { !$0.isCompleted }) {
            XCTAssertEqual(inCompletedTodo.accessryType, .none)
            XCTAssertNotNil(inCompletedTodo.id)
            XCTAssertNotNil(inCompletedTodo.title)
            XCTAssertNotNil(inCompletedTodo.userId)
        }
    }
}
