//
//  SingleRouteViewController.swift
//  Make Routes
//
//  Created by Casper Schobers on 08/12/16.
//  Copyright © 2016 Casper Schobers. All rights reserved.
//

import UIKit
import MapKit

class SingleRouteViewController: UIViewController {
  
  var name: String?

    override func viewDidLoad() {
        super.viewDidLoad()

      self.title = name
      guard (name != nil) else {
        return
      }
      let mapView = MKMapView()
      let leftMargin:CGFloat = 0
      let topMargin:CGFloat = 0
      let mapWidth:CGFloat = view.frame.size.width
      let mapHeight:CGFloat = view.frame.size.height
      
      mapView.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
      
      mapView.mapType = MKMapType.standard
      mapView.isZoomEnabled = true
      mapView.isScrollEnabled = true
      
      // Or, if needed, we can position map in the center of the view
      mapView.center = view.center
      self.view.addSubview(mapView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
