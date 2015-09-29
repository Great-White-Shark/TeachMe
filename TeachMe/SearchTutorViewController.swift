//
//  SearchTutorsViewController.swift
//  TeachMe
//
//  Created by Clover on 9/17/15.
//  Copyright (c) 2015 Great White Shark. All rights reserved.
//

import UIKit
import CoreLocation

class SearchTutorsViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: GMSMapView!
    let locationManager = CLLocationManager()
    
    // Let default location = Ben Thanh Market
    let defaultLocation = CLLocationCoordinate2D(latitude: 10.772160, longitude: 106.698189)

    override func viewWillAppear(animated: Bool) {
        navigationItem.title = "Teach Me"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        
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
    
    // MARK: - Map Manager
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true
        } else {
            // If not allow getting user's location, return defaul location
            mapView.camera = GMSCameraPosition.cameraWithTarget(defaultLocation, zoom: 14.0)
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            locationManager.stopUpdatingLocation()
        }
    }
    
}
