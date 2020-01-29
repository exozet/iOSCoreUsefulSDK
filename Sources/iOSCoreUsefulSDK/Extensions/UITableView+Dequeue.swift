//
//  UITableViewCell+Dequeue.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 06.06.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import UIKit

public extension UITableView {
    
//    /**
//     Dequeues the cell with the given identifier and indexPath, and sets custom parameters if they conform Base object.
//     - parameter identifier: Reuse identifier for the cell
//     - parameter indexPath: `IndexPath` of the cell.
//     - returns: `UITableViewCell`
//     */
//    func dequeueCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
//        let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
//        (cell as? BaseUITableViewCell)?.indexPath = indexPath
//        (cell as? BaseUITableViewCell)?.owner = self
//        return cell
//    }
    
    /**
     Registers cell to the `UITableView`
     - parameter nibName: Nib name for the cell
     */
    func register(nibName: String) {
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
}
