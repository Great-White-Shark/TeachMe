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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
