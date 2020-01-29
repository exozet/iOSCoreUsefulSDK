//
//  AnnotationViewable.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 16.09.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import MapKit
import UIKit

/**
 Annotations should conform that protocol to render by the map
 */
public protocol AnnotationViewable: MKAnnotation {

    /**
     MapKit can ask to get view of the annotation when `mapView(_:viewFor:)` is called.
     - parameter mapView: Responsible mapView for the annotation.
     - returns: View for the current annotation.
     */
    func viewForAnnotation(for mapView: MKMapView) -> MKAnnotationView
}

@available(iOS 11.0, *)
extension MKClusterAnnotation: AnnotationViewable {

    public func viewForAnnotation(for mapView: MKMapView) -> MKAnnotationView {
        return mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier, for: self)
    }

}

