//
//  TodoViewController.swift
//  MVVM-Wrok-Around
//
//  Created by Sultan Ali on 2020-01-06.
//  Copyright © 2020 Sultan Ali. All rights reserved.
//

import UIKit

class TodoViewController: BaseViewController {

    // MARK: - properties
    @IBOutlet weak var tableView: UITableView!
    var viewModel: TodoViewModel!
    
    // MARK: - contants
    let cellIdentifire = "cell"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showHUD()
        self.tableViewSetup()
    }
    
    func tableViewSetup() {
        tableView.register(TodoTableViewCell.self, forCellReuseIdentifier: cellIdentifire)
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .mainTextBlue
        tableView.backgroundColor = UIColor(r: 12, g: 47, b: 57)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
    }

}

// MARK: - TodoDelegate
extension TodoViewController: TodoDelegate {
    
    func didReceive(data: Any?, error: Error?) {
        self.hideHUD()
        if let err = error {
            self.showAlert(title: "Ops!", message: err.localizedDescription)
            return
        }
        self.tableView.reloadData()
    }
    
}

// MARK: - Storyboarded
extension TodoViewController: Storyboarded {
    static var storyBoardName: String {
        return  "Main"
    }
}


// MARK: - UITableViewDataSource, UITableViewDelegate
extension TodoViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCell(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath) as! TodoTableViewCell
        cell.viewModal = viewModel.viewModal(at: indexPath)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "User ID: \(viewModel.title(for: section))"
    }
}

