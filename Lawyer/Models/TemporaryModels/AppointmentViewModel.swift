//
//  AppointmentViewModel.swift
//  Lawyer
//
//  Created by Aman Kumar on 07/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
class AppointmentViewModel{
    var image:UIImage = UIImage()
    var headerTitle:String = String()
    var list:[AppointmentTimeDataModel] = [AppointmentTimeDataModel]()
    
    init(_ image: UIImage, _ headerTitle: String, _ list: [AppointmentTimeDataModel]){
        self.image = image
        self.headerTitle = headerTitle
        self.list = list
        
    }
    
}

class AppointmentTimeDataModel{
    var title: String = String()
    var isSelected:Bool = Bool()
    
    init(_ title: String, _ isSelected:Bool){
        self.title = title
        self.isSelected = isSelected
        
    }
    
}
