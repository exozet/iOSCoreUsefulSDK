// TableViewPresentable.swift
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

import Foundation

/// Presenter protocol designed as data-sources for tableviews.
/// The methods can be used for the designated places, or any other purposes.
public protocol TableViewPresentable {
    /// The data type expected to return for cells.
    associatedtype CellData
    
    /// The data type expected to return for headers.
    associatedtype HeaderData
    
    /// The data type expected to return for footers.
    associatedtype FooterData
    
    /// This method designated to be called from `tableView:numberOfRowsInSection:`
    /// - parameter section: Section number of the `tableview`.
    func numberOfRows(in section: Int) -> Int
    
    /// This method designated to be called from `numberOfSectionsInTableView:`
    ///
    /// In default, returns 1.
    func numberOfSections() -> Int
    
    /// This method designated to be called from `tableView:cellForRowAtIndexPath:`
    /// - Parameter indexPath: `IndexPath` of the cell.
    func cellForRow(at indexPath: IndexPath) -> CellData?
    
    /// This method designated to be called from `tableView:titleForHeaderInSection:` in datasource
    /// or `tableView:viewForHeaderInSection:`in delegate.
    ///
    /// In default, returns `nil`.
    /// - Parameter section: Section number for the header.
    func headerFor(section: Int) -> HeaderData?
    
    /// This method designated to be called from `tableView:titleForFooterInSection:` in datasource
    /// or `tableView:viewForFooterInSection:`in delegate.
    ///
    /// In default, returns `nil`.
    /// - Parameter section: Section number for the footer.
    func footerFor(section: Int) -> FooterData?
    
    /// This method designated to be called from `tableView:canEditRowAtIndexPath:`
    ///
    ///  In default, returns `false`.
    /// - Parameter indexPath: IndexPath for the cell row.
    func canEditRow(at indexPath: IndexPath) -> Bool
    
    /// This method designated to be called from `tableView:canMoveRowAtIndexPath:`
    ///
    /// In default, returns `false`.
    /// - Parameter indexPath: IndexPath for the cell row.
    func canMoveRow(at indexPath: IndexPath) -> Bool
    
    /// This method designated to be called from `tableView:moveRowAtIndexPath:toIndexPath:`
    ///
    /// In default, does nothing.
    /// - Parameters:
    ///   - sourceIndex: Source IndexPath for the cell row.
    ///   - destinationIndex: Destination IndexPath for the cell row.
    func moveRowAt(from sourceIndex: IndexPath, to destinationIndex: IndexPath)
}

public extension TableViewPresentable {
    func numberOfSections() -> Int { return 1 }
    func headerFor(section: Int) -> HeaderData? { return nil }
    func footerFor(section: Int) -> FooterData? { return nil }
    func canEditRow(at indexPath: IndexPath) -> Bool { return false }
    func canMoveRow(at indexPath: IndexPath) -> Bool { return false }
    func moveRowAt(from sourceIndex: IndexPath, to destinationIndex: IndexPath) { }
}
