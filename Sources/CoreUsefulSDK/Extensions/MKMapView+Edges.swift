// MKMapView+Edges.swift
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

#if !os(watchOS)
import Foundation
import MapKit

/// Typealias for couple that can hold `Nort East` and `South West` coordinates.
public typealias Edges = (ne: CLLocationCoordinate2D, sw: CLLocationCoordinate2D)

public extension MKMapView {
    
    /**
     Converts Edge points with the given insets.
     - parameter dx: Inset for X position.
     - parameter dy: Inset for Y position.
     - returns: `Edges` object which contains `North East` and `South West` of the map edges.
     */
    func edgePoints(insetBy dx: CGFloat, dy: CGFloat) -> Edges {
        let bounds = self.bounds.insetBy(dx: dx, dy: dy)
        let nePoint = CGPoint(x: bounds.maxX, y: bounds.origin.y)
        let swPoint = CGPoint(x: bounds.minX, y: bounds.maxY)
        let neCoord = self.convert(nePoint, toCoordinateFrom: self)
        let swCoord = self.convert(swPoint, toCoordinateFrom: self)
        return (ne: neCoord, sw: swCoord)
    }
}

#endif
