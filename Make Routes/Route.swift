//
//  Route.swift
//  Make Routes
//
//  Created by Casper Schobers on 15/12/16.
//  Copyright © 2016 Casper Schobers. All rights reserved.
//

import Foundation
import MapKit

class Route {
  var distance: Double
  var annotations: [MKAnnotation]
  var overlays: [MKOverlay]
  
  init(distance: Double, annotations: [MKAnnotation], overlays: [MKOverlay]){
    self.distance = distance
    self.annotations = annotations
    self.overlays = overlays
  }
  
}
