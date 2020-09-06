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
    
    //TODO: Prepare data source implementation
    //TODO: Dikhane ke daant
    func prepareDataSource() -> CategoryListViewModel {
        let categories = [Category(image: #imageLiteral(resourceName: "accident"), title: ConstantTexts.AccidentsLT, ExpertiseId: "1"),
                          Category(image: #imageLiteral(resourceName: "business_law"), title: ConstantTexts.BusinessLawyersLT, ExpertiseId: "3"),
                          Category(image: #imageLiteral(resourceName: "child_custody"), title: ConstantTexts.ChildCustodyLT, ExpertiseId: "4"),
                          Category(image: #imageLiteral(resourceName: "commercial_contract"), title: ConstantTexts.CommercialContractsLT, ExpertiseId: "6"),
                          Category(image: #imageLiteral(resourceName: "criminal"), title: ConstantTexts.CriminalLawyersLT, ExpertiseId: "9"),
                          Category(image: #imageLiteral(resourceName: "divorce"), title: ConstantTexts.DivorceLT, ExpertiseId: "11"),
                          Category(image: #imageLiteral(resourceName: "domestic_v"), title: ConstantTexts.DomesticVoilenceLT, ExpertiseId: "13"),
                          Category(image: #imageLiteral(resourceName: "Finanance_law"), title: ConstantTexts.FinanceLawLT, ExpertiseId: "16"),
                          Category(image: #imageLiteral(resourceName: "merrige_registration"), title: ConstantTexts.MerrigeRegistrationLT, ExpertiseId: "21"),
                          Category(image: #imageLiteral(resourceName: "property"), title: ConstantTexts.PropertyLT, ExpertiseId: "25"),
                          Category(image: #imageLiteral(resourceName: "sexual_abuse"), title: ConstantTexts.SexualAbuseLT, ExpertiseId: "28"),
                          Category(image: #imageLiteral(resourceName: "trademark_and_copying"), title: ConstantTexts.TrademarkLT, ExpertiseId: "32")]
        
        return CategoryListViewModel(categories: categories)
    }
    
    //TODO: Khane ke dant
    func prepareDataSourceStatic() -> CategoryListViewModel {
        let categories = [Category(image: UIImage(), title: ConstantTexts.AccidentsLT, ExpertiseId: "1"),
                          Category(image: UIImage(), title: ConstantTexts.BankingLT, ExpertiseId: "2"),
                          Category(image: UIImage(), title: ConstantTexts.BusinessLawyersLT, ExpertiseId: "3"),
                          Category(image: UIImage(), title: ConstantTexts.ChildCustodyLT, ExpertiseId: "4"),
                          Category(image: UIImage(), title: ConstantTexts.CivilLawyersLT, ExpertiseId: "5"),
                          Category(image: UIImage(), title: ConstantTexts.CommercialContractsLT, ExpertiseId: "6"),
                          Category(image: UIImage(), title: ConstantTexts.ConsumerGrivancesLT, ExpertiseId: "7"),
                          Category(image: UIImage(), title: ConstantTexts.CovidLT, ExpertiseId: "8"),
                          Category(image: UIImage(), title: ConstantTexts.CriminalLawyersLT, ExpertiseId: "9"),
                          Category(image: UIImage(), title: ConstantTexts.DishonourOfChequesLT, ExpertiseId: "10"),
                          Category(image: UIImage(), title: ConstantTexts.DivorceLT, ExpertiseId: "11"),
                          Category(image: UIImage(), title: ConstantTexts.DocumentationLT, ExpertiseId: "12"),
                          Category(image: UIImage(), title: ConstantTexts.DomesticVoilenceLT, ExpertiseId: "13"),
                          Category(image: UIImage(), title: ConstantTexts.EmployementLT, ExpertiseId: "14"),
                          Category(image: UIImage(), title: ConstantTexts.FamilyLT, ExpertiseId: "15"),
                          Category(image: UIImage(), title: ConstantTexts.FinanceLawLT, ExpertiseId: "16"),
                          Category(image: UIImage(), title: ConstantTexts.ImmigrationLT, ExpertiseId: "17"),
                          Category(image: UIImage(), title: ConstantTexts.ITRLT, ExpertiseId: "18"),
                          Category(image: UIImage(), title: ConstantTexts.LabourIssuesLT, ExpertiseId: "19"),
                          Category(image: UIImage(), title: ConstantTexts.LandlordTenantLT, ExpertiseId: "20"),
                          Category(image: UIImage(), title: ConstantTexts.MerrigeRegistrationLT, ExpertiseId: "21"),
                          Category(image: UIImage(), title: ConstantTexts.MedicalNegligenceLT, ExpertiseId: "22"),
                          Category(image: UIImage(), title: ConstantTexts.PersonalInjuryLT, ExpertiseId: "24"),
                          Category(image: UIImage(), title: ConstantTexts.PropertyLT, ExpertiseId: "25"),
                          Category(image: UIImage(), title: ConstantTexts.RaggingLT, ExpertiseId: "26"),
                          Category(image: UIImage(), title: ConstantTexts.RecoveryLT, ExpertiseId: "27"),
                          Category(image: UIImage(), title: ConstantTexts.SexualAbuseLT, ExpertiseId: "28"),
                          Category(image: UIImage(), title: ConstantTexts.StampParerAndNotaryLT, ExpertiseId: "29"),
                          Category(image: UIImage(), title: ConstantTexts.StartUpLT, ExpertiseId: "30"),
                          Category(image: UIImage(), title: ConstantTexts.TaxLT, ExpertiseId: "31"),
                          Category(image: UIImage(), title: ConstantTexts.TrademarkLT, ExpertiseId: "32"),
                          Category(image: UIImage(), title: ConstantTexts.WillsLT, ExpertiseId: "33"),
                          Category(image: UIImage(), title: ConstantTexts.OthersLT, ExpertiseId: "23")]
        
        return CategoryListViewModel(categories: categories)
    }
    
    
    
    
    
}
