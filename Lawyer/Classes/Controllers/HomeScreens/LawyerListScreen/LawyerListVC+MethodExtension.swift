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
    
    //TODO: Intial setup implementation
    internal func initialSetup(){
        
        if customMethodManager == nil {
            customMethodManager = CustomMethodClass.shared
        }
        
        
        self.view.backgroundColor = UIColor(named: "CreamColor") ?? .clear
        
        self.lawyerTableView.separatorStyle = .none
        self.lawyerTableView.hideEmptyCells()
        self.lawyerTableView.isHidden = false
        self.lawyerTableView.isScrollEnabled = true
        self.lawyerTableView.backgroundColor = UIColor(named: "CreamColor") ?? .clear
        
        self.viewBtnStackBG.backgroundColor = UIColor(named: "LaunchColor") ?? .clear
        
        self.viewList.backgroundColor = UIColor(named: "GreenColor") ?? .clear
        self.customMethodManager?.provideCornerRadiusTo(self.viewList, self.viewList.frame.size.height/2, [.layerMinXMinYCorner, .layerMinXMaxYCorner])
        
        self.imageList.setImageTintColor(UIColor(named: "WhiteShadow") ?? .clear)
        
        self.labelList.font = UIFont.boldSystemFont(ofSize: 15)
        self.labelList.textColor = UIColor(named: "WhiteShadow") ?? .clear
        self.labelList.text = ConstantTexts.LIST_VIEW_BT

        self.viewMap.backgroundColor = UIColor(named: "WhiteShadow") ?? .clear
        self.customMethodManager?.provideCornerRadiusTo(self.viewMap, self.viewMap.frame.size.height/2, [.layerMaxXMinYCorner, .layerMaxXMaxYCorner])
        
        self.imageMap.setImageTintColor(UIColor(named: "LaunchColor") ?? .clear)
        
        self.labelMap.font = UIFont.boldSystemFont(ofSize: 15)
        self.labelMap.textColor = UIColor(named: "BlackColor") ?? .clear
        self.labelMap.text = ConstantTexts.MAP_VIEW_BT
        
        
        recheckDataModels()
        
    }
    
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.navigationItem.title = self.headerTitle
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "LaunchColor")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "WhiteShadow") ?? .clear]
        self.navigationController?.navigationBar.isTranslucent = false
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
