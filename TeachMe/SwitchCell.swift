//
//  SwitchCell.swift
//  TeachMe
//
//  Created by Clover on 9/21/15.
//  Copyright (c) 2015 Great White Shark. All rights reserved.
//

import UIKit

class SwitchCell: UITableViewCell {
    
    @IBOutlet weak var checkedImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    let checkedImage = UIImage(named: "checked")
    let uncheckedImage = UIImage(named: "unchecked")
    var _isChecked = false
    var isChecked: Bool {
        get {
            return _isChecked
        }
        set {
            _isChecked = newValue
            if _isChecked == true {
                checkedImageView.image = checkedImage
            } else {
                checkedImageView.image = uncheckedImage
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
