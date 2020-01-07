//
//  TodoListViewModals.swift
//  MVVM-Wrok-Around
//
//  Created by Sultan Ali on 2020-01-06.
//  Copyright © 2020 Sultan Ali. All rights reserved.
//

import Foundation
import UIKit

protocol TodoCellViewModel {
    var isCompleted: Bool { get }
    var accessryType: UITableViewCell.AccessoryType { get }
    var title: String { get }
    var userId: Int { get }
    var id: Int { get }
}

class TodoCellViewModalImp: Equatable {
    
    // MARK: - Constants
    private let todo: Todo
    
    // Dependency Injection
    init(todo: Todo) {
        self.todo = todo
    }
    
    
    static func == (lhs: TodoCellViewModalImp, rhs: TodoCellViewModalImp) -> Bool {
        return lhs.id == rhs.id
    }
}

extension TodoCellViewModalImp: TodoCellViewModel {
    
    var isCompleted: Bool {
        return todo.completed
    }
    
    var accessryType: UITableViewCell.AccessoryType {
        return isCompleted == true ? .detailDisclosureButton : .none
    }
    
    var title: String {
        return todo.title
    }
    
    var userId: Int {
        return todo.userId
    }
    
    var id: Int {
        return todo.id
    }
}
