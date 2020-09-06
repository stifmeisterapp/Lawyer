//
//  CategoryListModeling.swift
//  Lawyer
//
//  Created by Aman Kumar on 21/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
protocol CategoryListModeling {
    //TODO: Prepare data source implementation
    func prepareDataSource() -> CategoryListViewModel
    //TODO: Prepare data static source implementation
    func prepareDataSourceStatic() -> CategoryListViewModel
    
}

extension CategoryListModeling{
    func prepareDataSourceStatic() -> CategoryListViewModel {
        return CategoryListViewModel(categories: [Category]())
    }
}
