//
//  TableCellIdentifiable.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 28.06.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import UIKit

/**
 Table Cells who conform this protocol can be identified by their class names and dequeueable.
 */
public protocol TableCellIdentifiable: UITableViewCell { }

public extension TableCellIdentifiable {
    
    /**
     Returns class name as identifier.
     - returns: Identifier which can be used instead of `reuseIdentifier`.
     */
    static func identifier() -> String {
        return String(describing: self)
    }
    
    /**
     Initializes new cell for the specified table with the given indexPath.
     - parameter tableView: Cell should be registered first before use this method.
     - parameter indexPath: `IndexPath` for the cell.
     - returns: New Cell
     */
    static func initialize(for tableView: UITableView, indexPath: IndexPath, reusableIdentifier: String? = nil) -> Self {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier ?? identifier(), for: indexPath)
        return cell as! Self
    }
    
    /**
     Registers cell automatically to given tableview.
     - parameter tableView: `UITableView`
     */
    static func register(to tableView: UITableView?) {
        tableView?.register(nibName: identifier())
    }
}

extension UITableViewCell: TableCellIdentifiable { }
