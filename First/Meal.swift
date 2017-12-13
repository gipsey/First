//
//  Meal.swift
//  First
//
//  Created by David Debre on 12/8/17.
//  Copyright © 2017 David Debre. All rights reserved.
//

import os.log
import UIKit

class Meal : NSObject, NSCoding {
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: MealKeys.name)
        aCoder.encode(image, forKey: MealKeys.photo)
        aCoder.encode(rating, forKey: MealKeys.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: MealKeys.name) as? String else {
            os_log("Unable to decode the name for a Meal object", log: OSLog.default, type: .debug)
            return nil
        }
        
        let photo = aDecoder.decodeObject(forKey: MealKeys.photo) as? UIImage
        let rating = aDecoder.decodeInteger(forKey: MealKeys.rating)
        
        self.init(name, photo, rating)
    }
    
    struct MealKeys {
        
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    // MARK: Properties
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    var name: String
    var image: UIImage?
    var rating: Int
    
    init?(_ name: String, _ image: UIImage?, _ rating: Int) {
        guard !name.isEmpty else {
            return nil
        }
        
        guard rating >= 0 && rating <= 5 else {
            return nil
        }
        
        self.name = name
        self.image = image
        self.rating = rating
    }
}
