//
//  CGSize+Math.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 11.10.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import UIKit

public extension CGSize {
    
    /// Reduces the width and height with the given amount.
    ///
    /// How to use:
    /// ````
    /// let size = CGSize(width: 5, height: 5)
    /// let newSize = size - 3
    /// ````
    ///
    static func - (lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width - rhs, height: lhs.height - rhs)
    }
    
    /// Increases the width and height with the given amount.
    ///
    /// How to use:
    /// ````
    /// let size = CGSize(width: 5, height: 5)
    /// let newSize = size + 3
    /// ````
    ///
    static func + (lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width + rhs, height: lhs.height + rhs)
    }
    
    /// Adds right handsize to left handsize.
    ///
    /// How to use:
    /// ````
    /// var size = CGSize(width: 5, height: 5)
    /// size += CGSize(width: 3, height: 3)
    /// ````
    ///
    static func += (lhs: inout CGSize, rhs: CGSize) {
        lhs = CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
    
    /// Decreases the size with the given right handsize.
    ///
    /// How to use:
    /// ````
    /// var size = CGSize(width: 5, height: 5)
    /// size -= CGSize(width: 3, height: 3)
    /// ````
    ///
    static func -= (lhs: inout CGSize, rhs: CGSize) {
        lhs = CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
    }
    
    /// Adds right handsize to left handsize.
    ///
    /// How to use:
    /// ````
    /// var size = CGSize(width: 5, height: 5)
    /// size += 3
    /// ````
    ///
    static func += (lhs: inout CGSize, rhs: CGFloat) {
        lhs += CGSize(width: rhs, height: rhs)
    }
    
    /// Decreases the size with the given right handsize.
    ///
    /// How to use:
    /// ````
    /// var size = CGSize(width: 5, height: 5)
    /// size -= 3
    /// ````
    ///
    static func -= (lhs: inout CGSize, rhs: CGFloat) {
        lhs -= CGSize(width: rhs, height: rhs)
    }
    
    /// Adds right handsize to left handsize.
    ///
    /// How to use:
    /// ````
    /// var size = CGSize(width: 5, height: 5)
    /// size += 3
    /// ````
    ///
    static func += (lhs: inout CGSize, rhs: Double) {
        lhs += CGSize(width: rhs, height: rhs)
    }
    
    /// Decreases the size with the given right handsize.
    ///
    /// How to use:
    /// ````
    /// var size = CGSize(width: 5, height: 5)
    /// size -= 3
    /// ````
    ///
    static func -= (lhs: inout CGSize, rhs: Double) {
        lhs -= CGSize(width: rhs, height: rhs)
    }
    
    /// Adds right handsize to left handsize.
    ///
    /// How to use:
    /// ````
    /// var size = CGSize(width: 5, height: 5)
    /// size += 3
    /// ````
    ///
    static func += (lhs: inout CGSize, rhs: Int) {
        lhs += CGSize(width: rhs, height: rhs)
    }
    
    /// Decreases the size with the given right handsize.
    ///
    /// How to use:
    /// ````
    /// var size = CGSize(width: 5, height: 5)
    /// size -= 3
    /// ````
    ///
    static func -= (lhs: inout CGSize, rhs: Int) {
        lhs -= CGSize(width: rhs, height: rhs)
    }
    
}

public extension CGPoint {
    
    /// Increases the X and Y points with the given amount
    static func + (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x + rhs, y: lhs.y + rhs)
    }
    
    /// Reduces the X and Y points with the given amount
    static func - (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x - rhs, y: lhs.y - rhs)
    }
    
    /// Adds two point.
    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    /// Reduces the point with the given point.
    static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    /// Adds right handsize to left handsize.
    ///
    /// How to use:
    /// ````
    /// var point = CGPoint(x: 5, y: 5)
    /// point += CGPoint(x: 3, y: 3)
    /// ````
    ///
    static func += (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    /// Decreases left handsize with right handsize.
    ///
    /// How to use:
    /// ````
    /// var point = CGPoint(x: 5, y: 5)
    /// point += CGPoint(x: 3, y: 3)
    /// ````
    ///
    static func -= (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    /// Adds right handsize to left handsize.
    ///
    /// How to use:
    /// ````
    /// var point = CGPoint(x: 5, y: 5)
    /// point += 3
    /// ````
    ///
    static func += (lhs: inout CGPoint, rhs: CGFloat) {
        lhs = CGPoint(x: lhs.x + rhs, y: lhs.y + rhs)
    }
    
    /// Decreases left handsize with right handsize.
    ///
    /// How to use:
    /// ````
    /// var point = CGPoint(x: 5, y: 5)
    /// point -= 3
    /// ````
    ///
    static func -= (lhs: inout CGPoint, rhs: CGFloat) {
        lhs = CGPoint(x: lhs.x - rhs, y: lhs.y - rhs)
    }
    
    /// Adds right handsize to left handsize.
    ///
    /// How to use:
    /// ````
    /// var point = CGPoint(x: 5, y: 5)
    /// point += 3
    /// ````
    ///
    static func += (lhs: inout CGPoint, rhs: Double) {
        lhs = CGPoint(x: lhs.x + CGFloat(rhs), y: lhs.y + CGFloat(rhs))
    }
    
    /// Decreases left handsize with right handsize.
    ///
    /// How to use:
    /// ````
    /// var point = CGPoint(x: 5, y: 5)
    /// point -= 3
    /// ````
    ///
    static func -= (lhs: inout CGPoint, rhs: Double) {
        lhs = CGPoint(x: lhs.x - CGFloat(rhs), y: lhs.y - CGFloat(rhs))
    }
    
    /// Adds right handsize to left handsize.
    ///
    /// How to use:
    /// ````
    /// var point = CGPoint(x: 5, y: 5)
    /// point += 3
    /// ````
    ///
    static func += (lhs: inout CGPoint, rhs: Int) {
        lhs = CGPoint(x: lhs.x + CGFloat(rhs), y: lhs.y + CGFloat(rhs))
    }
    
    /// Decreases left handsize with right handsize.
    ///
    /// How to use:
    /// ````
    /// var point = CGPoint(x: 5, y: 5)
    /// point -= 3
    /// ````
    ///
    static func -= (lhs: inout CGPoint, rhs: Int) {
        lhs = CGPoint(x: lhs.x - CGFloat(rhs), y: lhs.y - CGFloat(rhs))
    }
}
