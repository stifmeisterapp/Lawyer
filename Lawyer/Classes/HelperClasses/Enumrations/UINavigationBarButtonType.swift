//
//  UINavigationBarButtonType.swift
//  Lawyer
//
//  Created by Aman Kumar on 23/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
//MARK: - For UINavigationBarButtonType
enum UINavigationBarButtonType: Int {
    
    case back
    case empty
    
    //TODO : Set images according to UINavigationBarButtonType
    var iconImage: UIImage? {
        switch self {
        case .back: return #imageLiteral(resourceName: "leftChevron")
        case .empty: return UIImage()
        }
    }
}
