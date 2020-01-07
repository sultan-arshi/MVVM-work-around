//
//  UIColor+Extensions.swift
//  MVVM-Wrok-Around
//
//  Created by Sultan Ali on 2020-01-06.
//  Copyright © 2020 Sultan Ali. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
         self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    class var mainTextBlue: UIColor {
        return UIColor(r: 7, g: 71, b: 81)
    }
    
    class var highlighColor: UIColor {
        return UIColor(r: 50, g: 199, b: 241)
    }
}
