//
//  MapViewController.swift
//  Make Routes
//
//  Created by Casper Schobers on 01/12/16.
//  Copyright © 2016 Casper Schobers. All rights reserved.
//

import UIKit
import MapKit
import RealmSwift

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate{
  
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var distanceLabel: UILabel!
  
  let locationManager = CLLocationManager()
  var lastPlacedPin: CLLocationCoordinate2D? = nil
  var routeLength = 0.0
  var pins = List<Pin>()
  var lines = List<Line>()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(clearRoute))
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveRoute))
    self.mapView.delegate = self
    // Do any additional setup after loading the view, typically from a nib.
    self.mapView.centerOn(latitude: 51.164814, longitude: 5.799780, distance: 200)
    self.initializeGestureRecognizer()
    
    // Use location when app is un use
    self.locationManager.requestWhenInUseAuthorization()
    
    if CLLocationManager.locationServicesEnabled() {
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
     
    }
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func saveRoute(){
    
    let alert = UIAlertController(title: "Save Route", message: "Enter a name for the route", preferredStyle: .alert)
    
    alert.addTextField { (textField) in
      textField.placeholder = "Enter name here"
    }
    
    alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
      let nameField = alert?.textFields![0] // Force unwrapping because we know it exists.
      
      let route = Route()
      route.name = nameField!.text!
      route.distance = self.routeLength
      route.pins = self.pins
      route.lines = self.lines
      
      let realm = try! Realm()
      try! realm.write() {
        realm.add(route)
      }
    }))
    
    self.present(alert, animated: true, completion: nil)
    }
  
  func addPolylineToMap(cStart: CLLocationCoordinate2D, cEnd: CLLocationCoordinate2D) {
    let coordinates = [cStart, cEnd]
    let line = Line()
    line.latStart = cStart.latitude
    line.lonStart = cStart.longitude
    line.latEnd = cEnd.latitude
    line.lonEnd = cEnd.longitude
    self.lines.append(line)
    let pLine = MKPolyline(coordinates: coordinates, count: coordinates.count)
    mapView.add(pLine, level: MKOverlayLevel.aboveRoads)
    self.calculateDistance(start: cStart, end: cEnd)
  }
  
  func calculateDistance(start: CLLocationCoordinate2D, end: CLLocationCoordinate2D){
    let beginCoordinate = CLLocation(latitude: start.latitude, longitude: start.longitude)
    let endCoordinate = CLLocation(latitude: end.latitude, longitude: end.longitude)
    self.routeLength += (beginCoordinate.distance(from: endCoordinate)/1000)
    self.distanceLabel.text = String(format:"%.2f", self.routeLength)
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
      let tappedCoordinate = mapView.convert(tappedPoint, toCoordinateFrom: self.mapView)
      let pin = Pin()
      pin.lat = tappedCoordinate.latitude
      pin.lon = tappedCoordinate.longitude
      self.pins.append(pin)
      let tapMarker = MKPointAnnotation()
      tapMarker.coordinate = tappedCoordinate
      self.mapView.addAnnotation(tapMarker)
      guard let lastPin = lastPlacedPin else {
         self.lastPlacedPin = tappedCoordinate
        return
      }
    
      self.addPolylineToMap(cStart: lastPin, cEnd: tappedCoordinate)
       self.lastPlacedPin = tappedCoordinate
      
    }
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
    self.routeLength = 0
    self.distanceLabel.text = "0.00"
    self.pins = List<Pin>()
    self.lines = List<Line>()
  }
  
  @IBAction func goToCurrentLocaiton(_ sender: UIButton) {
    guard let location = self.locationManager.location else {
      return
    }
    self.mapView.centerOn(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude, distance: 200)
  }

}
