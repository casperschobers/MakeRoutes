//
//  SingleRouteViewController.swift
//  Make Routes
//
//  Created by Casper Schobers on 08/12/16.
//  Copyright © 2016 Casper Schobers. All rights reserved.
//

import UIKit
import MapKit
import Social

class SingleRouteViewController: UIViewController, MKMapViewDelegate {
  
  var route: Route?

    override func viewDidLoad() {
        super.viewDidLoad()

      guard (route != nil) else {
        return
      }
      self.title = self.route?.name
      let mapView = MKMapView()
      let leftMargin:CGFloat = 0
      let topMargin:CGFloat = 0
      let mapWidth:CGFloat = view.frame.size.width
      let mapHeight:CGFloat = view.frame.size.height
      
      mapView.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
      
      mapView.delegate = self
      mapView.mapType = MKMapType.standard
      mapView.isZoomEnabled = true
      mapView.isScrollEnabled = true
      
      // Or, if needed, we can position map in the center of the view
      mapView.centerOn(latitude: self.route!.pins.first!.lat, longitude: self.route!.pins.first!.lon, distance: 500)
      
      for pin in self.route!.pins{
        let tappedCoordinate = CLLocationCoordinate2D(latitude: pin.lat, longitude: pin.lon)
        let tapMarker = MKPointAnnotation()
        tapMarker.coordinate = tappedCoordinate
        mapView.addAnnotation(tapMarker)

      }
      
      for line in self.route!.lines{
        let coordinates = [CLLocationCoordinate2D(latitude: line.latStart, longitude: line.lonStart),CLLocationCoordinate2D(latitude: line.latEnd, longitude: line.lonEnd)]
        let pLine = MKPolyline(coordinates: coordinates, count: coordinates.count)
        mapView.add(pLine, level: MKOverlayLevel.aboveRoads)
      }
      
      self.view.addSubview(mapView)
        // Do any additional setup after loading the view.
       navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareRoute))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  public func shareRoute(){
    print("share")
    if let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter) {
      vc.setInitialText("Route: \(self.route!.name) is \(self.route!.distance.roundTo(places: 2)) km and made with the Make Routes app" )
      //vc.add(UIImage(named: "myImage.jpg")!)
      //vc.add(URL(string: "https://www.hackingwithswift.com"))
      present(vc, animated: true)
    } else {
       let alert = UIAlertController(title: "Sharing not available", message: "First sign in to Twitter in your settings", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
    }
  }
  
  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    
    let polylineRenderer = MKPolylineRenderer(overlay: overlay)
    polylineRenderer.strokeColor = UIColor.blue
    polylineRenderer.lineWidth = 2
    return polylineRenderer
  }
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
