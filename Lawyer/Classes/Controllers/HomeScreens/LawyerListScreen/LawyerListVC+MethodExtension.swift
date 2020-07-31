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
        self.lawyerTableView.addSubview(self.refreshControl)
        recheckDataModels()
        
    }
    
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.tabBarController?.tabBar.isHidden = true
        super.setupNavigationBarTitle(self.headerTitle, leftBarButtonsType: [.back], rightBarButtonsType: [])

    }
    
    
    //TODO: Recheck data models implenemtation
    private func recheckDataModels(){
        
        self.lawyerTableView.register(nib: LawyerNewTableViewCell.className)
        
       /* DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.lawyerTableView.isHidden = false
            
            self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 260,duration: self.animationDuration, delay: self.delay)
            
            self.lawyerTableView.reloadData()
        } */
        
        
    }
    
}
