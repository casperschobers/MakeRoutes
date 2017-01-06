//
//  FeedbackViewController.swift
//  Make Routes
//
//  Created by Casper Schobers on 06/01/17.
//  Copyright © 2017 Casper Schobers. All rights reserved.
//

import UIKit
import WebKit

class FeedbackViewController: UIViewController, WKNavigationDelegate  {
  var webView: WKWebView?
  var webConfig = WKWebViewConfiguration()

    override func viewDidLoad() {
        super.viewDidLoad()
      webView = WKWebView (frame: self.view.frame, configuration: webConfig)
      
      // Delegate to handle navigation of web content
      webView!.navigationDelegate = self
      
      view.addSubview(webView!)
      let url = URL(string: "https://makeroutes.casperschobers.nl")
      let requestUrl = URLRequest(url: url!)
      webView?.load(requestUrl)
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
