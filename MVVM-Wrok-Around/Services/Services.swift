//
//  Services.swift
//  MVVM-Wrok-Around
//
//  Created by Sultan Ali on 2020-01-06.
//  Copyright © 2020 Sultan Ali. All rights reserved.
//

import Foundation

/// Singlton Service to provide all api calls
class Services {
    
    // MARK: - Static
    static let shared = Services()
    
    
    /// MARK: - Private constructor
    private init() {}
    
    
    /// MARK: - Public
    let todoManager = TodoManager()
    
}
