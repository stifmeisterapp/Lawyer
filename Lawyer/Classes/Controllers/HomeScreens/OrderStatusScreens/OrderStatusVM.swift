//
//  OrderStatusVM.swift
//  Lawyer
//
//  Created by Aman Kumar on 28/09/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
class OrderStatusVM: OrderStatusDataModeling {
    
    static let shared = OrderStatusVM()
    private init() {}
    
    func initDataSource() -> OrderStatusDataListViewModel {
        return OrderStatusDataListViewModel([OrderStatusViewModel]())
    }
    
    func prepareDataSource(data: NSDictionary) -> OrderStatusDataListViewModel {
        var orderStatus:[OrderStatusViewModel] = [OrderStatusViewModel]()
        
        if let Status = data.value(forKey: "Status") as? NSArray{
            var or_Status: OrderStatusViewModel = OrderStatusViewModel(isExpended: Bool(), isCompleted: Bool(), title: String(), values: [String]())
            for item in Status{
                if let itemDict = item as? NSDictionary{
                   /* if let id = itemDict.value(forKey: "id") as? String{
                        
                    }
                    
                    if let id = itemDict.value(forKey: "id") as? Int{
                        
                    } */
                    
                    if let name = itemDict.value(forKey: "name") as? String{
                        or_Status.title = name
                    }
                    
                }
            }
            
            if or_Status.title == "Payment Pending"{
                or_Status.isCompleted = Bool()
            }else{
                or_Status.isCompleted = true
            }
            
            
            orderStatus.append(or_Status)
            
        }
        
        if let id = data.value(forKey: "LawyerAssign") as? String{
            var or_Status: OrderStatusViewModel = OrderStatusViewModel(isExpended: Bool(), isCompleted: Bool(), title: ConstantTexts.Expert_AssignedLT, values: [String]())
            if id != "0"{
                or_Status.isCompleted = true
                if let LawyerName = data.value(forKey: "LawyerName") as? String{
                    let SupportEmail = data.value(forKey: "LawyerName") as? String ?? String()
                    or_Status.values.append("\(ConstantTexts.YourLegalExpert_LT_1)\(LawyerName)\(ConstantTexts.YourLegalExpert_LT_2)\(SupportEmail)")
                }
                
            }
            
            
            orderStatus.append(or_Status)
             
         }
         
         if let id = data.value(forKey: "LawyerAssign") as? Int{
            var or_Status: OrderStatusViewModel = OrderStatusViewModel(isExpended: Bool(), isCompleted: Bool(), title: ConstantTexts.Expert_AssignedLT, values: [String]())
            if id != 0{
                or_Status.isCompleted = true
                if let LawyerName = data.value(forKey: "LawyerName") as? String{
                    let SupportEmail = data.value(forKey: "LawyerName") as? String ?? String()
                    or_Status.values.append("\(ConstantTexts.YourLegalExpert_LT_1)\(LawyerName)\(ConstantTexts.YourLegalExpert_LT_2)\(SupportEmail)")
                }
                
            }
            
            orderStatus.append(or_Status)
         }
        
        orderStatus.append(OrderStatusViewModel(isExpended: Bool(), isCompleted: Bool(), title: ConstantTexts.OrderCompletedLT, values: [String]()))
        
        return OrderStatusDataListViewModel(orderStatus)
    }
    
    
}
