//
//  PaymentCompleteVC+CustomMethods.swift
//  Lawyer
//
//  Created by Aman Kumar on 12/09/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
extension PaymentCompleteVC{
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.tabBarController?.tabBar.isHidden = true
        super.setupNavigationBarTitle(AppColor.whiteColor,ConstantTexts.empty, leftBarButtonsType: [.empty], rightBarButtonsType: [])
    }
    
    
    //TODO: Init values
    internal func initValues(){
        if self.customMethodManager == nil {
            self.customMethodManager = CustomMethodClass.shared
        }
        
       
        initialSetup()
        
    }
    
    
    //TODO: Intial setup implementation
    internal func initialSetup(){
        self.customMethodManager?.showLottieAnimation(self.imgView, ConstantTexts.wallet_animation, .loop)
        
        self.lblTitle.numberOfLines = 0
        self.lblTitle.font = ConstantFonts.mainBottomButtonFont
        self.lblTitle.textColor = AppColor.themeColor
        self.lblTitle.textAlignment = .center
        self.lblTitle.text = ConstantTexts.PaymentSuccessfull_LT
        
        
        self.lblKeys.numberOfLines = 0
        self.lblKeys.font = AppFont.Semibold.size(AppFontName.OpenSans, size: 14)
        self.lblKeys.textColor = AppColor.darkGrayColor
        self.lblKeys.textAlignment = .left
        self.lblKeys.text = "\(ConstantTexts.DateLT)\n\n\(ConstantTexts.LawyerNameLT)\n\n\(ConstantTexts.ConsultationTypeLT)\n\n\(ConstantTexts.ConsultationCostLT)"
        
        
        self.lblValues.numberOfLines = 0
        self.lblValues.font = AppFont.Bold.size(AppFontName.OpenSans, size: 14)
        self.lblValues.textColor = AppColor.darkGrayColor
        self.lblValues.textAlignment = .right
        self.lblValues.text = "\(self.date) \(self.time)\n\n\(lawyer.FullName)\n\n\(self.type)\n\n\(self.cost)"
        
        
        self.lblFooter.numberOfLines = 0
        self.lblFooter.font = AppFont.Semibold.size(AppFontName.OpenSans, size: 14)
        self.lblFooter.textColor = AppColor.darkGrayColor
        self.lblFooter.textAlignment = .center
        self.lblFooter.text = "\(ConstantTexts.FooterLT)"
        
        
        self.customMethodManager?.provideShadowAndCornerRadius(self.btnHomeRef, 2, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.darkGrayColor, -1, 1, 1, 3, 0, AppColor.clearColor)
        
        self.btnHomeRef.setTitle(ConstantTexts.GoToHome_BT, for: .normal)
        self.btnHomeRef.titleLabel?.font = ConstantFonts.mainBottomButtonFont
        
        self.btnHomeRef.setTitleColor(AppColor.whiteColor, for: .normal)
        self.btnHomeRef.backgroundColor = AppColor.themeColor
        
    }
    
}

