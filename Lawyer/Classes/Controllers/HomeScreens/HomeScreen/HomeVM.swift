//
//  HomeVM.swift
//  Lawyer
//
//  Created by Aman Kumar on 21/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
class HomeVM: CategoryListModeling {
    
    
    
    
    //TODO: Singleton object
    static let shared = HomeVM()
    private init() {}
    
    
    func prepareDataEmpty() -> CategoryListViewModel {
        return CategoryListViewModel(categories: [Category]())
    }
    
    //TODO: Prepare data source implementation
    //TODO: Dikhane ke daant
    func prepareDataSource() -> CategoryListViewModel {
        let categories = [Category(image: #imageLiteral(resourceName: "accident"), Url: String(), title: ConstantTexts.AccidentsLT, ExpertiseId: "1"),
                          Category(image: #imageLiteral(resourceName: "business_law"), Url: String(), title: ConstantTexts.BusinessLawyersLT, ExpertiseId: "3"),
                          Category(image: #imageLiteral(resourceName: "child_custody"), Url: String(), title: ConstantTexts.ChildCustodyLT, ExpertiseId: "4"),
                          Category(image: #imageLiteral(resourceName: "commercial_contract"), Url: String(), title: ConstantTexts.CommercialContractsLT, ExpertiseId: "6"),
                          Category(image: #imageLiteral(resourceName: "criminal"), Url: String(), title: ConstantTexts.CriminalLawyersLT, ExpertiseId: "9"),
                          Category(image: #imageLiteral(resourceName: "divorce"), Url: String(), title: ConstantTexts.DivorceLT, ExpertiseId: "11"),
                          Category(image: #imageLiteral(resourceName: "domestic_v"), Url: String(), title: ConstantTexts.DomesticVoilenceLT, ExpertiseId: "13"),
                          Category(image: #imageLiteral(resourceName: "Finanance_law"), Url: String(), title: ConstantTexts.FinanceLawLT, ExpertiseId: "16"),
                          Category(image: #imageLiteral(resourceName: "merrige_registration"), Url: String(), title: ConstantTexts.MerrigeRegistrationLT, ExpertiseId: "21"),
                          Category(image: #imageLiteral(resourceName: "property"), Url: String(), title: ConstantTexts.PropertyLT, ExpertiseId: "25"),
                          Category(image: #imageLiteral(resourceName: "sexual_abuse"), Url: String(), title: ConstantTexts.SexualAbuseLT, ExpertiseId: "28"),
                          Category(image: #imageLiteral(resourceName: "trademark_and_copying"), Url: String(), title: ConstantTexts.TrademarkLT, ExpertiseId: "32")]
        
        return CategoryListViewModel(categories: categories)
    }
    
    //TODO: Khane ke dant
    func prepareDataSourceStatic() -> CategoryListViewModel {
        let categories = [Category(image: UIImage(), Url: String(), title: ConstantTexts.AccidentsLT, ExpertiseId: "1"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.BankingLT, ExpertiseId: "2"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.BusinessLawyersLT, ExpertiseId: "3"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.ChildCustodyLT, ExpertiseId: "4"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.CivilLawyersLT, ExpertiseId: "5"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.CommercialContractsLT, ExpertiseId: "6"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.ConsumerGrivancesLT, ExpertiseId: "7"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.CovidLT, ExpertiseId: "8"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.CriminalLawyersLT, ExpertiseId: "9"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.DishonourOfChequesLT, ExpertiseId: "10"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.DivorceLT, ExpertiseId: "11"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.DocumentationLT, ExpertiseId: "12"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.DomesticVoilenceLT, ExpertiseId: "13"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.EmployementLT, ExpertiseId: "14"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.FamilyLT, ExpertiseId: "15"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.FinanceLawLT, ExpertiseId: "16"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.ImmigrationLT, ExpertiseId: "17"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.ITRLT, ExpertiseId: "18"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.LabourIssuesLT, ExpertiseId: "19"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.LandlordTenantLT, ExpertiseId: "20"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.MerrigeRegistrationLT, ExpertiseId: "21"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.MedicalNegligenceLT, ExpertiseId: "22"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.PersonalInjuryLT, ExpertiseId: "24"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.PropertyLT, ExpertiseId: "25"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.RaggingLT, ExpertiseId: "26"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.RecoveryLT, ExpertiseId: "27"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.SexualAbuseLT, ExpertiseId: "28"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.StampParerAndNotaryLT, ExpertiseId: "29"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.StartUpLT, ExpertiseId: "30"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.TaxLT, ExpertiseId: "31"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.TrademarkLT, ExpertiseId: "81"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.WillsLT, ExpertiseId: "33"),
                          Category(image: UIImage(), Url: String(), title: ConstantTexts.OthersLT, ExpertiseId: "23")]
        
        return CategoryListViewModel(categories: categories)
    }
    
    
    //TODO: Dikhane ke daant
    func prepareDataSourceWithJSON(data: NSArray,baseUrl:String) -> CategoryListViewModel {
        var categories = [Category]()
        for item in data{
            if let itemDict = item as? NSDictionary{
                var category = Category(image: UIImage(), Url: String(), title: String(), ExpertiseId: String())
                if let Id = itemDict.value(forKey: "Id") as? String {
                    category.ExpertiseId = Id
                }
                
                if let ImageUrl = itemDict.value(forKey: "ImageUrl") as? String {
                    category.Url = "\(baseUrl)\(ImageUrl)"
                }
                
                if let Name = itemDict.value(forKey: "Name") as? String {
                    category.title = Name
                }
                categories.append(category)
            }
        }
        
        return CategoryListViewModel(categories: categories)
        
    }
    
    
}
