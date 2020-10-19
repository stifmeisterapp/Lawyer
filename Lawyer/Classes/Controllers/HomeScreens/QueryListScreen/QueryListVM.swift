//
//  QueryListVM.swift
//  Lawyer
//
//  Created by Aman Kumar on 14/10/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
class QueryListVM: QueryDataModeling {
    
    
    static let shared = QueryListVM()
    private init() {}
  
    
    func initDataSource() -> QueryDataViewListModel {
        return QueryDataViewListModel([QueryDataModel]())
    }
    
    func prepareDataSource(data: NSArray) -> QueryDataViewListModel {
        var queries:[QueryDataModel] = [QueryDataModel]()
        for item in data{
            if let itemDict = item as? NSDictionary{
                let query:QueryDataModel = QueryDataModel(Answer: [String](), Email: String(), FullName: String(), MobileNo: String(), Query: String(), Status: String(), isOpen: Bool())
                
                let Answer = itemDict.value(forKey: "Answer") as? String ?? ConstantTexts.QueryReso_LT
                query.Answer.append(Answer)
                
                if let Email = itemDict.value(forKey: "Email") as? String{
                    query.Email = Email
                }
                
                if let FullName = itemDict.value(forKey: "FullName") as? String{
                    query.FullName = FullName
                }
                
                if let MobileNo = itemDict.value(forKey: "MobileNo") as? String{
                    query.MobileNo = "\(MobileNo)"
                }
                
                if let MobileNo = itemDict.value(forKey: "MobileNo") as? Int{
                    query.MobileNo = "\(MobileNo)"
                }
                
                if let Query = itemDict.value(forKey: "Query") as? String{
                    query.Query = Query
                }
                
                if let Status = itemDict.value(forKey: "Status") as? String{
                    query.Status = Status
                }
                
                
                
                queries.append(query)
            }
        }
        
        return QueryDataViewListModel(queries)
    }
    
}
