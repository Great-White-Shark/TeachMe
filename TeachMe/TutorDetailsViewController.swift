//
//  TutorDetailsViewController.swift
//  TeachMe
//
//  Created by Clover on 9/20/15.
//  Copyright (c) 2015 Great White Shark. All rights reserved.
//

import UIKit


class TutorDetailsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var aboutTutorLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        navigationItem.title = "Teach Me"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize.height = aboutTutorLabel.frame.height
        
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
