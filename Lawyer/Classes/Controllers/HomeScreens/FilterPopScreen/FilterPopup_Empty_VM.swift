//
//  FilterPopup_Empty_VM.swift
//  Lawyer
//
//  Created by Aman Kumar on 07/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
class FilterPopup_Empty_VM: FilterListModeling {
    
    static let shared = FilterPopup_Empty_VM()
    private init() {}
    
    
    //TODO: Prepare data source implementation
    func prepareDataSource() -> Filter_List_ViewModel {
        let filterCategoryList = Filter_List_ViewModel([Filter(title: String(), isSelected: Bool())])
        return filterCategoryList
    }
    
    
}
