//
//  FilterPopup_Expertise_VM.swift
//  Lawyer
//
//  Created by Aman Kumar on 06/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
class FilterPopup_Expertise_VM: FilterListModeling {
    
    static let shared = FilterPopup_Expertise_VM()
    private init() {}
    
    
    //TODO: Prepare data source implementation
    func prepareDataSource() -> Filter_List_ViewModel {
        let filterCategoryList = Filter_List_ViewModel([Filter(title: ConstantTexts.AccidentsLT, isSelected: Bool()),
        Filter(title: ConstantTexts.BusinessLawyersLT, isSelected: Bool()),
        Filter(title: ConstantTexts.ChildCustodyLT, isSelected: Bool()),
        Filter(title: ConstantTexts.CommercialContractsLT, isSelected: Bool()),
        Filter(title: ConstantTexts.CriminalLawyersLT, isSelected: Bool()),
        Filter(title: ConstantTexts.DivorceLT, isSelected: Bool()),
        Filter(title: ConstantTexts.DomesticVoilenceLT, isSelected: Bool()),
        Filter(title: ConstantTexts.FinanceLawLT, isSelected: Bool()),
        Filter(title: ConstantTexts.MerrigeRegistrationLT, isSelected: Bool()),
        Filter(title: ConstantTexts.PropertyLT, isSelected: Bool()),
        Filter(title: ConstantTexts.SexualAbuseLT, isSelected: Bool()),
        Filter(title: ConstantTexts.TrademarkLT, isSelected: Bool())])
        return filterCategoryList
    }
    
    
}
