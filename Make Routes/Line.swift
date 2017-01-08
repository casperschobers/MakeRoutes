//
//  Line.swift
//  Make Routes
//
//  Created by Casper Schobers on 07/01/17.
//  Copyright © 2017 Casper Schobers. All rights reserved.
//

import Foundation
import RealmSwift

class Line: Object{
  dynamic var latStart: Double = 0.0
  dynamic var lonStart: Double = 0.0
  dynamic var latEnd: Double = 0.0
  dynamic var lonEnd: Double = 0.0
  
  /*init(latStart: Double, lonStart: Double, latEnd: Double, lonEnd: Double){
    self.latStart = latStart
    self.lonStart = lonStart
    self.latEnd = latEnd
    self.lonEnd = lonEnd
  }*/
}
