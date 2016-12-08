//
//  SingleRouteViewController.swift
//  Make Routes
//
//  Created by Casper Schobers on 08/12/16.
//  Copyright © 2016 Casper Schobers. All rights reserved.
//

import UIKit

class SingleRouteViewController: UIViewController {
  
  @IBOutlet weak var nameLabel: UILabel!
  var name: String?

    override func viewDidLoad() {
        super.viewDidLoad()

      self.nameLabel.text = self.name
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
