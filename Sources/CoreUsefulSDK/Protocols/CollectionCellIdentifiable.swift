// CollectionCellIdentifiable.swift
//
// Copyright (c) 2020 Burak Uzunboy
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#if !os(macOS) && !os(watchOS)
import UIKit

/**
 Collection Cells who conform this protocol can be identified by their class names and dequeueable.
 */
@objc public protocol CollectionCellIdentifiable: class {
    /**
     Returns class name as identifier.
     - returns: Identifier which can be used instead of `reuseIdentifier`.
     */
    static func identifier() -> String
}

public extension CollectionCellIdentifiable {
    
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

extension UICollectionViewCell: CollectionCellIdentifiable {
    public static func identifier() -> String {
        return String(describing: self)
    }
}

#endif
