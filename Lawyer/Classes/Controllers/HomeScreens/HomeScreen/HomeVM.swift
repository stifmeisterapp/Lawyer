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
        let categories = [Category(image: #imageLiteral(resourceName: "Blogs"), title: ConstantTexts.AccidentsLT),
                          Category(image: #imageLiteral(resourceName: "Blogs"), title: ConstantTexts.BankingLT),
                          Category(image: #imageLiteral(resourceName: "Blogs"), title: ConstantTexts.BusinessLawyersLT),
                          Category(image: #imageLiteral(resourceName: "Blogs"), title: ConstantTexts.ChildCustodyLT),
                          Category(image: #imageLiteral(resourceName: "Blogs"), title: ConstantTexts.CivilLawyersLT),
                          Category(image: #imageLiteral(resourceName: "Blogs"), title: ConstantTexts.CommercialContractsLT),
                          Category(image: #imageLiteral(resourceName: "Blogs"), title: ConstantTexts.ConsumerGrivancesLT),
                          Category(image: #imageLiteral(resourceName: "Blogs"), title: ConstantTexts.CriminalLawyersLT),
                          Category(image: #imageLiteral(resourceName: "Blogs"), title: ConstantTexts.DishonourOfChequesLT),
                          Category(image: #imageLiteral(resourceName: "Blogs"), title: ConstantTexts.DivorceLT)]
        
        return CategoryListViewModel(categories: categories)
    }
    
    
}
