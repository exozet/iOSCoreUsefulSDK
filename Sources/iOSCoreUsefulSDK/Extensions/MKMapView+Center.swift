//
//  MKMapView+Center.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 11.10.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import MapKit

public extension MKMapView {

    /**
     Sets center of the mapview with the given offset.
     - parameter offset: Offset value from the real center of the `MKMapView`
     - parameter coordinate: `CLLocationCoordinate2D` for center coordinates
     - parameter flag: Specify `true` if you want the map view to scroll to the new location or `false` if you want the map to display the new location immediately.
     */
    func setCenter(by offset: CGPoint, coordinate: CLLocationCoordinate2D, animated flag: Bool) {
        var point = self.convert(coordinate, toPointTo: self)
        point = point + offset
        let center = self.convert(point, toCoordinateFrom: self)
        self.setCenter(center, animated: flag)
    }
    
}
