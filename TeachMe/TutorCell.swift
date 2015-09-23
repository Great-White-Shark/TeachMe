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
    @IBOutlet weak var tutorRatingLabel: UIView!
    @IBOutlet weak var tutorLocation: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fakeData() -> NSDictionary {
        var fakeDictionary: NSDictionary!
        fakeDictionary
    }

}
