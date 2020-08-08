//
//  FilterPopup_City_VM.swift
//  Lawyer
//
//  Created by Aman Kumar on 06/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
class FilterPopup_City_VM: FilterListModeling {
    
    static let shared = FilterPopup_City_VM()
    private init() {}
    
    
    //TODO: Prepare data source implementation
    func prepareDataSource() -> Filter_List_ViewModel {
        let filterCategoryList = Filter_List_ViewModel([Filter(title: "Gurugram", isSelected: Bool()),
        Filter(title: "Amadalavalasa (Amudalavalasa)", isSelected: Bool()),
        Filter(title: "Alipur", isSelected: Bool()),
        Filter(title: "Akkarampalle", isSelected: Bool()),
        Filter(title: "Anantapur", isSelected: Bool()),
        Filter(title: "Ambicapur Pt VI", isSelected: Bool()),
        Filter(title: "Abango", isSelected: Bool()),
        Filter(title: "Along", isSelected: Bool()),
        Filter(title: "Alinye", isSelected: Bool())])
        return filterCategoryList
    }
    
    
}
