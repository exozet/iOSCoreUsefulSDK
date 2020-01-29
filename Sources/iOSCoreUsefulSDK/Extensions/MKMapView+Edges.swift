//
//  MKMapView+Edges.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 06.09.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//
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

extension CLLocationCoordinate2D: Equatable {
    
    /// Compares two coordinates equality.
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
    
}

public extension CLLocationDegrees {
    
    /// Converts Degrees into meters value.
    func inMeters() -> Double {
        return self * 111 * 1000
    }
}
