//
//  Extension.swift
//  Make Routes
//
//  Created by Casper Schobers on 08/01/17.
//  Copyright © 2017 Casper Schobers. All rights reserved.
//

import Foundation
import MapKit

extension Double {
  /// Rounds the double to decimal places value
  func roundTo(places:Int) -> Double {
    let divisor = pow(10.0, Double(places))
    return (self * divisor).rounded() / divisor
  }
}

extension MKMapView{
  /// Center map on given location
  func centerOn(latitude: Double, longitude: Double, distance: Double) {
    let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    let coordinateRegion = MKCoordinateRegionMakeWithDistance(coordinate, distance, distance)
    self.setRegion(coordinateRegion, animated: true)
  }
}
