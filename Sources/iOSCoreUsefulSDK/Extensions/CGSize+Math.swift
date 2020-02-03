// CGSize+Math.swift
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

#if !os(macOS)
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
#endif
