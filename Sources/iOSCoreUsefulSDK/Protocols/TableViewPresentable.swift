//
//  TableViewPresentable.swift
//  
//
//  Created by Burak Uzunboy on 29.01.20.
//

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
