//
//  MoreVM.swift
//  Lawyer
//
//  Created by Aman Kumar on 08/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
class MoreVM: CategoryListModeling {
    //TODO: Singleton object
    static let shared = MoreVM()
    private init() {}
    
    //TODO: Prepare data source implementation
    func prepareDataSource() -> CategoryListViewModel {
        let categories = [Category(image: #imageLiteral(resourceName: "GoogleBlogSearch100px").maskWithColor(color: AppColor.themeColor) ?? UIImage(), title: ConstantTexts.BlogsLT),
                          Category(image: #imageLiteral(resourceName: "Comments96px1").maskWithColor(color: AppColor.themeColor) ?? UIImage(), title: ConstantTexts.FAQs_LT),
                          Category(image: #imageLiteral(resourceName: "Share96px1").maskWithColor(color: AppColor.themeColor) ?? UIImage(), title: ConstantTexts.Share_LT),
                          Category(image: #imageLiteral(resourceName: "icons8_Bank_Cards_100px").maskWithColor(color: AppColor.themeColor) ?? UIImage(), title: ConstantTexts.Custom_Payment_LT),
                          Category(image: #imageLiteral(resourceName: "Rating96px").maskWithColor(color: AppColor.themeColor) ?? UIImage(), title: ConstantTexts.RateUs_LT),
                          Category(image: #imageLiteral(resourceName: "About100px").maskWithColor(color: AppColor.themeColor) ?? UIImage(), title: ConstantTexts.AboutUs_LT),
                          Category(image: #imageLiteral(resourceName: "Call96px").maskWithColor(color: AppColor.themeColor) ?? UIImage(), title: ConstantTexts.ContactUs_LT),
                          Category(image: #imageLiteral(resourceName: "translation").maskWithColor(color: AppColor.themeColor) ?? UIImage(), title: ConstantTexts.LanguageLT),
                          Category(image: #imageLiteral(resourceName: "LogoutRoundedUp96px").maskWithColor(color: AppColor.themeColor) ?? UIImage(), title: ConstantTexts.LogOut_LT)]
        
        return CategoryListViewModel(categories: categories)
    }
    
    
}
