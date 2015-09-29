//
//  fakeData.swift
//  TeachMe
//
//  Created by Clover on 9/24/15.
//  Copyright (c) 2015 Great White Shark. All rights reserved.
//

import Foundation

class fakeData: NSObject {
    
    class var sharedInstance: fakeData {
        struct Static {
            static let instance = fakeData()
        }
        
        return Static.instance
    }
    
    func generateData() -> [NSDictionary] {
        var data: [NSDictionary]
        data = [getData(0)]
        
        for var i = 1; i < 30; i++ {
            data.append(getData(i))
        }
        return data
    }
    
    func getData(int: Int?) -> NSDictionary {
        var fakeDictionary = [String:AnyObject]()
        fakeDictionary["tutor_name"] = "\(int!*8) Charles Lee"
        fakeDictionary["tutor_gender"] = 1 - int!%2
        fakeDictionary["image_url"] = "https://res.cloudinary.com/hrscywv4p/image/upload/c_limit,f_auto,h_3000,q_90,w_1200/Luvocracy_327_1_x8yw9e.jpg"
        fakeDictionary["tutor_university"] = "\(int!) UC Berkeley"
        fakeDictionary["tutor_major"] = "\(int!) Computer Science"
        fakeDictionary["tutor_teaching_subjects"] = ["\(int!*110) Swift", "\(int!*1100) Java", "\(int!*11000)Surfing"]
        fakeDictionary["tutor_price"] = 500 - int!*13
        fakeDictionary["tutor_about"] = "\(int!) I graduated with a degree in Computer Science from UC Berkeley in 2006, and have 10+ years of being a software engineer in Silicon Valley.\n\nI've worked at three startups, all of which had successful exits. I was one of the first engineers at Luvocracy, a social e-commerce company which was acquired by Walmart.com after raising $11 million in funding from Kleiner Perkins.\n\nI was also the second engineer hired at venture-backed local recommendations startup GemShare, which was acquired by the social networking site NextDoor in early 2015.\n\nThe past year I've been working with startups CodePath and Bloc teaching iOS, Ruby on Rails, Javascript, and Java.\n\nYou can read more about me on my LinkedIn profile at https://www.linkedin.com/in/charleslee5."
        fakeDictionary["tuto_reviews"] = [["review_title": "\(int!) Great", "review_text": "\(int!) Charles is so nice and supportive", "review_author": "\(int!) Great White Shark", "review_rating": 4 + int!],["review_title": "\(int!) Great", "review_text": "\(int!*100) Charles is so nice and supportive", "review_author": "\(int!*100) Great White Shark", "review_rating": int!%5]]
        fakeDictionary["review_count"] = 2
        fakeDictionary["rating_average"] = Double(int!%6) * 0.88
        fakeDictionary["teaching_hour"] = 100.5 - Double(int!*10)
        return fakeDictionary
    }
    
}