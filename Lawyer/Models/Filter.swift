//
//  Filter.swift
//  Lawyer
//
//  Created by Aman Kumar on 04/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
// MARK: - Filter Struct
class Filter{
    var title:String = String()
    var isSelected:Bool = Bool()
    
    //TODO: For custom methods
    init(title:String,isSelected:Bool) {
        self.title = title
        self.isSelected = isSelected
    }
    
}
