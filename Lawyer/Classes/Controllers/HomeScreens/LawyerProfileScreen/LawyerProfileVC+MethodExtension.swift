//
//  LawyerProfileVC+MethodExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 01/09/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
extension LawyerProfileVC{
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.tabBarController?.tabBar.isHidden = true
        super.setupNavigationBarTitle(AppColor.themeColor,ConstantTexts.LawyerDetailsHT, leftBarButtonsType: [.back], rightBarButtonsType: [])
    }
    
    
    //TODO: Init values
    internal func initValues(){
        if customMethodManager == nil {
            customMethodManager = CustomMethodClass.shared
        }
        
        if lawyerProfileVM == nil{
            lawyerProfileVM = LawyerProfileVM.shared
        }
        
       
        initialSetup()
        
    }
    
    
    //TODO: Intial setup implementation
    private func initialSetup(){
       
        self.customMethodManager?.provideCornerRadiusTo(self.profileImageViewPlaceholder, 5, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner])
        self.customMethodManager?.provideCornerBorderTo(self.profileImageViewPlaceholder, 0.5, AppColor.darkGrayColor)
        
        
        self.customMethodManager?.provideCornerRadiusTo(self.profileImageView, 5, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner])
        self.customMethodManager?.provideCornerBorderTo(self.profileImageView, 0.5, AppColor.darkGrayColor)
        
        
        self.nameLabel.font = ConstantFonts.mainBottomButtonFont
        self.nameLabel.textColor = AppColor.themeColor
        self.nameLabel.numberOfLines = 2
        
        
        self.buttonMeetRef.setTitleColor(AppColor.whiteColor, for: .normal)
        self.buttonMeetRef.backgroundColor = AppColor.themeColor
        self.buttonMeetRef.setTitle(ConstantTexts.MeetBT, for: .normal)
        self.buttonMeetRef.titleLabel?.font = ConstantFonts.mainBottomButtonFont
        self.customMethodManager?.provideCornerRadiusTo(self.buttonMeetRef, 3, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner])
        
        
        self.buttonCallRef.setTitleColor(AppColor.darkGrayColor, for: .normal)
        self.buttonCallRef.backgroundColor = AppColor.whiteColor
        self.buttonCallRef.setTitle(ConstantTexts.CallBT, for: .normal)
        self.buttonCallRef.titleLabel?.font = ConstantFonts.mainBottomButtonFont
        self.customMethodManager?.provideCornerRadiusTo(self.buttonCallRef, 3, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner])
        self.customMethodManager?.provideCornerBorderTo(self.buttonCallRef, 1, AppColor.placeholderColor)
        
        
        self.profileTable.tableHeaderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double.leastNormalMagnitude))
        self.profileTable.tableFooterView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double.leastNormalMagnitude))
        
        self.profileTable.sectionHeaderHeight = 0.0;
        self.profileTable.sectionFooterHeight = 0.0;
        
        self.profileTable.separatorStyle = .none
        self.profileTable.hideEmptyCells()
        self.profileTable.backgroundColor = AppColor.whiteColor
        self.profileTable.isHidden = false
        self.profileTable.estimatedRowHeight = 50.0
        self.profileTable.addSubview(self.refreshControl)
        
        
        self.nameLabel.alpha = 0
        self.buttonCallRef.isHidden = true
        self.buttonMeetRef.isHidden = true
        self.profileTable.isHidden = true
        
        self.profileImageView.isHidden = true
        self.profileImageViewPlaceholder.isHidden = true
        registerNib()
        lawyerDetailService()
        
    }
    
    //TODO: register nib file
    private func registerNib(){
        self.profileTable.register(nib: Detail_TableViewCellAndXib.className)
    
    }
    
    
    //TODO: Show all fields
    internal func showAllFields(){
        
        DispatchQueue.main.async {
 
            self.nameLabel.alpha = 1.0
            self.buttonCallRef.isHidden = false
            self.buttonMeetRef.isHidden = false
            self.profileTable.isHidden = false
            self.profileImageView.isHidden = false
            self.profileImageViewPlaceholder.isHidden = false
        }
        
        
    }
    
    
    
    
    //TODO: Lawyer detail web service
    internal func lawyerDetailService(){
        
        DispatchQueue.main.async {
            //Start animating skeleton view
           
        }
        
        
        ServiceClass.shared.webServiceBasicMethod(url: "\(SCustomerApi.lawyer_overview)\(self.Uuid)", method: .get, parameters: nil, header: nil, success: { (result) in
            print(result)
            
            self.showAllFields()
            if let result_Dict = result as? NSDictionary{
                if let code = result_Dict.value(forKey: "code") as? Int{
                    if code == 200{
                        if let data = result_Dict.value(forKey: "data") as? NSDictionary{
                            print(data)
                            self.customMethodManager?.setImage(imageView: self.profileImageView, url: self.imageURL)
                            self.nameLabel.text = self.name_Lawyer
                            
                            if self.lawyerDetailsVM == nil {
                                self.lawyerDetailsVM = self.lawyerProfileVM?.prepareDataSource(data: data)
                            }else{
                                if let count = self.lawyerDetailsVM?.profileItems.count{
                                    if count > 0{
                                        self.lawyerDetailsVM?.profileItems.removeAll()
                                    }
                                    self.lawyerDetailsVM = self.lawyerProfileVM?.prepareDataSource(data: data)
                                }
                            }
                            
                            DispatchQueue.main.async {
                                self.profileTable.reloadData()
                            }
                            
                        }
                    }else{
                        if let message = result_Dict.value(forKey: "message") as? String{
                            _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: message, style:.error)
                        }
                        
                    }
                }
            }
            
            
        }) { (error) in
            print(error)
            self.showAllFields()
            
            
            if let errorString = (error as NSError).userInfo[ConstantTexts.errorMessage_Key] as? String{
                _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: errorString, style:.error)
            }else{
                _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: ConstantTexts.errorMessage, style:.error)
            }
            
            
            
        }
        
        
    }
    
    
}
