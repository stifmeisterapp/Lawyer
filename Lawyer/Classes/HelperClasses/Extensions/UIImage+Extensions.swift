//
//  UIImage+Extensions.swift
//  Lawyer
//
//  Created by Aman Kumar on 01/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
extension UIImage{
    //TODO: Set image color
    func setImageTintWith(_ color:UIColor){
        self.withRenderingMode(.alwaysTemplate)
        self.withTintColor(color)
    }
}
