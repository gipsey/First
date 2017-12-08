//
//  Meal.swift
//  First
//
//  Created by David Debre on 12/8/17.
//  Copyright © 2017 David Debre. All rights reserved.
//

import UIKit

class Meal {
    
    // MARK: Properties
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
