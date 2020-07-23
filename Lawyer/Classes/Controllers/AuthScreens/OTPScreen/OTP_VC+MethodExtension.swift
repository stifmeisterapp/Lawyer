//
//  OTP_VC+MethodExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 23/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
extension OTP_VC{
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
        
        
        self.txtOTP_Number.maxLength = 4
        self.txtOTP_Number.keyboardType = .numberPad
        self.txtOTP_Number.placeholder = ConstantTexts.EnterOTP1_LT
        
        self.customMethodManager?.provideCornerRadiusTo(self.btnDoneOTPRef, 5, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner])
        self.btnDoneOTPRef.setTitle(ConstantTexts.Done_BT, for: .normal)
        self.btnDoneOTPRef.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        
        self.btnDoneOTPRef.setTitleColor(AppColor.whiteColor, for: .normal)
        self.btnDoneOTPRef.backgroundColor = AppColor.themeColor
        
        
        self.btnResendOTPRef.setTitle(ConstantTexts.ResendOTP_BT, for: .normal)
        self.btnResendOTPRef.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        
        self.btnResendOTPRef.setTitleColor(AppColor.themeColor, for: .normal)
        self.btnResendOTPRef.backgroundColor = AppColor.whiteColor
        
        self.lblTimer.font = UIFont.systemFont(ofSize: 15.0)
        self.lblTimer.textColor = AppColor.themeColor
        
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points
        
        
        let myMutableString = NSMutableAttributedString()
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.EnterOTP1_LT)\n", font: UIFont.boldSystemFont(ofSize: 20), color: AppColor.textColor) ?? NSMutableAttributedString())
        
        
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.EnterOTP2_LT) ", font: UIFont.systemFont(ofSize: 15.0), color: AppColor.textColor) ?? NSMutableAttributedString())
        
        
        myMutableString.append(customMethodManager?.provideUnderlineAttributedText(text: "\(ConstantTexts.CountryCodeLT) \(phoneNumber)", font: UIFont.systemFont(ofSize: 15.0), AppColor.themeColor) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        
        // *** Set Attributed String to your label ***
        lblInstruction.numberOfLines = 0
        lblInstruction.attributedText = myMutableString
                
        startTimer()
 
    }
    
    
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.setupNavigationBarTitle(ConstantTexts.VarificationHT, leftBarButtonsType: [.back], rightBarButtonsType: [])
    }
    
    
     //TODO: setup validation
     internal func isValidate(){
         dismissKeyboard()
         if !validationMethodManager!.checkEmptyField(txtOTP_Number.text!.trimmingCharacters(in: .whitespaces)){
             self.customMethodManager!.showToolTip(msg: ConstantTexts.EnterOTPALERT, anchorView: self.txtOTP_Number, sourceView: self.view)
             self.txtOTP_Number.becomeFirstResponder()
             return
         } else if !validationMethodManager!.isValidOTPCount(txtOTP_Number.text!.trimmingCharacters(in: .whitespaces)){
            self.customMethodManager!.showToolTip(msg: ConstantTexts.EnterValidOTPALERT, anchorView: self.txtOTP_Number, sourceView: self.view)
             self.txtOTP_Number.becomeFirstResponder()
             return
         }else{
             let vc = AppStoryboard.tabBarSB.instantiateViewController(withIdentifier: TabBarVC.className) as! TabBarVC
             UIApplication.shared.windows.first?.rootViewController = vc
             UIApplication.shared.windows.first?.makeKeyAndVisible()
         }
    
    }
    
    
    
    //MARK: - Timer methods
    //TODO: Start timer
    internal func startTimer(){
        self.btnResendOTPRef.isHidden = true
        self.lblTimer.isHidden = false
        self.lblTimer.text = "\(ConstantTexts.ResendInLT) 00:\(time)"
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
    }
    
    //TODO: Stop timer
    internal func stopTimer(){
        self.btnResendOTPRef.isHidden = false
        self.lblTimer.isHidden = true
        timer?.invalidate()
        time = 30
    }
    
}
