//
//  TutorResultsViewController.swift
//  TeachMe
//
//  Created by Clover on 9/19/15.
//  Copyright (c) 2015 Great White Shark. All rights reserved.
//

import UIKit

class TutorResultsViewController: UIViewController, UITabBarDelegate, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var saveSearchBarView: UIView!
    @IBOutlet weak var closeSaveSearchBarButton: UIButton!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var fadedView: UIView!
    var saveSearchBarOriginalY: NSNumber?
    var rowCount: Int = 0
    var tutors: [Tutor]?
    var tutorsFilter: [Tutor]?
    var searchActive: Bool = false
    
    
    override func viewWillAppear(animated: Bool) {
        navigationItem.title = "Tutor Results"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let fakeDataArray = fakeData.sharedInstance.generateData()
        tutors = Tutor.tutors(array: fakeDataArray)
        
        // Set original Y-coordinate for save search bar
        saveSearchBarOriginalY = saveSearchBarView.frame.origin.y
        
        customizeNavBar()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        
        searchActive = false
        self.searchBar.placeholder = "Search"
        self.searchBar.delegate = self
        
        let fadedViewtapGestureRecognizer = UITapGestureRecognizer(target: self, action: "onFadedViewTap")
        self.fadedView.addGestureRecognizer(fadedViewtapGestureRecognizer)
        let fadedViewpanGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onFadedViewTap")
        self.fadedView.addGestureRecognizer(fadedViewpanGestureRecognizer)
        
        tabBar.delegate = self
        tabBar.selectedItem = tabBar.items?.first as! UITabBarItem!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table View
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive {
            return tutorsFilter!.count
        } else {
            return tutors!.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TutorCell") as! TutorCell
        let tutor = searchActive ? tutorsFilter : tutors
        cell.tutor = tutor![indexPath.row]
        
        /* For every 10 rows, the save search button will show up */
        rowCount++
        if rowCount%10 == 0 {
            showSaveSearchBar()
            rowCount == 0
        }
        
        return cell
    }


    // MARK: - Search Bar
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.fadedView.userInteractionEnabled = true
        self.fadedView.alpha = 0.35
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
        self.fadedView.userInteractionEnabled = false
        self.fadedView.alpha = 0
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
        self.fadedView.userInteractionEnabled = false
        self.fadedView.alpha = 0
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        tutorsFilter = tutors!.filter({ (tutor) -> Bool in
            /* Search bar search by subject, name, price, university */
            for subject in tutor.subjectsArray! {
                let tmpSubject = subject
                let range4 = tmpSubject.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
                if range4 != nil {
                    return true
                }
            }
            let tmpName = tutor.name
            let range1 = tmpName!.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            let tmpPricePerHr = "\(tutor.pricePerHr!)"
            let range2 = tmpPricePerHr.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            let tmpUniversity = tutor.name
            let range3 = tmpUniversity!.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return (range1 != nil) || (range2 != nil) || (range3 != nil)
        })
        
        if (searchText == "" && tutorsFilter!.count == 0) {
            searchActive = false
        } else {
            searchActive = true
        }
        self.tableView.reloadData()
    }
    
    func onFadedViewTap() {
        self.searchBar.endEditing(true)
        self.fadedView.userInteractionEnabled = false
        self.fadedView.alpha = 0
    }
    
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "TutorDetails" {
            // Remove the back button's title by replacing the previous navigation bar's title
            navigationItem.title = ""
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)!
            let tutor = searchActive ? tutorsFilter![indexPath.row] : tutors![indexPath.row]
            let tutorDetailsViewController = segue.destinationViewController as! TutorDetailsViewController
            tutorDetailsViewController.tutor = tutor
        }
    }

    
    func customizeNavBar() {
        self.navigationItem.title = "Tutor Results"
    }
    
    @IBAction func onFilter(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func closeSaveSearchButton(sender: UIButton) {
        hideSaveSearchBar()
        self.rowCount == 0
    }
    
    func hideSaveSearchBar() {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            if self.saveSearchBarView.frame.origin.y != self.saveSearchBarOriginalY {
                self.saveSearchBarView.frame.origin.y += 30
            }
        })
    }
    
    func showSaveSearchBar() {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            if self.saveSearchBarView.frame.origin.y == self.saveSearchBarOriginalY {
                self.saveSearchBarView.frame.origin.y -= 30
            }
        })
    }
}
