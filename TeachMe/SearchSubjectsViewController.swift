//
//  SearchSubjectsViewController.swift
//  TeachMe
//
//  Created by Clover on 9/20/15.
//  Copyright (c) 2015 Great White Shark. All rights reserved.
//

import UIKit

class SearchSubjectsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    lazy var searchBar: UISearchBar = UISearchBar(frame: CGRectMake(0, 0, 200, 20))
    @IBOutlet weak var fadedView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var subjectNames: [[String:AnyObject]] = []
    var subjectNamesFilter: [[String:AnyObject]]?
    var searchActive: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        subjectNames = subjectList()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UINib(nibName: "SwitchCell", bundle: nil), forCellReuseIdentifier: "SwitchCell")
        
        self.searchBar.placeholder = "Try 'Algebra'..."
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
            return subjectNamesFilter!.count
        } else {
            return subjectNames.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("SwitchCell") as! SwitchCell
        if searchActive {
            cell.isChecked = subjectNamesFilter![indexPath.row]["isChecked"] as! Bool
            cell.titleLabel.text = subjectNamesFilter![indexPath.row]["name"] as? String

        } else {
            cell.isChecked = subjectNames[indexPath.row]["isChecked"] as! Bool
            cell.titleLabel.text = subjectNames[indexPath.row]["name"] as?
            String
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if searchActive {
            if subjectNamesFilter![indexPath.row]["isChecked"] as! Bool == true {
                subjectNamesFilter![indexPath.row]["isChecked"] = false
            } else {
                subjectNamesFilter![indexPath.row]["isChecked"] = true
            }
            let tempCode = subjectNamesFilter![indexPath.row]["code"] as? String
            for var i = 0; i < subjectNames.count; i++ {
                if tempCode == subjectNames[i]["code"] as? String {
                    if subjectNames[i]["isChecked"] as! Bool == true {
                        subjectNames[i]["isChecked"] = false
                    } else {
                        subjectNames[i]["isChecked"] = true
                    }
                }
            }

        } else {
            if subjectNames[indexPath.row]["isChecked"] as! Bool == true {
                subjectNames[indexPath.row]["isChecked"] = false
            } else {
                subjectNames[indexPath.row]["isChecked"] = true
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
        subjectNamesFilter = subjectNames.filter({ (subjectNames) -> Bool in
            let tmpTitle = subjectNames["name"] as? String
            let range = tmpTitle!.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return range != nil
        })
        
        
        if (searchText == "" && subjectNamesFilter!.count == 0) {
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

    @IBAction func onDoneButton(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onCancelButton(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
