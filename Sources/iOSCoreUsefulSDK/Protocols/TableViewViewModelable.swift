// TableViewViewModelable.swift
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

import UIKit

/// Presenter protocol designed as data-sources and delegate for tableviews.
/// The methods can be used for the designated places, or any other purposes.
public protocol TableViewViewModelable {
    
    /// This method designated to be called from `tableView:numberOfRowsInSection:`
    /// - parameter section: Section number of the `tableview`.
    func numberOfRows(in section: Int, for tableView: UITableView) -> Int
    
    /// This method designated to be called from `numberOfSectionsInTableView:`
    ///
    /// In default, returns 1.
    func numberOfSections(for tableView: UITableView) -> Int
    
    /// This method designated to be called from `tableView:cellForRowAtIndexPath:`
    /// - Parameter indexPath: `IndexPath` of the cell.
    func cellForRow(at indexPath: IndexPath, for tableView: UITableView) -> UITableViewCell?
    
    /// This method designated to be called from `tableView:viewForHeaderInSection:`in delegate,
    /// when `tableView:titleForHeaderInSection:` in datasource returns nothing.
    ///
    /// In default, returns `nil`.
    /// - Parameter section: Section number for the header.
    func headerFor(section: Int, for tableView: UITableView) -> UIView?
    
    /// This method designated to be called from `tableView:viewForFooterInSection:`in delegate,
    /// when `tableView:titleForFooterInSection:` in datasource returns nothing.
    ///
    /// In default, returns `nil`.
    /// - Parameter section: Section number for the footer.
    func footerFor(section: Int, for tableView: UITableView) -> UIView?
    
    /// This method designated to be called from `tableView:canEditRowAtIndexPath:`
    ///
    ///  In default, returns `false`.
    /// - Parameter indexPath: IndexPath for the cell row.
    func canEditRow(at indexPath: IndexPath, for tableView: UITableView) -> Bool
    
    /// This method designated to be called from `tableView:canMoveRowAtIndexPath:`
    ///
    /// In default, returns `false`.
    /// - Parameter indexPath: IndexPath for the cell row.
    func canMoveRow(at indexPath: IndexPath, for tableView: UITableView) -> Bool
    
    /// This method designated to be called from `tableView:moveRowAtIndexPath:toIndexPath:`
    ///
    /// In default, does nothing.
    /// - Parameters:
    ///   - sourceIndex: Source IndexPath for the cell row.
    ///   - destinationIndex: Destination IndexPath for the cell row.
    func moveRowAt(from sourceIndex: IndexPath, to destinationIndex: IndexPath, for tableView: UITableView)
}

public extension TableViewViewModelable {
    func numberOfSections() -> Int { return 1 }
    func headerFor(section: Int, for tableView: UITableView) -> UIView? { return nil }
    func footerFor(section: Int, for tableView: UITableView) -> UIView? { return nil }
    func canEditRow(at indexPath: IndexPath, for tableView: UITableView) -> Bool { return false }
    func canMoveRow(at indexPath: IndexPath, for tableView: UITableView) -> Bool { return false }
    func moveRowAt(from sourceIndex: IndexPath, to destinationIndex: IndexPath, for tableView: UITableView) { }
}
