//
//  LoginVC+MethodExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 23/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit

extension LoginVC{
    //TODO: Init values
    internal func initValues(){
        if self.customMethodManager == nil {
            self.customMethodManager = CustomMethodClass.shared
        }
        
        if self.logInModel == nil {
            self.logInModel = LoginVM.shared
        }
        
        if  self.dataListVM == nil{
            self.dataListVM = self.logInModel?.prepareDataSource()
        }
        
        initialSetup()
        
    }
    
    
    //TODO: IntialSetup
    private func initialSetup(){
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        self.btnLawyerRef.setTitle(ConstantTexts.LawyerBT, for: .normal)
        self.btnLawyerRef.titleLabel?.font = AppFont.Bold.size(AppFontName.OpenSans, size: 14)
        self.customMethodManager?.provideCornerRadiusTo(self.btnLawyerRef, 2, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner])
       
        
        self.btnCustomerRef.setTitle(ConstantTexts.CustomerBT, for: .normal)
        self.btnCustomerRef.titleLabel?.font = AppFont.Bold.size(AppFontName.OpenSans, size: 14)
        self.customMethodManager?.provideCornerRadiusTo(self.btnCustomerRef, 2, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner])
        
       
        self.setUpUpperButtonLawyerCustomer(tag:self.tag)

        self.lblInstruction.font = AppFont.Regular.size(AppFontName.OpenSans, size: 11)
        self.lblInstruction.textColor = AppColor.darkGrayColor
        self.lblInstruction.numberOfLines = 0
        self.lblInstruction.textAlignment = .center
        
        
        customMethodManager?.provideShadowAndCornerRadius(self.viewBG, 5, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.placeholderColor, -1, 1, 1, 3, 0, AppColor.clearColor)
        
        self.logInTable.separatorStyle = .none
        self.logInTable.backgroundColor = AppColor.whiteColor
        
        
        
        registerNib()
        
        
     
        
        self.customMethodManager?.provideShadowAndCornerRadius(self.btnSendOTPRef, 2, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.darkGrayColor, -1, 1, 1, 3, 0, AppColor.clearColor)
        
        
        self.btnSendOTPRef.setTitle(ConstantTexts.SendOTP_BT, for: .normal)
        self.btnSendOTPRef.titleLabel?.font = AppFont.Bold.size(AppFontName.OpenSans, size: 14)
        
        self.btnSendOTPRef.setTitleColor(AppColor.whiteColor, for: .normal)
        self.btnSendOTPRef.backgroundColor = AppColor.themeColor
        
        
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points
        
        
        let myMutableString = NSMutableAttributedString()
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.DontHaveBT)  ", font: AppFont.Regular.size(AppFontName.OpenSans, size: 11), color: AppColor.darkGrayColor) ?? NSMutableAttributedString())
        
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: ConstantTexts.SignUpAsC_BT, font: AppFont.Bold.size(AppFontName.OpenSans, size: 11), color: AppColor.themeColor) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        
        // *** Set Attributed String to your label ***
        
        self.lblSignUpRef_Customer.attributedText = myMutableString
        let lblSignUpRef_Customer_Tap = UITapGestureRecognizer(target: self, action: #selector(self.lblSignUpRef_Customer_Tapped(_:)))
        self.lblSignUpRef_Customer.isUserInteractionEnabled = true
        self.lblSignUpRef_Customer.addGestureRecognizer(lblSignUpRef_Customer_Tap)
        
        
        
        self.lblSignUpRef_Lawyer.font = AppFont.Bold.size(AppFontName.OpenSans, size: 11)
        self.lblSignUpRef_Lawyer.textAlignment = .center
        self.lblSignUpRef_Lawyer.textColor = AppColor.themeColor
        self.lblSignUpRef_Lawyer.text = ConstantTexts.SignUpAsL_BT
                

        let lblSignUpRef_Lawyer_Tap = UITapGestureRecognizer(target: self, action: #selector(self.lblSignUpRef_Lawyer_Tapped(_:)))
        self.lblSignUpRef_Lawyer.isUserInteractionEnabled = true
        self.lblSignUpRef_Lawyer.addGestureRecognizer(lblSignUpRef_Lawyer_Tap)
        
        
        
    }
    
    
    //TODO: IntialSetup
    internal func setUpUpperButtonLawyerCustomer(tag:Int){
        if self.tag == 0{
            self.lblInstruction.text = ConstantTexts.CustomerIns_LT
            self.customMethodManager?.provideCornerBorderTo(self.btnLawyerRef, 1, AppColor.placeholderColor)
            self.btnLawyerRef.setTitleColor(AppColor.darkGrayColor, for: .normal)
            self.btnLawyerRef.backgroundColor = AppColor.whiteColor
            
            self.customMethodManager?.provideCornerBorderTo(self.btnCustomerRef, 1, AppColor.themeColor)
            self.btnCustomerRef.setTitleColor(AppColor.whiteColor, for: .normal)
            self.btnCustomerRef.backgroundColor = AppColor.themeColor
        }else{
            self.lblInstruction.text = ConstantTexts.LawyerIns_LT
            self.customMethodManager?.provideCornerBorderTo(self.btnCustomerRef, 1, AppColor.placeholderColor)
            self.btnCustomerRef.setTitleColor(AppColor.darkGrayColor, for: .normal)
            self.btnCustomerRef.backgroundColor = AppColor.whiteColor
            
            self.customMethodManager?.provideCornerBorderTo(self.btnLawyerRef, 1, AppColor.themeColor)
            self.btnLawyerRef.setTitleColor(AppColor.whiteColor, for: .normal)
            self.btnLawyerRef.backgroundColor = AppColor.themeColor
        }
    }
    
    
    
    
    //TODO: register nib file
    private func registerNib(){
        self.logInTable.register(nib: Auth_TextField_TableViewCell.className)
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.logInTable.isHidden = false
            
            self.currentTableAnimation =  TableAnimation.fadeIn(duration: self.animationDuration, delay: self.delay)
            
            /* self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 60,duration: self.animationDuration, delay: self.delay) */
            
            self.logInTable.reloadData()
        }
        
        
        
    }
    
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.isHiddenNavigationBar(true)
    }
    
    //TODO: setup validation
    internal func isValidate(){
        dismissKeyboard()
        
        if let dataListVM_T = self.dataListVM{
            self.logInModel?.validateFields(dataStore: dataListVM_T, validHandler: { (strMsg, status, row, section) in
                if status{
                    let vc = AppStoryboard.authSB.instantiateViewController(withIdentifier: OTP_VC.className) as! OTP_VC
                    vc.phoneNumber = dataListVM_T.dataStoreStructAtIndex(row).value
                    vc.modalPresentationStyle = .automatic //or .overFullScreen for transparency
                    self.present(vc, animated: true, completion: nil)
                }else{
                    let indexPath = IndexPath(row: row, section: section)
                    
                    if let cell = self.logInTable.cellForRow(at: indexPath) as? Auth_TextField_TableViewCell{
                        
                        self.customMethodManager!.showToolTip(msg: strMsg, anchorView: cell.textFieldFloating, sourceView: self.view)
                        cell.textFieldFloating.becomeFirstResponder()
                        
                    }
                    
                    
                }
            })
        }
        
    }
    
    
}
