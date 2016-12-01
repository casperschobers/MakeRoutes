//
//  MapViewController.swift
//  Make Routes
//
//  Created by Casper Schobers on 01/12/16.
//  Copyright © 2016 Casper Schobers. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController{
  
  @IBOutlet weak var mapView: MKMapView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let initialLocation = CLLocation(latitude: 51.164814, longitude: 5.799780)
    self.centerMapOnLocation(location: initialLocation)
    self.initializeGestureRecognizer()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func centerMapOnLocation(location: CLLocation) {
    let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,100 * 2.0, 100 * 2.0)
    mapView.setRegion(coordinateRegion, animated: true)
  }
  
  func initializeGestureRecognizer()
  {
    //For LongPressGesture Recoginzation
    let longPressedGesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action:#selector(MapViewController.recognizeLongPressedGesture(_:)))
    longPressedGesture.delaysTouchesBegan = true
    mapView.addGestureRecognizer(longPressedGesture)
  }
  
  func recognizeLongPressedGesture (_ sender: UILongPressGestureRecognizer)
  {
    if sender.state == UIGestureRecognizerState.began {
      let tappedPoint = sender.location(in: self.mapView)
      let tapPoint = mapView.convert(tappedPoint, toCoordinateFrom: self.view)
      let tapMarker = MKPointAnnotation()
      tapMarker.coordinate = tapPoint
      self.mapView.addAnnotation(tapMarker)
      
    }
  }
}
