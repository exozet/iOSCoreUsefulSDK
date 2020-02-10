// UITableView+Dequeue.swift
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

#endif
