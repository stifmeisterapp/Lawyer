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
        
        initialSetup()
        
    }
    
    //TODO: Intial setup implementation
    private func initialSetup(){

        self.view.backgroundColor = AppColor.tableBGColor
        
        self.lawyerTableView.separatorStyle = .none
        self.lawyerTableView.hideEmptyCells()
        self.lawyerTableView.isHidden = false
        self.lawyerTableView.isScrollEnabled = true
        self.lawyerTableView.backgroundColor = AppColor.tableBGColor
        
        self.viewBtnStackBG.backgroundColor = AppColor.themeColor
        
        self.viewList.backgroundColor = AppColor.passGreenColor
        self.customMethodManager?.provideCornerRadiusTo(self.viewList, self.viewList.frame.size.height/2, [.layerMinXMinYCorner, .layerMinXMaxYCorner])
        
        self.imageList.setImageTintColor(AppColor.whiteColor)
        
        self.labelList.font = UIFont.boldSystemFont(ofSize: 15)
        self.labelList.textColor = AppColor.whiteColor
        self.labelList.text = ConstantTexts.LIST_VIEW_BT

        self.viewMap.backgroundColor = AppColor.whiteColor
        self.customMethodManager?.provideCornerRadiusTo(self.viewMap, self.viewMap.frame.size.height/2, [.layerMaxXMinYCorner, .layerMaxXMaxYCorner])
        
        self.imageMap.setImageTintColor(AppColor.themeColor)
        
        self.labelMap.font = UIFont.boldSystemFont(ofSize: 15)
        self.labelMap.textColor = AppColor.textColor
        self.labelMap.text = ConstantTexts.MAP_VIEW_BT
        
        
        recheckDataModels()
        
    }
    
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.setupNavigationBarTitle(self.headerTitle, leftBarButtonsType: [.back], rightBarButtonsType: [])

    }
    
    
    //TODO: Recheck data models implenemtation
    private func recheckDataModels(){
        
        self.lawyerTableView.register(nib: LawyerShortDetailTableViewCell.className)
        
       /* DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.lawyerTableView.isHidden = false
            
            self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 260,duration: self.animationDuration, delay: self.delay)
            
            self.lawyerTableView.reloadData()
        } */
        
        
    }
    
}
