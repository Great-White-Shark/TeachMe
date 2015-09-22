//
//  SearchTutorsViewController.swift
//  TeachMe
//
//  Created by Clover on 9/17/15.
//  Copyright (c) 2015 Great White Shark. All rights reserved.
//

import UIKit
import MapKit

class SearchTutorsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!

    override func viewWillAppear(animated: Bool) {
        navigationItem.title = "Teach Me"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Remove the back button's title by replacing the previous navigation bar's title
        navigationItem.title = ""
        
    }
    
}
