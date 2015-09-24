//
//  TutorDetailsViewController.swift
//  TeachMe
//
//  Created by Clover on 9/20/15.
//  Copyright (c) 2015 Great White Shark. All rights reserved.
//

import UIKit


class TutorDetailsViewController: UIViewController {

    @IBOutlet weak var tutorImageView: UIImageView!
    @IBOutlet weak var tutorNameLabel: UILabel!
    @IBOutlet weak var pricePerHrLabel: UILabel!
    @IBOutlet weak var tutorRatingView: UIView!
    @IBOutlet weak var tutorUniversityLabel: UILabel!
    @IBOutlet weak var tutorMajorLabel: UILabel!
    @IBOutlet weak var tutorSubjectLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tutorAboutLabel: UILabel!
    
    var tutor: Tutor!
    
    override func viewWillAppear(animated: Bool) {
        navigationItem.title = "Tutor Details"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tutorNameLabel.text = tutor.name
        tutorImageView.setImageWithURL(tutor.imageURL)
        
        if tutor.pricePerHr != nil {
            pricePerHrLabel.text = "\(tutor.pricePerHr!)k/hr"
        } else {
            pricePerHrLabel.text = ""
        }
        
        tutorUniversityLabel.text = tutor.university
        
        if tutor.major != nil {
            tutorMajorLabel.text = "Major: \(tutor.major!)"
        } else {
            tutorMajorLabel.text = ""
        }
        
        
        if tutor.subjectsArray != nil && tutor.subjectsArray?.count != 0 {
            var subjects = ", ".join(tutor.subjectsArray!)
            if tutor.subjectsArray!.count < 2 {
                tutorSubjectLabel.text = "Subject: \(subjects)"
            } else {
                tutorSubjectLabel.text = "Subjects: \(subjects)"
            }
            
        } else {
            tutorSubjectLabel.text = "Subject: Not updated yet!"
        }
        
        tutorAboutLabel.text = tutor.about

        scrollView.contentSize.height = tutorAboutLabel.frame.height
        
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
