// MKMapView+Center.swift
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

#endif
