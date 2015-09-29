//
//  PinTutorLocationViewController.swift
//  TeachMe
//
//  Created by Clover on 9/19/15.
//  Copyright (c) 2015 Great White Shark. All rights reserved.
//

import UIKit
import CoreLocation

// MARK: - GMSMapViewDelegate
extension PinTutorLocationViewController: GMSMapViewDelegate {
    
}

class PinTutorLocationViewController: UIViewController, UITabBarDelegate, UISearchBarDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var locationAddressLabel: UILabel!
    @IBOutlet weak var addressBarView: UIView!
    @IBOutlet weak var setLocationButton: UIButton!
    @IBOutlet weak var pinImageVerticalConstraint: NSLayoutConstraint!
    
    
    lazy var searchBar: UISearchBar = UISearchBar(frame: CGRectMake(0, 0, 200, 20))
    let mapTasks = MapTasks()
    let locationManager = CLLocationManager()
    
    // Let default location = Ben Thanh Market
    let defaultLocation = CLLocationCoordinate2D(latitude: 10.772160, longitude: 106.698189)
    var locationMarker: GMSMarker!
    var address: String?

    override func viewWillAppear(animated: Bool) {
        if (CLLocationManager.locationServicesEnabled() != false && CLLocationManager.authorizationStatus() != CLAuthorizationStatus.Denied) {
            // Load current user location
            locationManager.startUpdatingLocation()
            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true
            let bottomItemHeight = self.setLocationButton.intrinsicContentSize().height + self.tabBar.intrinsicContentSize().height
            self.mapView.padding = UIEdgeInsets(top: self.topLayoutGuide.length, left: 0,
                bottom: bottomItemHeight, right: 0)
            UIView.animateWithDuration(0.25) {
                self.pinImageVerticalConstraint.constant -= ((bottomItemHeight - self.topLayoutGuide.length) * 0.5)
                self.view.layoutIfNeeded()
            }
        } else {
            // Load default location
            self.mapView.camera = GMSCameraPosition.cameraWithTarget(defaultLocation, zoom: 16.0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.delegate = self
        tabBar.selectedItem = tabBar.items?.first
        
        searchBar.placeholder = "Type an Address here"
        navigationItem.titleView = searchBar
        searchBar.delegate = self
  
        mapView.delegate = self
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        address = searchBar.text!
        
        self.mapTasks.geocodeAddress(address, withCompletionHandler: { (status, success) -> Void in
            if !success {
                print(status)
                
                if status == "ZERO_RESULTS" {
                    self.showErrorAlertWithMessage("Cannot find your address")
                }
            }
            else {
                let coordinate = CLLocationCoordinate2D(latitude: self.mapTasks.fetchedAddressLatitude, longitude: self.mapTasks.fetchedAddressLongitude)
                self.mapView.camera = GMSCameraPosition.cameraWithTarget(coordinate, zoom: 16.0)
                print(coordinate.latitude)
                print(coordinate.longitude)
//                self.setupLocationMarker(coordinate)
            }
        })
    }
    
    func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D) {
    
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            if let address = response?.firstResult() {
                
                let lines = address.lines as! [String]
                self.locationAddressLabel.text = lines.joinWithSeparator("\n")
                UIView.animateWithDuration(0.25) {
                    self.view.layoutIfNeeded()
                }
            }
            else {
                self.locationAddressLabel.text = ""
            }
            self.tabBar.alpha = 0.8
            self.setLocationButton.alpha = 1
            self.addressBarView.alpha = 1
            self.navigationController?.navigationBarHidden = false
        }
    }
    
    func mapView(mapView: GMSMapView!, idleAtCameraPosition position: GMSCameraPosition!) {
        reverseGeocodeCoordinate(position.target)
    }
    
    func mapView(mapView: GMSMapView!, willMove gesture: Bool) {
        tabBar.alpha = 0
        setLocationButton.alpha = 0
        addressBarView.alpha = 0
        navigationController?.navigationBarHidden = true
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            locationManager.stopUpdatingLocation()
        }
    }
    
    func setupLocationMarker(coordinate: CLLocationCoordinate2D) {
        if locationMarker != nil {
            locationMarker.map = nil
        }
        locationMarker = GMSMarker(position: coordinate)
        locationMarker.map = mapView
        locationMarker.title = mapTasks.fetchedFormattedAddress
        locationMarker.appearAnimation = kGMSMarkerAnimationPop
        locationMarker.icon = GMSMarker.markerImageWithColor(UIColor.blueColor())
        locationMarker.opacity = 0.75
    }
    
    func showErrorAlertWithMessage(message: String) {
        let alertController = UIAlertController(title: "Location not found!", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let closeAction = UIAlertAction(title: "Close", style: UIAlertActionStyle.Cancel) { (alertAction) -> Void in
        }
        alertController.addAction(closeAction)
        presentViewController(alertController, animated: true, completion: nil)
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
