//
//  User_Data_Model.swift
//  Lawyer
//
//  Created by Aman Kumar on 18/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
class User_Data_Model {
    
    var DeviceId:String = String()
    var DeviceType:String = String()
    var Email:String = String()
    var FirebaseId:String = String()
    var Fullname:String = String()
    var Id:String = String()
    var IpAddress:String = String()
    var Mobile:String = String()
    var type:String = String()
    var Uuid:String = String()
    var token:String = String()
    
    init(DeviceId:String,DeviceType:String,Email:String,FirebaseId:String,Fullname:String,Id:String,IpAddress:String,Mobile:String,type:String,Uuid:String,token:String){
        
        self.DeviceId = DeviceId
        self.DeviceType = DeviceType
        self.Email = Email
        self.FirebaseId = FirebaseId
        self.Fullname = Fullname
        self.Id = Id
        self.IpAddress = IpAddress
        self.Mobile = Mobile
        self.type = type
        self.Uuid = Uuid
        self.token = token
        
        
    }
   
}
