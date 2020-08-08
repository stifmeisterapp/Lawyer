//
//  HomeVC+MethodExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 20/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit
import Foundation
import ViewAnimator

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
        
        self.imageViewLoction.setImageTintColor(AppColor.darkGrayColor)
        
        self.labelLoationTitle.font = AppFont.Regular.size(AppFontName.OpenSans, size: 12)
        self.labelLoationTitle.textColor = AppColor.darkGrayColor
        self.labelLoationTitle.text = "\(ConstantTexts.YouAreInLT) \("Delhi")"
        self.imageViewDropDown.setImageTintColor(AppColor.darkGrayColor)
        
        // For Tableview
        self.categoryTableView.backgroundColor = AppColor.tableBGColor
        self.categoryTableView.separatorStyle = .singleLine
        self.categoryTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.categoryTableView.hideEmptyCells()
        self.categoryTableView.isHidden = true
        self.categoryTableView.isScrollEnabled = true
        
        
        /* For Collection view
        self.categoryCollectionView.backgroundColor = AppColor.tableBGColor */
        
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
            self.homeVM = HomeVM.shared
        }
        
        if  self.categoryListVM == nil{
            self.categoryListVM = self.homeVM?.prepareDataSource()
        }
        
        registerNib()
        
    }
    
    //TODO: register nib file
    private func registerNib(){
        // For Tableview
        self.categoryTableView.register(nib: LawyerTableViewCell.className)
        animateView()
     /* For Tableview
         
         DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.categoryTableView.isHidden = false
            
            self.currentTableAnimation =  TableAnimation.fadeIn(duration: self.animationDuration, delay: self.delay)
            
            /* self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 60,duration: self.animationDuration, delay: self.delay) */
            
            self.categoryTableView.reloadData()
        } */
        
        
        
        
        /* For Collection view
        self.categoryCollectionView.register(nib: CategoryCollectionViewCellAndXib.className) */
    }
    
    //TODO: Animate rotate table view
       internal func animateView(){
           self.categoryTableView.isHidden = false
           self.categoryTableView.reloadData()
           let fromAnimation = AnimationType.from(direction: .right, offset: 30.0)
           UIView.animate(views: categoryTableView.visibleCells,
                          animations: [fromAnimation], delay: 0.5)
           
           
           
       }
    
    
    
    
    /* For Collection view
    //TODO: Animate simple collection view
     internal func runSimpleAnimation(){
         categoryCollectionView?.reloadData()
         categoryCollectionView?.performBatchUpdates({
             UIView.animate(views: self.categoryCollectionView!.orderedVisibleCells,
                 animations: animations, completion: {
                     print("Animation done...")
                 })
         }, completion: nil)
     }
    
    
    //TODO: Animate rotate collection view
    internal func runRotateAnimation(){
        let zoomAnimation = AnimationType.zoom(scale: 0.2)
        let rotateAnimation = AnimationType.rotate(angle: CGFloat.pi/6)
        UIView.animate(views: self.categoryCollectionView.visibleCells,
                       animations: [zoomAnimation, rotateAnimation],
                       duration: 0.5)
    } */
    
    
}
