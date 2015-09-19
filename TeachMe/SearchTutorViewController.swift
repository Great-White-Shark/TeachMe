//
//  SearchTutorViewController.swift
//  TeachMe
//
//  Created by Clover on 9/17/15.
//  Copyright (c) 2015 Great White Shark. All rights reserved.
//

import UIKit
import MapKit

class SearchTutorViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewWillAppear(animated: Bool) {
        navigationItem.title = "Teach Me"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // - Search Bar
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Remove the back button's title by replacing the previous navigation bar's title
        navigationItem.title = ""
    }
    
}
