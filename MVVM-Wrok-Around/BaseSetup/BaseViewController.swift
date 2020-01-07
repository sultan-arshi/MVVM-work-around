//
//  BaseViewController.swift
//  MVVM-Wrok-Around
//
//  Created by Sultan Ali on 2020-01-06.
//  Copyright © 2020 Sultan Ali. All rights reserved.
//

import Foundation
import  UIKit


class BaseViewController: UIViewController {
    
    // MARK: - properties
    private var container = UIView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavBar()
    }
    
    fileprivate func setupNavBar() {
        navigationItem.title = "Courses"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .yellow
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(r: 50, g: 199, b: 242)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: false)
    }
    
    func showHUD() {
        container = UIView(frame: CGRect(x: view.frame.midX - 90, y: view.frame.midY - 25, width: 180, height: 50))
        container.backgroundColor = .white
        container.alpha = 0.8
        container.layer.cornerRadius = 10
        
        //Here the spinnier is initialized
        let activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        activityView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityView.startAnimating()
        
        let textLabel = UILabel(frame: CGRect(x: 60, y: 0, width: 200, height: 50))
        textLabel.textColor = .gray
        textLabel.text = "Saving Photo"
        
        container.addSubview(activityView)
        container.addSubview(textLabel)
        
        view.addSubview(container)
    }
    
    func hideHUD() {
        container.removeFromSuperview()
    }
}
