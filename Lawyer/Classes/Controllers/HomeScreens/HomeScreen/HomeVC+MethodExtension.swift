//
//  HomeVC+MethodExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 20/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit
import Foundation

extension HomeVC{
    
    
    
    //TODO: Init values
    internal func initValues(){
        if customMethodManager == nil {
            customMethodManager = CustomMethodClass.shared
        }
        
        initialSetup()
        
    }
    
    
    
    //TODO: Intial setup implementation
    private func initialSetup(){
      
        self.view.backgroundColor = AppColor.tableBGColor
        self.viewLocationBackground.backgroundColor = AppColor.whiteColor
        
        self.customMethodManager?.provideShadowAndCornerRadius(self.viewLocationBackground, 0, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.placeholderColor, 2, 2, 2, 2, 0, AppColor.tableBGColor)
        
        self.labelLoationTitle.font = UIFont.systemFont(ofSize: 15.0)
        self.labelLoationTitle.textColor = AppColor.darkGrayColor
        self.labelLoationTitle.text = "\(ConstantTexts.YouAreInLT) \("Delhi")"
        self.imageViewLoction.setImageTintColor(AppColor.themeColor)
        self.imageViewDropDown.setImageTintColor(AppColor.darkGrayColor)
        
        self.categoryTableView.backgroundColor = AppColor.tableBGColor
        self.categoryTableView.separatorStyle = .none
        self.categoryTableView.hideEmptyCells()
        self.categoryTableView.isHidden = true
        self.categoryTableView.isScrollEnabled = true
        recheckDataModels()
        
    }
    
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.tabBarController?.tabBar.isHidden = false
        super.setupNavigationBarTitle(AppColor.themeColor,ConstantTexts.CategoriesHT, leftBarButtonsType: [.empty], rightBarButtonsType: [])
    }
    
    
    //TODO: Recheck data models implenemtation
    private func recheckDataModels(){
        if  self.homeVM == nil{
            self.homeVM = HomeVM()
        }
        
        if  self.categoryListVM == nil{
            self.categoryListVM = self.homeVM?.prepareDataSource()
        }
        
        self.categoryTableView.register(nib: LawyerTableViewCell.className)
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.categoryTableView.isHidden = false
            
            self.currentTableAnimation =  TableAnimation.fadeIn(duration: self.animationDuration, delay: self.delay)
            
            /* self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 60,duration: self.animationDuration, delay: self.delay) */
            
            self.categoryTableView.reloadData()
        }
        
        
    }
    
}
