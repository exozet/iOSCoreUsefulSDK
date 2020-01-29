//
//  TableViewViewModelable.swift
//  
//
//  Created by Burak Uzunboy on 29.01.20.
//

import UIKit

public protocol TableViewViewModelable {
    func numberOfRows(in section: Int, for tableView: UITableView) -> Int
    func numberOfSections(for tableView: UITableView) -> Int
    func cellForRow(at indexPath: IndexPath, for tableView: UITableView) -> UITableViewCell?
    func headerFor(section: Int, for tableView: UITableView) -> UIView?
    func footerFor(section: Int, for tableView: UITableView) -> UIView?
    func canEditRow(at indexPath: IndexPath, for tableView: UITableView) -> Bool
    func canMoveRow(at indexPath: IndexPath, for tableView: UITableView) -> Bool
    func moveRowAt(from sourceIndex: IndexPath, to destinationIndex: IndexPath, for tableView: UITableView)
}

public extension TableViewViewModelable {
    func headerFor(section: Int, for tableView: UITableView) -> UIView? { return nil }
    func footerFor(section: Int, for tableView: UITableView) -> UIView? { return nil }
    func canEditRow(at indexPath: IndexPath, for tableView: UITableView) -> Bool { return false }
    func canMoveRow(at indexPath: IndexPath, for tableView: UITableView) -> Bool { return false }
    func moveRowAt(from sourceIndex: IndexPath, to destinationIndex: IndexPath, for tableView: UITableView) { }
}
