//
//  CLLocationCoordinate2D+Description.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 01.10.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import CoreLocation

public extension CLLocationCoordinate2D {
    
    /// Represents latitude and longitude information in a readable way.
    var logDescription: String {
        return "(Lat:\(self.latitude), Lng:\(self.longitude))"
    }
    
}

public extension CLLocation {
    
    /// Initializes the location object with the given coordinates.
    convenience init(coordinate: CLLocationCoordinate2D) {
        self.init(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
    
}
