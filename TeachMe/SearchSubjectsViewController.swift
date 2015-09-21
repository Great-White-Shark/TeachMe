//
//  SearchSubjectsViewController.swift
//  TeachMe
//
//  Created by Clover on 9/20/15.
//  Copyright (c) 2015 Great White Shark. All rights reserved.
//

import UIKit

class SearchSubjectsViewController: UIViewController, UISearchBarDelegate {

    lazy var searchBar: UISearchBar = UISearchBar(frame: CGRectMake(0, 0, 200, 20))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchBar.placeholder = "Search subjects. Try 'Algebra'..."
        self.navigationItem.titleView = searchBar
        self.searchBar.delegate = self
        
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
}
