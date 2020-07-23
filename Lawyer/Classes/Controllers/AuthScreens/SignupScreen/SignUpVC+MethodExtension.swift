//
//  SignUpVC+MethodExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 23/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
extension SignUpVC{
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
        
        
        self.txtFullName.maxLength = 50
        self.txtFullName.keyboardType = .namePhonePad
        self.txtFullName.placeholder = ConstantTexts.FullNamePH
        
        self.txtPhoneNumber.maxLength = 10
        self.txtPhoneNumber.keyboardType = .phonePad
        self.txtPhoneNumber.placeholder = ConstantTexts.MobileNumberPH
        
        self.txtEmail.maxLength = 30
        self.txtEmail.keyboardType = .emailAddress
        self.txtEmail.placeholder = ConstantTexts.EmailAddressPH
        
        
       
        self.customMethodManager?.provideShadowAndCornerRadius(self.btnRegisterRef, 5, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.placeholderColor, 2, 2, 2, 2, 0, AppColor.tableBGColor)
        
        
        self.customMethodManager?.provideCornerRadiusTo(self.btnRegisterRef, 5, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner])
              self.btnRegisterRef.setTitle(ConstantTexts.Register_BT, for: .normal)
              self.btnRegisterRef.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
               
              self.btnRegisterRef.setTitleColor(AppColor.whiteColor, for: .normal)
              self.btnRegisterRef.backgroundColor = AppColor.themeColor
        
        
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points
        
        
        let myMutableString = NSMutableAttributedString()
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: ConstantTexts.AlreadyHaveBT, font: UIFont.systemFont(ofSize: 15.0), color: AppColor.textColor) ?? NSMutableAttributedString())
        
        if tag == 0{
           myMutableString.append(customMethodManager?.provideUnderlineAttributedText(text: ConstantTexts.LogInAsC_BT, font: UIFont.systemFont(ofSize: 15.0), AppColor.themeColor) ?? NSMutableAttributedString())
        }else{
            myMutableString.append(customMethodManager?.provideUnderlineAttributedText(text: ConstantTexts.LogInAsL_BT, font: UIFont.systemFont(ofSize: 15.0), AppColor.themeColor) ?? NSMutableAttributedString())
        }
        
        
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        
        // *** Set Attributed String to your label ***
        
        self.btnLoginRef.setAttributedTitle(myMutableString, for: .normal)
        
        
    }
    
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.setupNavigationBarTitle(ConstantTexts.SignupHT, leftBarButtonsType: [.back], rightBarButtonsType: [])
    }
    
    //TODO: setup validation
     internal func isValidate(){
         dismissKeyboard()
        if !validationMethodManager!.checkEmptyField(txtFullName.text!.trimmingCharacters(in: .whitespaces)){
            self.customMethodManager!.showToolTip(msg: ConstantTexts.EnterFullNameALERT, anchorView: self.txtFullName, sourceView: self.view)
            self.txtFullName.becomeFirstResponder()
            return
        }else if !validationMethodManager!.isValidFullName(txtFullName.text!.trimmingCharacters(in: .whitespaces)){
            self.customMethodManager!.showToolTip(msg: ConstantTexts.EnterValidFullNameALERT, anchorView: self.txtFullName, sourceView: self.view)
            self.txtFullName.becomeFirstResponder()
            return
        }else if !validationMethodManager!.checkEmptyField(txtPhoneNumber.text!.trimmingCharacters(in: .whitespaces)){
             self.customMethodManager!.showToolTip(msg: ConstantTexts.EnterMobileNumberALERT, anchorView: self.txtPhoneNumber, sourceView: self.view)
             self.txtPhoneNumber.becomeFirstResponder()
             return
         } else if !validationMethodManager!.isValidIndianPhoneCount(txtPhoneNumber.text!.trimmingCharacters(in: .whitespaces)){
            self.customMethodManager!.showToolTip(msg: ConstantTexts.EnterValidMobileNumberALERT, anchorView: self.txtPhoneNumber, sourceView: self.view)
             self.txtPhoneNumber.becomeFirstResponder()
             return
         }else if !validationMethodManager!.checkEmptyField(txtEmail.text!.trimmingCharacters(in: .whitespaces)){
             self.customMethodManager!.showToolTip(msg: ConstantTexts.EnterEmailALERT, anchorView: self.txtEmail, sourceView: self.view)
             self.txtEmail.becomeFirstResponder()
             return
         } else if !validationMethodManager!.isValidEmail(txtEmail.text!.trimmingCharacters(in: .whitespaces)){
            self.customMethodManager!.showToolTip(msg: ConstantTexts.EnterValidEmailALERT, anchorView: self.txtEmail, sourceView: self.view)
             self.txtEmail.becomeFirstResponder()
             return
         }else{
             let vc = AppStoryboard.authSB.instantiateViewController(withIdentifier: OTP_VC.className) as! OTP_VC
             vc.phoneNumber = txtPhoneNumber.text!
             self.navigationController?.pushViewController(vc, animated: true)
         }
    
     }
    
    
}
