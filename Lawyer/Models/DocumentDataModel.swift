//
//  DocumentDataModel.swift
//  Lawyer
//
//  Created by Aman Kumar on 06/09/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
class DocumentDataModel{
    var data:Data = Data()
    var type:String = String()
    var withName:String = String()
    var fileName:String = String()
    var mimeType:String = String()
    var isSelected:Bool = Bool()
    init(_ data:Data, _ type:String, _ withName:String, _ fileName:String, _ mimeType:String, _ isSelected:Bool){
        self.data = data
        self.type = type
        self.withName = withName
        self.fileName = fileName
        self.mimeType = mimeType
        self.isSelected = isSelected
    }
}
