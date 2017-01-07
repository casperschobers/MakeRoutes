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
  var name: String
  var distance: Double
  var pins: [Pin]
  var lines: [Line]
  
  init(name: String, distance: Double, pins: [Pin], lines: [Line]){
    self.name = name
    self.distance = distance
    self.pins = pins
    self.lines = lines
  }
  
}
