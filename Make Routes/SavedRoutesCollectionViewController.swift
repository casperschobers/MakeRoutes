//
//  SavedRoutesCollectionViewController.swift
//  Make Routes
//
//  Created by Casper Schobers on 08/12/16.
//  Copyright © 2016 Casper Schobers. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SavedRoutesCollectionViewController: UICollectionViewController {
  
  var someData: [String] = ["Ruben", "Maikel", "Casper", "Sjors"]
  var detailViewController: SingleRouteViewController? = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    
    // Do any additional setup after loading the view.
    if let split = self.splitViewController {
      let controllers = split.viewControllers
      self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? SingleRouteViewController
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
    super.viewWillAppear(animated)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using [segue destinationViewController].
   // Pass the selected object to the new view controller.
   }
   */
  
  // MARK: UICollectionViewDataSource
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of items
    return someData.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SingleRouteCollectionViewCell
    
    // Configure the cell
    cell.nameLabel.text = self.someData[(indexPath as NSIndexPath).row]
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "viewSingleRoute"{
      var singleRouteViewController: SingleRouteViewController!
      if let singleRouteNavigationController = segue.destination as? UINavigationController {
      
        singleRouteViewController = singleRouteNavigationController.topViewController as! SingleRouteViewController
        singleRouteViewController.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
        singleRouteViewController.navigationItem.leftItemsSupplementBackButton = true
      }
      singleRouteViewController.name = "test"
      let cell =  sender as! SingleRouteCollectionViewCell
      let indexPath = self.collectionView!.indexPath(for: cell)
      let name = self.someData[(indexPath?.row)!]
      singleRouteViewController.name = name
    }
  }
  
  
  // MARK: UICollectionViewDelegate
  
  /*
   // Uncomment this method to specify if the specified item should be highlighted during tracking
   override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
   return true
   }
   */
  
  /*
   // Uncomment this method to specify if the specified item should be selected
   override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
   return true
   }
   */
  
  /*
   // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
   override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
   return false
   }
   
   override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
   return false
   }
   
   override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
   
   }
   */
  
}
extension SavedRoutesCollectionViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (UIScreen.main.bounds.width-30) / 2.0
    return CGSize(width: width, height: width)
  }
}
