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
        
        if self.validationMethodManager == nil {
            self.validationMethodManager = ValidationClass.shared
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
        
        
        self.txtPhoneNumber.maxLength = 10
        self.txtPhoneNumber.keyboardType = .numberPad
        self.txtPhoneNumber.placeholder = ConstantTexts.MobileNumberPH
        
        self.btnLawyerRef.setTitle(ConstantTexts.LawyerBT, for: .normal)
        self.btnLawyerRef.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        self.customMethodManager?.provideCornerRadiusTo(self.btnLawyerRef, 5, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner])
        
        self.customMethodManager?.provideCornerBorderTo(self.btnLawyerRef, 1, AppColor.themeColor)
        self.btnLawyerRef.setTitleColor(AppColor.themeColor, for: .normal)
        self.btnLawyerRef.backgroundColor = AppColor.whiteColor
        
        
        self.lblInstruction.font = UIFont.systemFont(ofSize: 12)
        self.lblInstruction.textColor = AppColor.darkGrayColor
        self.lblInstruction.numberOfLines = 0
        self.lblInstruction.text = ConstantTexts.CustomerIns_LT
        
        
        self.customMethodManager?.provideCornerRadiusTo(self.btnCustomerRef, 5, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner])
        self.btnCustomerRef.setTitle(ConstantTexts.CustomerBT, for: .normal)
        self.btnCustomerRef.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        
        self.btnCustomerRef.setTitleColor(AppColor.whiteColor, for: .normal)
        self.btnCustomerRef.backgroundColor = AppColor.themeColor
        
        
        
        self.customMethodManager?.provideShadowAndCornerRadius(self.btnSendOTPRef, 5, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.placeholderColor, 2, 2, 2, 2, 0, AppColor.tableBGColor)
        
        
        self.customMethodManager?.provideCornerRadiusTo(self.btnSendOTPRef, 5, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner])
        self.btnSendOTPRef.setTitle(ConstantTexts.SendOTP_BT, for: .normal)
        self.btnSendOTPRef.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        
        self.btnSendOTPRef.setTitleColor(AppColor.whiteColor, for: .normal)
        self.btnSendOTPRef.backgroundColor = AppColor.themeColor
        
        
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points
        
        
        let myMutableString = NSMutableAttributedString()
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: ConstantTexts.DontHaveBT, font: UIFont.systemFont(ofSize: 15.0), color: AppColor.textColor) ?? NSMutableAttributedString())
        
        myMutableString.append(customMethodManager?.provideUnderlineAttributedText(text: ConstantTexts.SignUpAsC_BT, font: UIFont.systemFont(ofSize: 15.0), AppColor.themeColor) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        
        // *** Set Attributed String to your label ***
        
        self.btnSignUpRef.setAttributedTitle(myMutableString, for: .normal)
        
        
    }
    
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.setupNavigationBarTitle(ConstantTexts.LoginHT, leftBarButtonsType: [.empty], rightBarButtonsType: [])
    }
    
    //TODO: setup validation
    internal func isValidate(){
        dismissKeyboard()
        if !validationMethodManager!.checkEmptyField(txtPhoneNumber.text!.trimmingCharacters(in: .whitespaces)){
            self.customMethodManager!.showToolTip(msg: ConstantTexts.EnterMobileNumberALERT, anchorView: self.txtPhoneNumber, sourceView: self.view)
            self.txtPhoneNumber.becomeFirstResponder()
            return
        } else if !validationMethodManager!.isValidIndianPhoneCount(txtPhoneNumber.text!.trimmingCharacters(in: .whitespaces)){
           self.customMethodManager!.showToolTip(msg: ConstantTexts.EnterValidMobileNumberALERT, anchorView: self.txtPhoneNumber, sourceView: self.view)
            self.txtPhoneNumber.becomeFirstResponder()
            return
        }else{
            let vc = AppStoryboard.authSB.instantiateViewController(withIdentifier: OTP_VC.className) as! OTP_VC
            vc.phoneNumber = txtPhoneNumber.text!
            self.navigationController?.pushViewController(vc, animated: true)
        }
   
    }
    
    
}
