//
//  Line.swift
//  Make Routes
//
//  Created by Casper Schobers on 07/01/17.
//  Copyright © 2017 Casper Schobers. All rights reserved.
//

import Foundation
class Line{
  var latStart: Double
  var lonStart: Double
  var latEnd: Double
  var lonEnd: Double
  
  init(latStart: Double, lonStart: Double, latEnd: Double, lonEnd: Double){
    self.latStart = latStart
    self.lonStart = lonStart
    self.latEnd = latEnd
    self.lonEnd = lonEnd
  }
}
