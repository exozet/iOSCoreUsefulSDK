//
//  UICollectionView+Dequeue.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 02.07.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
//    /**
//     Dequeues the cell with the given identifier and indexPath, and sets custom parameters if they conform Base object.
//     - parameter identifier: Reuse identifier for the cell
//     - parameter indexPath: `IndexPath` of the cell.
//     - returns: `UICollectionViewCell`
//     */
//    func dequeueCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
//        return cell
//    }
    
    /**
     Registers cell to the `UICollectionView`
     - parameter nibName: Nib name for the cell
     */
    func register(nibName: String) {
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
}
