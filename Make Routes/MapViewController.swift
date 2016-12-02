//
//  MapViewController.swift
//  Make Routes
//
//  Created by Casper Schobers on 01/12/16.
//  Copyright © 2016 Casper Schobers. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate{
  
  @IBOutlet weak var mapView: MKMapView!
  let locationManager = CLLocationManager()
  var lastPlacedPin: CLLocationCoordinate2D? = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(clearRoute))
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addTapped))
    self.mapView.delegate = self
    // Do any additional setup after loading the view, typically from a nib.
    let initialLocation = CLLocation(latitude: 51.164814, longitude: 5.799780)
    self.centerMapOnLocation(location: initialLocation)
    self.initializeGestureRecognizer()
    
    // Use location when app is un use
    self.locationManager.requestWhenInUseAuthorization()
    
    if CLLocationManager.locationServicesEnabled() {
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
      // Request location once
      locationManager.requestLocation()
    }
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func addTapped(){
  print("tapped")
  }
  
  
  func centerMapOnLocation(location: CLLocation) {
    let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,100 * 2.0, 100 * 2.0)
    mapView.setRegion(coordinateRegion, animated: true)
  }
  
  func addPolylineToMap(start: CLLocationCoordinate2D, end: CLLocationCoordinate2D) {
    let a = [start, end]
    let pLine = MKPolyline(coordinates: a, count: a.count)
    mapView.add(pLine, level: MKOverlayLevel.aboveRoads)
    print(mapView.overlays.count)
  }
  
  func initializeGestureRecognizer()
  {
    // Add longpressed gesture to MKMapView
    let longPressedGesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action:#selector(MapViewController.recognizeLongPressedGesture(_:)))
    longPressedGesture.delaysTouchesBegan = true
    mapView.addGestureRecognizer(longPressedGesture)
  }
  
  func recognizeLongPressedGesture (_ sender: UILongPressGestureRecognizer)
  {
    // Check if pressed state is began
    if sender.state == UIGestureRecognizerState.began {
      // Set marker on location
      let tappedPoint = sender.location(in: self.mapView)
      let tappedCoordinate = mapView.convert(tappedPoint, toCoordinateFrom: self.view)
      let tapMarker = MKPointAnnotation()
      tapMarker.coordinate = tappedCoordinate
      self.mapView.addAnnotation(tapMarker)
      guard (lastPlacedPin != nil) else {
         self.lastPlacedPin = tappedCoordinate
        return
      }
    
      self.addPolylineToMap(start: lastPlacedPin!, end: tappedCoordinate)
       self.lastPlacedPin = tappedCoordinate
      
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       self.centerMapOnLocation(location: locations.last!)
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("Failed to find user's location: \(error.localizedDescription)")
  }
  
  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    
      let polylineRenderer = MKPolylineRenderer(overlay: overlay)
      polylineRenderer.strokeColor = UIColor.blue
      polylineRenderer.lineWidth = 2
      return polylineRenderer
  }
  
 func clearRoute() {
    mapView.removeAnnotations(mapView.annotations)
    mapView.removeOverlays(mapView.overlays)
    self.lastPlacedPin = nil

  }

}
