//
//  TableViewPresentable.swift
//  
//
//  Created by Burak Uzunboy on 29.01.20.
//

import Foundation

public protocol TableViewPresentable {
    associatedtype CellData
    associatedtype HeaderData
    associatedtype FooterData
    
    func numberOfRows(in section: Int) -> Int
    func numberOfSections() -> Int
    func cellForRow(at indexPath: IndexPath) -> CellData?
    func headerFor(section: Int) -> HeaderData?
    func footerFor(section: Int) -> FooterData?
    func canEditRow(at indexPath: IndexPath) -> Bool
    func canMoveRow(at indexPath: IndexPath) -> Bool
    func moveRowAt(from sourceIndex: IndexPath, to destinationIndex: IndexPath)
}

public extension TableViewPresentable {
    func headerFor(section: Int) -> HeaderData? { return nil }
    func footerFor(section: Int) -> FooterData? { return nil }
    func canEditRow(at indexPath: IndexPath) -> Bool { return false }
    func canMoveRow(at indexPath: IndexPath) -> Bool { return false }
    func moveRowAt(from sourceIndex: IndexPath, to destinationIndex: IndexPath) { }
}
