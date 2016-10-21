//
//  ViewController.swift
//  OnDemadResourse
//
//  Created by Yudiz Solutions Pvt.Ltd. on 05/10/16.
//  Copyright © 2016 Yudiz Solutions Pvt.Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Outlets
    @IBOutlet var imgV:UIImageView!
    //Varibles
    var request: NSBundleResourceRequest!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidDisappear(animated: Bool) {
        request.endAccessingResources()
    }
    
    @IBAction func btnLoadResourceTapped(_ sender:UIButton) {
        //First check resouce is available or not
        request = NSBundleResourceRequest(tags: ["Background"])
        request.loadingPriority = NSBundleResourceRequestLoadingPriorityUrgent
//        request.bundle.setPreservationPriority(1.0, forTags: ["Background"])
        request.conditionallyBeginAccessingResourcesWithCompletionHandler { (resourcesAvailable) in
            if resourcesAvailable ==  true {
                //Resouses available
            }else{
                // Resources not available
                self.fetchResouces()
            }
        }
        
    }
    func fetchResouces() {
        request.beginAccessingResourcesWithCompletionHandler { (error: NSError?) -> Void in
            //  Called on background thread
            if error == nil {
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    print("Done")
                })
            }else{
                print(error?.description)
            }
        }
    }
    
    
}

