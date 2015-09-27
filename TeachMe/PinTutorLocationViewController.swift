//
//  PinTutorLocationViewController.swift
//  TeachMe
//
//  Created by Clover on 9/19/15.
//  Copyright (c) 2015 Great White Shark. All rights reserved.
//

import UIKit
import MapKit

class PinTutorLocationViewController: UIViewController, UITabBarDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tabBar: UITabBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.delegate = self
        tabBar.selectedItem = tabBar.items?.first
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onCancel(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    @IBAction func onSetLocation(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
