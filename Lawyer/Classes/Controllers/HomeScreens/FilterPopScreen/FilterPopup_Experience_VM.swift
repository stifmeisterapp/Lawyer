//
//  FilterPopup_Experience_VM.swift
//  Lawyer
//
//  Created by Aman Kumar on 06/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
class FilterPopup_Experience_VM: FilterListModeling {
    
    static let shared = FilterPopup_Experience_VM()
    private init() {}
    
    
    //TODO: Prepare data source implementation
    func prepareDataSource() -> Filter_List_ViewModel {
        let filterCategoryList = Filter_List_ViewModel([Filter(title: "6 months", isSelected: Bool()),
        Filter(title: "1-2 years", isSelected: Bool()),
        Filter(title: "3-5 years", isSelected: Bool()),
        Filter(title: "5-7 years", isSelected: Bool())])
        return filterCategoryList
    }
    
    
}
