//
//  FilterPopup_Language_VM.swift
//  Lawyer
//
//  Created by Aman Kumar on 06/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
class FilterPopup_Language_VM: FilterListModeling {
    
    static let shared = FilterPopup_Language_VM()
    private init() {}
    
    
    //TODO: Prepare data source implementation
    func prepareDataSource() -> Filter_List_ViewModel {
        let filterCategoryList = Filter_List_ViewModel([Filter(title: "Assamese (অসমীয়া)", isSelected: Bool()),
        Filter(title: "Bengali (বাংলা)", isSelected: Bool()),
        Filter(title: "English (UK)", isSelected: Bool()),
        Filter(title: "Bodo", isSelected: Bool()),
        Filter(title: "Dogri", isSelected: Bool()),
        Filter(title: "Gujrati (ગુજરાતી)", isSelected: Bool()),
        Filter(title: "Hindi (हिन्दी)", isSelected: Bool()),
        Filter(title: "Kashmiri", isSelected: Bool())])
        return filterCategoryList
    }
    
    
}
