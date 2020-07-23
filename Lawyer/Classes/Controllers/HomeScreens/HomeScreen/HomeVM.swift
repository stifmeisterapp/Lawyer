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
    
    
    //TODO: Prepare data source implementation
    func prepareDataSource() -> CategoryListViewModel {
        let categories = [Category(image: #imageLiteral(resourceName: "accident"), title: ConstantTexts.AccidentsLT),
                          Category(image: #imageLiteral(resourceName: "business_law"), title: ConstantTexts.BusinessLawyersLT),
                          Category(image: #imageLiteral(resourceName: "child_custody"), title: ConstantTexts.ChildCustodyLT),
                          Category(image: #imageLiteral(resourceName: "commercial_contract"), title: ConstantTexts.CommercialContractsLT),
                          Category(image: #imageLiteral(resourceName: "criminal"), title: ConstantTexts.CriminalLawyersLT),
                          Category(image: #imageLiteral(resourceName: "divorce"), title: ConstantTexts.DivorceLT),
                          Category(image: #imageLiteral(resourceName: "domestic_v"), title: ConstantTexts.DomesticVoilenceLT),
                          Category(image: #imageLiteral(resourceName: "Finanance_law"), title: ConstantTexts.FinanceLawLT),
                          Category(image: #imageLiteral(resourceName: "merrige_registration"), title: ConstantTexts.MerrigeRegistrationLT),
                          Category(image: #imageLiteral(resourceName: "property"), title: ConstantTexts.PropertyLT),
                          Category(image: #imageLiteral(resourceName: "sexual_abuse"), title: ConstantTexts.SexualAbuseLT),
                          Category(image: #imageLiteral(resourceName: "trademark_and_copying"), title: ConstantTexts.TrademarkLT)]
        
        return CategoryListViewModel(categories: categories)
    }
    
    
}
