//
//  ToDo.swift
//  MVVM-Wrok-Around
//
//  Created by Sultan Ali on 2020-01-06.
//  Copyright © 2020 Sultan Ali. All rights reserved.
//

import Foundation


struct Todo: Decodable {
    
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
    
}
