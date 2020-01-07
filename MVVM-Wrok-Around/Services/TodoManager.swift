//
//  TodoManager.swift
//  MVVM-Wrok-Around
//
//  Created by Sultan Ali on 2020-01-06.
//  Copyright © 2020 Sultan Ali. All rights reserved.
//

import Foundation

/// Todo list Protocol to manage the all TodoList
protocol TodoModule {
    func getTodList<T: Decodable>(callBack: @escaping (T?, Error?) -> ())
}


/// Managing Todo List: get all TodoList, also will provide the functionality for authentication if any and session but now there is no
class TodoManager: TodoModule {
    
    private let todoManagerServices = TodoManagerServices()
    
    /// get all To do list
    /// - Parameter callBack: to delever the results.
    func getTodList<T>(callBack: @escaping (T?, Error?) -> ()) where T : Decodable {
        self.todoManagerServices.getTodList().execute(callBack: callBack)
    }
    
    
}

/// To Manage the
fileprivate class TodoManagerServices {
    
    func getTodList() -> Call {
        return Call(url: "https://jsonplaceholder.typicode.com/todos")
    }
}

fileprivate class Call {
    
    private let url: String
    private let httpMethod: String?
    private let params: [String: Any]?
    
    init(url: String, httpMethod: String? = nil, params: [String: Any]? = nil) {
        self.url = url
        self.httpMethod = httpMethod
        self.params = params
    }
    
    /// excute url request and response for the Decodable protocol
    func execute<T: Decodable>(callBack: @escaping (T?, Error?) ->() ) {
        
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                callBack(nil, err)
                print("Failed to fetch courses:", err)
                return
            }
            // check response
            guard let data = data else { return }
            do {
                let courses = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    callBack(courses, nil)
                }
            } catch let jsonErr {
                callBack(nil, jsonErr)
            }
            }.resume()
    }
}

