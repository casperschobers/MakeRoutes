//
//  FeedbackViewController.swift
//  Make Routes
//
//  Created by Casper Schobers on 06/01/17.
//  Copyright © 2017 Casper Schobers. All rights reserved.
//

import UIKit
import WebKit

class FeedbackViewController: UIViewController, WKScriptMessageHandler {
  var webView: WKWebView?
  
    override func viewDidLoad() {
        super.viewDidLoad()
      let contentController = WKUserContentController();
      let deviceInfo = "\(UIDevice.current.model) \(UIDevice.current.systemName) \(UIDevice.current.systemVersion)"
      print(deviceInfo)
      let userScript = WKUserScript(
        source: "setDeviceInfo('\(deviceInfo)')",
        injectionTime: WKUserScriptInjectionTime.atDocumentEnd,
        forMainFrameOnly: true
      )
      let config = WKWebViewConfiguration()
      config.userContentController = contentController

      contentController.addUserScript(userScript)
      contentController.add(self, name: "callbackHandler")
      webView = WKWebView (frame: self.view.frame, configuration: config)
      
      view.addSubview(webView!)
      let url = URL(string: "https://makeroutes.casperschobers.nl")
      let requestUrl = URLRequest(url: url!)
      webView?.load(requestUrl)
      
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
    if(message.name == "callbackHandler") {
      let alert = UIAlertController(title: "Feedback", message: "\(message.body)" , preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
      self.present(alert, animated: true, completion: nil)
    }
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
