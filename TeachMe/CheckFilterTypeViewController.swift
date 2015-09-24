//
//  CheckFilterTypeViewController.swift
//  TeachMe
//
//  Created by Clover on 9/20/15.
//  Copyright (c) 2015 Great White Shark. All rights reserved.
//

import UIKit

class CheckFilterTypeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    lazy var searchBar: UISearchBar = UISearchBar(frame: CGRectMake(0, 0, 200, 20))
    @IBOutlet weak var fadedView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    /* filterBasedOn = 0 (University), 1 (Major), 2 (Subject) */
    var filterBasedOn: Int!
    
    var searchNames: [[String:AnyObject]]?
    var searchNamesFilter: [[String:AnyObject]]?
    var searchActive: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch (filterBasedOn) {
        case 0:
            searchNames = universityList() ?? []
        case 1:
            searchNames = majorList() ?? []
        default:
            searchNames = subjectList() ?? []
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UINib(nibName: "SwitchCell", bundle: nil), forCellReuseIdentifier: "SwitchCell")
        
        self.searchBar.placeholder = "Search"
        self.navigationItem.titleView = searchBar
        self.searchBar.delegate = self
        
        let fadedViewtapGestureRecognizer = UITapGestureRecognizer(target: self, action: "onFadedViewTap")
        self.fadedView.addGestureRecognizer(fadedViewtapGestureRecognizer)
        let fadedViewpanGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onFadedViewTap")
        self.fadedView.addGestureRecognizer(fadedViewpanGestureRecognizer)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // - Table View
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Select Subjects"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive {
            return searchNamesFilter!.count
        } else {
            return searchNames!.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("SwitchCell") as! SwitchCell
        if searchActive {
            cell.isChecked = searchNamesFilter![indexPath.row]["isChecked"] as! Bool
            cell.titleLabel.text = searchNamesFilter![indexPath.row]["name"] as? String
            
        } else {
            cell.isChecked = searchNames![indexPath.row]["isChecked"] as! Bool
            cell.titleLabel.text = searchNames![indexPath.row]["name"] as?
            String
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if searchActive {
            if searchNamesFilter![indexPath.row]["isChecked"] as! Bool == true {
                searchNamesFilter![indexPath.row]["isChecked"] = false
            } else {
                searchNamesFilter![indexPath.row]["isChecked"] = true
            }
            let tempCode = searchNamesFilter![indexPath.row]["code"] as? String
            for var i = 0; i < searchNames!.count; i++ {
                if tempCode == searchNames![i]["code"] as? String {
                    if searchNames![i]["isChecked"] as! Bool == true {
                        searchNames![i]["isChecked"] = false
                    } else {
                        searchNames![i]["isChecked"] = true
                    }
                }
            }
            
        } else {
            if searchNames![indexPath.row]["isChecked"] as! Bool == true {
                searchNames![indexPath.row]["isChecked"] = false
            } else {
                searchNames![indexPath.row]["isChecked"] = true
            }
        }
        
        let row = NSIndexPath(forRow: indexPath.row, inSection: 0)
        tableView.reloadRowsAtIndexPaths([row], withRowAnimation: UITableViewRowAnimation.Fade)
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
        searchNamesFilter = searchNames!.filter({ (searchNames) -> Bool in
            let tmpTitle = searchNames["name"] as? String
            let range = tmpTitle!.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return range != nil
        })
        
        
        if (searchText == "" && searchNamesFilter!.count == 0) {
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
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    func universityList() -> [[String:AnyObject]] {
        return [["code" : "ToanCaoCap1", "name" : "Toan Cao Cap 1", "isChecked" : false],
            ["code" : "ToanCaoCap2", "name" : "Toan Cao Cap 2", "isChecked" : false],
            ["code" : "ToanCaoCap3", "name" : "Toan Cao Cap 3", "isChecked" : false],
            ["code" : "ToanCaoCap4", "name" : "Toan Cao Cap 4", "isChecked" : false],
            ["code" : "ToanCaoCap5", "name" : "Toan Cao Cap 5", "isChecked" : false],
            ["code" : "ToanCaoCap6", "name" : "Toan Cao Cap 6", "isChecked" : false],
            ["code" : "ToanCaoCap7", "name" : "Toan Cao Cap 7", "isChecked" : false],
            ["code" : "ToanCaoCap8", "name" : "Toan Cao Cap 8", "isChecked" : false],
            ["code" : "ToanCaoCap9", "name" : "Toan Cao Cap 9", "isChecked" : false],
            ["code" : "ToanCaoCap10", "name" : "Toan Cao Cap 10", "isChecked" : false],
            ["code" : "ToanCaoCap11", "name" : "Toan Cao Cap 11", "isChecked" : false],
            ["code" : "ToanCaoCap12", "name" : "Toan Cao Cap 12", "isChecked" : false],
            ["code" : "ToanCaoCap13", "name" : "Toan Cao Cap 13", "isChecked" : false],
            ["code" : "ToanCaoCap14", "name" : "Toan Cao Cap 14", "isChecked" : false]]
    }
    func majorList() -> [[String:AnyObject]] {
        return [["code" : "ToanCaoCap1", "name" : "Toan Cao Cap 1", "isChecked" : false],
            ["code" : "ToanCaoCap2", "name" : "Toan Cao Cap 2", "isChecked" : false],
            ["code" : "ToanCaoCap3", "name" : "Toan Cao Cap 3", "isChecked" : false],
            ["code" : "ToanCaoCap4", "name" : "Toan Cao Cap 4", "isChecked" : false],
            ["code" : "ToanCaoCap5", "name" : "Toan Cao Cap 5", "isChecked" : false],
            ["code" : "ToanCaoCap6", "name" : "Toan Cao Cap 6", "isChecked" : false],
            ["code" : "ToanCaoCap7", "name" : "Toan Cao Cap 7", "isChecked" : false],
            ["code" : "ToanCaoCap8", "name" : "Toan Cao Cap 8", "isChecked" : false],
            ["code" : "ToanCaoCap9", "name" : "Toan Cao Cap 9", "isChecked" : false],
            ["code" : "ToanCaoCap10", "name" : "Toan Cao Cap 10", "isChecked" : false],
            ["code" : "ToanCaoCap11", "name" : "Toan Cao Cap 11", "isChecked" : false],
            ["code" : "ToanCaoCap12", "name" : "Toan Cao Cap 12", "isChecked" : false],
            ["code" : "ToanCaoCap13", "name" : "Toan Cao Cap 13", "isChecked" : false],
            ["code" : "ToanCaoCap14", "name" : "Toan Cao Cap 14", "isChecked" : false]]
    }
    
    func subjectList() -> [[String:AnyObject]] {
        return [["code" : "ToanCaoCap1", "name" : "Toan Cao Cap 1", "isChecked" : false],
            ["code" : "ToanCaoCap2", "name" : "Toan Cao Cap 2", "isChecked" : false],
            ["code" : "ToanCaoCap3", "name" : "Toan Cao Cap 3", "isChecked" : false],
            ["code" : "ToanCaoCap4", "name" : "Toan Cao Cap 4", "isChecked" : false],
            ["code" : "ToanCaoCap5", "name" : "Toan Cao Cap 5", "isChecked" : false],
            ["code" : "ToanCaoCap6", "name" : "Toan Cao Cap 6", "isChecked" : false],
            ["code" : "ToanCaoCap7", "name" : "Toan Cao Cap 7", "isChecked" : false],
            ["code" : "ToanCaoCap8", "name" : "Toan Cao Cap 8", "isChecked" : false],
            ["code" : "ToanCaoCap9", "name" : "Toan Cao Cap 9", "isChecked" : false],
            ["code" : "ToanCaoCap10", "name" : "Toan Cao Cap 10", "isChecked" : false],
            ["code" : "ToanCaoCap11", "name" : "Toan Cao Cap 11", "isChecked" : false],
            ["code" : "ToanCaoCap12", "name" : "Toan Cao Cap 12", "isChecked" : false],
            ["code" : "ToanCaoCap13", "name" : "Toan Cao Cap 13", "isChecked" : false],
            ["code" : "ToanCaoCap14", "name" : "Toan Cao Cap 14", "isChecked" : false]]
    }
}
