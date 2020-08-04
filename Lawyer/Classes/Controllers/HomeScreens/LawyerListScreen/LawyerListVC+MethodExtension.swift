//
//  LawyerListVC+MethodExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 21/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit
import Foundation

extension LawyerListVC{
    
    
    //TODO: Init values
    internal func initValues(){
        if customMethodManager == nil {
            customMethodManager = CustomMethodClass.shared
        }
        
        if self.filterCategoryListVM == nil {
            self.filterCategoryListVM = LawyerListCategoryList_VM.shared
        }
        
        if filterCategoryListDataVM == nil {
            filterCategoryListDataVM = filterCategoryListVM?.prepareDataSource()
        }
      
        initialSetup()
        
    }
    
    //TODO: Intial setup implementation
    private func initialSetup(){

        self.view.backgroundColor = AppColor.tableBGColor
        
        self.viewFilterBG.backgroundColor = AppColor.whiteColor
        
        self.customMethodManager?.provideShadowAndCornerRadius(self.viewFilterBG, 3, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.placeholderColor, 2, 2, 2, 2, 0, AppColor.clearColor)
        
        self.txtSearch.addBorders(edges: [.top,.bottom,.left], color: AppColor.placeholderColor, inset: 0.0, thickness: 1.0)
        self.txtSearch.font = AppFont.Regular.size(AppFontName.OpenSans, size: 12)
        self.txtSearch.placeholder = ConstantTexts.KeywordsPH
        self.txtSearch.textColor = AppColor.darkGrayColor
        self.txtSearch.addPadding(.both(10.0))
        
        self.btnSearchRef.addBorders(edges: [.top,.bottom,.left,.right], color: AppColor.placeholderColor, inset: 0.0, thickness: 1.0)
        self.btnSearchRef.tintColor = AppColor.whiteColor
        self.btnSearchRef.backgroundColor = AppColor.themeColor
        
        self.btnFilterRef.backgroundColor = AppColor.tableBGColor
        self.btnFilterRef.titleLabel?.font = AppFont.Semibold.size(AppFontName.OpenSans, size: 12)
        self.btnFilterRef.setTitle(ConstantTexts.ClearFiltersBT, for: .normal)
        self.btnFilterRef.setTitleColor(AppColor.darkGrayColor, for: .normal)
        
        self.lawyerTableView.separatorStyle = .none
        self.lawyerTableView.hideEmptyCells()
        self.lawyerTableView.isHidden = false
        self.lawyerTableView.isScrollEnabled = true
        self.lawyerTableView.backgroundColor = AppColor.tableBGColor
        self.lawyerTableView.addSubview(self.refreshControl)
        
        self.filterCollectionView.showsHorizontalScrollIndicator = false
        
        recheckDataModels()
        
    }
    
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.tabBarController?.tabBar.isHidden = true
        super.setupNavigationBarTitle(AppColor.themeColor,self.headerTitle, leftBarButtonsType: [.back], rightBarButtonsType: [])

    }
    
    
    //TODO: Recheck data models implenemtation
    private func recheckDataModels(){
        registerNib()
        
        
       /* DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.lawyerTableView.isHidden = false
            
            self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 260,duration: self.animationDuration, delay: self.delay)
            
            self.lawyerTableView.reloadData()
        } */
        
        
    }
    
    //TODO: register nib file
    private func registerNib(){
        /* For Tableview
        self.categoryTableView.register(nib: LawyerTableViewCell.className)
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.categoryTableView.isHidden = false
            
            self.currentTableAnimation =  TableAnimation.fadeIn(duration: self.animationDuration, delay: self.delay)
            
            /* self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 60,duration: self.animationDuration, delay: self.delay) */
            
            self.categoryTableView.reloadData()
        } */
        
        self.filterCollectionView.register(nib: FilterCollectionViewCell.className)
        self.lawyerTableView.register(nib: LawyerNewTableViewCell.className)
        
    }
    
}
