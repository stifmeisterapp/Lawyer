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
    
    //TODO: Intial setup implementation
    internal func initialSetup(){
        
        if customMethodManager == nil {
            customMethodManager = CustomMethodClass.shared
        }
        
        self.view.backgroundColor = UIColor(named: "CreamColor") ?? .clear
        self.viewLocationBackground.backgroundColor = UIColor(named: "WhiteShadow") ?? .clear
        
        self.customMethodManager?.provideShadowAndCornerRadius(self.viewLocationBackground, 0, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], UIColor(named: "LightGrayColor") ?? .clear, 2, 2, 2, 2, 0, UIColor(named: "CreamColor") ?? .clear)
        
        self.labelLoationTitle.font = UIFont.systemFont(ofSize: 15.0)
        self.labelLoationTitle.textColor = UIColor(named: "DarkGrayColor") ?? .clear
        self.labelLoationTitle.text = "\(ConstantTexts.YouAreInLT) \("Delhi")"
        self.imageViewLoction.setImageTintColor(UIColor(named: "LaunchColor") ?? .clear)
        self.imageViewDropDown.setImageTintColor(UIColor(named: "DarkGrayColor") ?? .clear)
        
        self.categoryTableView.backgroundColor = UIColor(named: "CreamColor") ?? .clear
        self.categoryTableView.separatorStyle = .none
        self.categoryTableView.hideEmptyCells()
        self.categoryTableView.isHidden = true
        self.categoryTableView.isScrollEnabled = false
        recheckDataModels()
        
    }
    
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.navigationItem.title = ConstantTexts.CategoriesHT
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "LaunchColor")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "WhiteShadow") ?? .clear]
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
            
            self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: self.categoryTableView.frame.size.height / CGFloat(self.categoryListVM?.numberOfRowsInSection(0) ?? 0),duration: self.animationDuration, delay: self.delay)
            
            self.categoryTableView.reloadData()
        }
        
        
    }
    
}
