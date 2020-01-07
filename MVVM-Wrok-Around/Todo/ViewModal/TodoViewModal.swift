//
//  TodoViewModel.swift
//  MVVM-Wrok-Around
//
//  Created by Sultan Ali on 2020-01-06.
//  Copyright © 2020 Sultan Ali. All rights reserved.
//

import Foundation

/// To notify the completionf in the case of error or success
protocol TodoDelegate: class {
    func didReceive(data: Any?, error: Error?)
}


protocol TodoViewModel {
    var numberOfSection: Int { get }
    var todoCellViewModal: [TodoCellViewModel] { get }
    func numberOfCell(in section: Int) -> Int
    func viewModal(at indexPath: IndexPath) -> TodoCellViewModel
    func title(for section: Int) -> Int
    func allTodos() -> [Todo]
}

/// Todo View Model to have a seperate testable envirenment
class TodoViewModelImp {
    
    // MARK: - properties
    private var todosList = [Todo]()
    private var todoCellViewModels = [[TodoCellViewModel]]()
    weak var delegate: TodoDelegate?
    
    // Dependency Injection
    init(delegate: TodoDelegate) {
        self.delegate = delegate
        getAllTodo()
    }
    
    /// get all To list
    func getAllTodo() {
        Services.shared.todoManager.getTodList { [weak self] (results: [Todo]?, error) in
            if let err = error {
                DispatchQueue.main.async {
                    self?.delegate?.didReceive(data: nil, error: err)
                    return
                }
            }
            if let todos = results {
                self?.todosList = todos
                self?.createTodoListViewModels()
                DispatchQueue.main.async {
                    self?.delegate?.didReceive(data: self?.todosList, error: nil)
                }
            }
        }
    }
    
    private func createTodoListViewModels() {
        let cellModal = todosList.map({TodoCellViewModalImp(todo: $0)})
        self.todoCellViewModels = Dictionary(grouping: cellModal, by: { $0.userId }).sorted(by: { $0.key < $1.key }).map({ $0.value })
    }
    
    
    
}


// MARK: - TodoViewModel
extension TodoViewModelImp: TodoViewModel {
    
    func numberOfCell(in section: Int) -> Int {
        return todoCellViewModels[section].count
    }
    
    var numberOfSection: Int {
        return todoCellViewModels.count
    }
    
    func viewModal(at indexPath: IndexPath) -> TodoCellViewModel {
        return todoCellViewModels[indexPath.section][indexPath.row]
    }
    
    func title(for section: Int) -> Int {
        return todoCellViewModels[section][0].userId
    }
    
    func allTodos() -> [Todo] {
        return self.todosList
    }
    
    var todoCellViewModal: [TodoCellViewModel] {
        return Array(self.todoCellViewModels.joined())
    }
    
}
