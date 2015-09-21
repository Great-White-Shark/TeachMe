//
//  TutorResultsViewController.swift
//  TeachMe
//
//  Created by Clover on 9/19/15.
//  Copyright (c) 2015 Great White Shark. All rights reserved.
//

import UIKit

class TutorResultsViewController: UIViewController, UITabBarDelegate {

    @IBOutlet weak var tabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeNavBar()
        tabBar.delegate = self
        tabBar.selectedItem = tabBar.items?.first as? UITabBarItem
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
    
    func customizeNavBar() {
        self.navigationItem.title = "Tutor Results"
    }
    
    @IBAction func onFilter(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
