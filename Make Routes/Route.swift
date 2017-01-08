//
//  Route.swift
//  Make Routes
//
//  Created by Casper Schobers on 15/12/16.
//  Copyright © 2016 Casper Schobers. All rights reserved.
//

import Foundation
import RealmSwift

class Route: Object {
  dynamic var name: String = ""
  dynamic var distance: Double = 0.0
  var pins = List<Pin>()
  var lines = List<Line>()
  
  /*init(name: String, distance: Double, pins: List<Pin>, lines: List<Line>){
    self.name = name
    self.distance = distance
    self.pins = pins
    self.lines = lines
  }*/
  
}
