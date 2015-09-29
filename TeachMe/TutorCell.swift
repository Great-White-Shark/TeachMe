//
//  TutorCell.swift
//  TeachMe
//
//  Created by Clover on 9/22/15.
//  Copyright (c) 2015 Great White Shark. All rights reserved.
//

import UIKit

class TutorCell: UITableViewCell {
    
    @IBOutlet weak var tutorNameLabel: UILabel!
    @IBOutlet weak var tutorImageView: UIImageView!
    @IBOutlet weak var pricePerHrLabel: UILabel!
    @IBOutlet weak var tutorUniversityLabel: UILabel!
    @IBOutlet weak var tutorSubjectLabel: UILabel!
    @IBOutlet weak var tutorRatingView: FloatRatingView!
    @IBOutlet weak var tutorLocationLabel: UILabel!
    
    var tutor: Tutor! {
        didSet {
            tutorNameLabel.text = tutor.name
            tutorImageView.setImageWithURL(tutor.imageURL)
            
            if tutor.pricePerHr != nil {
                pricePerHrLabel.text = "\(tutor.pricePerHr!)k/hr"
            } else {
                pricePerHrLabel.text = ""
            }
            
            tutorUniversityLabel.text = tutor.university
            
            if tutor.subjectsArray != nil && tutor.subjectsArray?.count != 0 {
                let subjects = (tutor.subjectsArray!).joinWithSeparator(", ")
                if tutor.subjectsArray!.count < 2 {
                    tutorSubjectLabel.text = "Subject: \(subjects)"
                } else {
                    tutorSubjectLabel.text = "Subjects: \(subjects)"
                }
                
            } else {
                tutorSubjectLabel.text = "Subject: Not updated yet!"
            }
            
            tutorRatingView.contentMode = UIViewContentMode.ScaleAspectFit
            tutorRatingView.rating = tutor.ratingAverage as! Float
            
            tutorLocationLabel.text = "18Bis/14 NTMK"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
