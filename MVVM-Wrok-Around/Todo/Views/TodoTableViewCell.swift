//
//  TableViewCell.swift
//  MVVM-Wrok-Around
//
//  Created by Sultan Ali on 2020-01-06.
//  Copyright © 2020 Sultan Ali. All rights reserved.
//

import Foundation
import UIKit

class TodoTableViewCell: UITableViewCell {
    
    var viewModal: TodoCellViewModel! {
        didSet {
            textLabel?.text = viewModal.title
            detailTextLabel?.text = "ID: \(viewModal.id)"
            accessoryType = viewModal.accessryType
        }
    }
    
    // MARK: - override
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        contentView.backgroundColor = isHighlighted ? .highlighColor : .white
        textLabel?.textColor = isHighlighted ? UIColor.white : .mainTextBlue
        detailTextLabel?.textColor = isHighlighted ? UIColor.white : .mainTextBlue
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        // cell customization
        textLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        textLabel?.numberOfLines = 0
        
        detailTextLabel?.font = UIFont.systemFont(ofSize: 18)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
