//
//  CollectionCellIdentifiable.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 02.07.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import UIKit

/**
 Collection Cells who conform this protocol can be identified by their class names and dequeueable.
 */
public protocol CollectionCellIdentifiable: UICollectionViewCell { }

public extension CollectionCellIdentifiable {
    
    /**
     Returns class name as identifier.
     - returns: Identifier which can be used instead of `reuseIdentifier`.
     */
    static func identifier() -> String {
        return String(describing: self)
    }
    
    /**
     Initializes new cell for the specified collection with the given indexPath.
     - parameter collectionView: Cell should be registered first before use this method.
     - parameter indexPath: `IndexPath` for the cell.
     - returns: New Cell
     */
    static func initialize(for collectionView: UICollectionView, indexPath: IndexPath) -> Self {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier(), for: indexPath)
        return cell as! Self
    }
    
    /**
     Registers cell automatically to given collectionView.
     - parameter collectionView: `UICollectionView`
     */
    static func register(to collectionView: UICollectionView?) {
        collectionView?.register(nibName: identifier())
    }
}
