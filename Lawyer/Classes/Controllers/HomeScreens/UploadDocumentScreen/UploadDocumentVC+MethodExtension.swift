//
//  UploadDocumentVC+MethodExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 03/09/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
extension UploadDocumentVC{
   //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.tabBarController?.tabBar.isHidden = true
        super.setupNavigationBarTitle(AppColor.themeColor,ConstantTexts.UploadDocumentHT, leftBarButtonsType: [.back], rightBarButtonsType: [])
    }
    
    
    //TODO: Init values
    internal func initValues(){
        if customMethodManager == nil {
            customMethodManager = CustomMethodClass.shared
        }
        
       
        initialSetup()
        
    }
    
    
    //TODO: Intial setup implementation
    internal func initialSetup(){
        
        self.customMethodManager?.provideShadowAndCornerRadius(self.header.viewBG, 10, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.placeholderColor, -1, 1, 1, 3, 0, AppColor.clearColor)
        
        self.customMethodManager?.showLottieAnimation(self.header.imgLottie, ConstantTexts.Upload_filesHeader, .loop)
        
        self.header.lblInstruction1.font = AppFont.Semibold.size(AppFontName.OpenSans, size: 14)
        self.header.lblInstruction1.textColor = AppColor.darkGrayColor
        self.header.lblInstruction1.numberOfLines = 0
        self.header.lblInstruction1.textAlignment = .center
        self.header.lblInstruction1.text = ConstantTexts.UploadDocumentLT
        
        self.header.lblInstruction2.font = AppFont.Regular.size(AppFontName.OpenSans, size: 10)
        self.header.lblInstruction2.textColor = AppColor.darkGrayColor
        self.header.lblInstruction2.numberOfLines = 0
        self.header.lblInstruction2.textAlignment = .center
        self.header.lblInstruction2.text = ConstantTexts.UploadDocumentInsLT
        self.header.btnCamRef.tintColor = AppColor.darkGrayColor
        
        
        
        
        self.tblDocuments.tableHeaderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double.leastNormalMagnitude))
        self.tblDocuments.tableFooterView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double.leastNormalMagnitude))
        
        self.tblDocuments.sectionHeaderHeight = 0.0;
        self.tblDocuments.sectionFooterHeight = 0.0;
        
        self.tblDocuments.hideEmptyCells()
        self.tblDocuments.isScrollEnabled = true
        self.tblDocuments.backgroundColor = AppColor.whiteColor
        registerNib()
        
        
        self.footer.lblInstruction2.font = AppFont.Semibold.size(AppFontName.OpenSans, size: 11)
        self.footer.lblInstruction2.textColor = AppColor.darkGrayColor
        self.footer.lblInstruction2.numberOfLines = 0
        self.footer.lblInstruction2.textAlignment = .center
        self.footer.lblInstruction2.text = ConstantTexts.AdditionalInfoLT
        
        self.footer.txtView.font = AppFont.Italic.size(AppFontName.OpenSans, size: 11)
        self.footer.txtView.text = ConstantTexts.WriteCommentPH
        self.footer.txtView.textColor = AppColor.darkGrayColor
        self.footer.txtView.delegate = self
        
        
        self.customMethodManager?.provideCornerRadiusTo(self.footer.viewBG, 10, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner])
        self.footer.viewBG.backgroundColor = AppColor.tableBGColor
        
        self.footer.txtView.backgroundColor = AppColor.tableBGColor
        
        self.customMethodManager?.provideShadowAndCornerRadius(self.btnSubmitRef, 2, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.darkGrayColor, -1, 1, 1, 3, 0, AppColor.clearColor)
        
        self.btnSubmitRef.setTitle(ConstantTexts.Submit_BT, for: .normal)
        self.btnSubmitRef.titleLabel?.font = ConstantFonts.mainBottomButtonFont
        
        self.btnSubmitRef.setTitleColor(AppColor.whiteColor, for: .normal)
        self.btnSubmitRef.backgroundColor = AppColor.themeColor
        
        
    }
    

    //TODO: register nib file
    private func registerNib(){
        self.tblDocuments.registerMultiple(nibs: [EmptyWithAlertTableViewCell.className,UploadDocTableViewCellAndXib.className])
    
    }
}
