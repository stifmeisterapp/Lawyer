//
//  LawyerListVC+MethodExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 21/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit
import Foundation
import ViewAnimator

extension LawyerListVC{
    
       //TODO: Navigation setup implenemtation
       internal func navSetup(){
           self.tabBarController?.tabBar.isHidden = true
           super.setupNavigationBarTitle(AppColor.themeColor,self.headerTitle, leftBarButtonsType: [.back], rightBarButtonsType: [])

       }
       
    
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

        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        self.view.backgroundColor = AppColor.tableBGColor
        
        self.viewFilterBG.backgroundColor = AppColor.whiteColor
        
        self.customMethodManager?.provideShadowAndCornerRadius(self.viewFilterBG, 3, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.placeholderColor, 2, 2, 2, 2, 0, AppColor.clearColor)
        
        self.txtSearch.addBorders(edges: [.top,.bottom,.left], color: AppColor.placeholderColor, inset: 0.0, thickness: 1.0)
        self.txtSearch.font = AppFont.Regular.size(AppFontName.OpenSans, size: 12)
        self.txtSearch.placeholder = ConstantTexts.KeywordsPH
        self.txtSearch.textColor = AppColor.textColor
        self.txtSearch.addPadding(.both(10.0))
        
        self.txtSearch.maxLength = 50
        self.txtSearch.keyboardType = .default
        self.txtSearch.isSecureTextEntry = false
        self.txtSearch.autocapitalizationType = .none
        
        
        
        
        self.btnSearchRef.addBorders(edges: [.top,.bottom,.left,.right], color: AppColor.placeholderColor, inset: 0.0, thickness: 1.0)
        self.btnSearchRef.tintColor = AppColor.whiteColor
        self.btnSearchRef.backgroundColor = AppColor.themeColor
        
        self.btnFilterRef.backgroundColor = AppColor.tableBGColor
        self.btnFilterRef.titleLabel?.font = AppFont.Bold.size(AppFontName.OpenSans, size: 12)
        self.btnFilterRef.setTitle(ConstantTexts.ClearFiltersBT, for: .normal)
        self.btnFilterRef.setTitleColor(AppColor.darkGrayColor, for: .normal)
        
        self.lawyerTableView.separatorStyle = .none
        self.lawyerTableView.hideEmptyCells()
        self.lawyerTableView.isHidden = true
        self.lawyerTableView.isScrollEnabled = true
        self.lawyerTableView.backgroundColor = AppColor.tableBGColor
        self.lawyerTableView.addSubview(self.refreshControl)
        
        self.filterCollectionView.showsHorizontalScrollIndicator = false
        self.filterCollectionView.isHidden = true
        self.filterCollectionView.isUserInteractionEnabled = true
        
        self.txtSearch.isHidden = true
        self.btnFilterRef.isHidden = true
        self.btnFilterRef.isHidden = true
        self.viewFilterBG.isHidden = true
        recheckDataModels()
        
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
    
    //TODO: Animate rotate collection view
    internal func animateView(){
        self.viewFilterBG.isHidden = false
        self.txtSearch.isHidden = false
        self.btnFilterRef.isHidden = false
        self.btnFilterRef.isHidden = false
        self.filterCollectionView.isHidden = false
        self.lawyerTableView.isHidden = false
        UIView.animate(views: filterCollectionView.visibleCells,
        animations: [zoomAnimation, rotateAnimation],
        duration: 0.5)
        
        UIView.animate(views: [self.txtSearch,self.btnSearchRef,btnFilterRef], animations: [zoomAnimation, rotateAnimation],
        duration: 0.5)
        
        UIView.animate(views: lawyerTableView.visibleCells,
        animations: [fromAnimation], delay: 0.5)
        
    }
    
    
    //TODO: Animate rotate collection view
    internal func setFilterArray(filter:[Filter],entity:String){
        
        for item in filter{
            var flag = Bool()
            for mainItem in self.filters{
                if item.id == mainItem.id{
                   flag = true
                    break
                }
            }
            
            if flag{
                self.filters.append(item)
            }
            
        }
        
        //Neeche wala collectionview update kar dena
        
        
        
        
    }
    
    
}
