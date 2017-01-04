//
//  Route.swift
//  Make Routes
//
//  Created by Casper Schobers on 15/12/16.
//  Copyright © 2016 Casper Schobers. All rights reserved.
//

import Foundation
import MapKit

struct Route {
  var distance: Double
  var annotations: [MKAnnotation]
  var overlays: [MKOverlay]
}