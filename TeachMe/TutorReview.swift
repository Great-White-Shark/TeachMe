//
//  TutorReview.swift
//  TeachMe
//
//  Created by Clover on 9/23/15.
//  Copyright (c) 2015 Great White Shark. All rights reserved.
//

import UIKit

class TutorReview: NSObject {
    let reviewTitle: String?
    let reviewText: String?
    let reviewAuthor: String?
    let reviewRating: Double?
    
    init(dictionary: NSDictionary) {
        self.reviewTitle = dictionary["review_title"] as? String
        self.reviewText = dictionary["review_text"] as? String
        self.reviewAuthor = dictionary["review_author"] as? String
        self.reviewRating = dictionary["review_rating"] as? Double
    }
    
    
}
