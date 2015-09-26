//
//  Tutor.swift
//  TeachMe
//
//  Created by Clover on 9/23/15.
//  Copyright (c) 2015 Great White Shark. All rights reserved.
//

import UIKit

class Tutor: NSObject {
    let name: String?
//    let DOB: NSDate?
    let gender: Bool? /* 0 = Female, 1 = Male */
    let imageURL: NSURL?
//    let availability: [NSDate]?
//    let location: String?
    let university: String?
    let major: String?
    let subjectsArray: [String]?
    let pricePerHr: Double?
    let about: String?
    var reviews: [TutorReview]?
    let subjectExpertise: String?
    let reviewCount: Int? /* reviewCount is also ratingCount */
    let ratingAverage: Double?
    let teachingHr: Double?
    
    init(dictionary: NSDictionary) {
        self.name = dictionary["tutor_name"] as? String
        
//        let DOBString = dictionary["date_of_birth"] as? String
//        self.DOB = dictionary["review_text"] as? String
        
        self.gender = dictionary["tutor_gender"] as? Bool
        
        let imageURLString = dictionary["image_url"] as? String
        if imageURLString != nil {
            self.imageURL = NSURL(string: imageURLString!)
        } else {
            self.imageURL = nil
        }

//        self.availability = dictionary[""] as? String
//        
//        self.location = dictionary[""] as? String
        
        self.university = dictionary["tutor_university"] as? String
        self.major = dictionary["tutor_major"] as? String
        
        
        self.subjectsArray = dictionary["tutor_teaching_subjects"] as? [String]

        self.pricePerHr = dictionary["tutor_price"] as? Double
        self.about = dictionary["tutor_about"] as? String
        self.subjectExpertise = dictionary["tutor_subject_expertise"] as? String
        
        let reviewDictionary = dictionary["tutor_reviews"] as? [NSDictionary]
        if reviewDictionary != nil {
            for reviewItem in reviewDictionary! {
                let review = TutorReview(dictionary: reviewItem)
                self.reviews!.append(review)
            }
        } else {
            self.reviews = nil
        }
        
        self.reviewCount = dictionary["review_count"] as? Int
        self.ratingAverage = dictionary["rating_average"] as? Double
        self.teachingHr = dictionary["teaching_hour"] as? Double
    }
    
    
    class func tutors(array array: [NSDictionary]) -> [Tutor] {
        var tutors = [Tutor]()
        for dictionary in array {
            let tutor = Tutor(dictionary: dictionary)
            tutors.append(tutor)
        }
        return tutors
    }
}
