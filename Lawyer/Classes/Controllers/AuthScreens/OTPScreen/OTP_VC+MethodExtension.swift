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
        
        
        otpView.otpFieldsCount = 4
        otpView.otpFieldDefaultBorderColor = AppColor.darkGrayColor
        otpView.otpFieldEnteredBorderColor = AppColor.themeColor
        otpView.otpFieldErrorBorderColor = AppColor.themeColor
        otpView.otpFieldBorderWidth = 2
        otpView.delegate = self
        otpView.shouldAllowIntermediateEditing = false
        
        otpView.otpFieldTextColor = AppColor.themeColor
        otpView.otpFieldSize = 45
        otpView.otpFieldSeparatorSpace = 10
        otpView.otpFieldFont = AppFont.Regular.size(AppFontName.OpenSans, size: 14)
        otpView.otpFieldDisplayType = .underlinedBottom
        otpView.cursorColor = AppColor.themeColor
        otpView.placeHolder = ConstantTexts.ZeroLT
        // Create the UI
        otpView.initializeUI()
        
        
        self.customMethodManager?.provideShadowAndCornerRadius(self.btnDoneOTPRef, 2, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.darkGrayColor, -1, 1, 1, 3, 0, AppColor.clearColor)
        
        
        self.btnDoneOTPRef.setTitle(ConstantTexts.Varify_BT, for: .normal)
        self.btnDoneOTPRef.titleLabel?.font = ConstantFonts.mainBottomButtonFont
        
        self.btnDoneOTPRef.setTitleColor(AppColor.whiteColor, for: .normal)
        self.btnDoneOTPRef.backgroundColor = AppColor.themeColor
        
        
        
        let image = UIImage(systemName: "x.circle.fill") ?? UIImage()
        image.setImageTintWith(AppColor.darkGrayColor)
        self.btnDismissRef.setImage(image, for: .normal)
        self.btnDismissRef.tintColor = AppColor.darkGrayColor
        
        
        
        self.lblTimer.font = AppFont.Regular.size(AppFontName.OpenSans, size: 12)
        self.lblTimer.textColor = AppColor.themeColor
        
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 1 // Whatever line spacing you want in points
        
        
        var myMutableString = NSMutableAttributedString()
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.VarificationCode_LT)", font: AppFont.Bold.size(AppFontName.OpenSans, size: 18), color: AppColor.themeColor) ?? NSMutableAttributedString())
        
        
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\n\n\(ConstantTexts.EnterOTP2_LT)\n", font: AppFont.Regular.size(AppFontName.OpenSans, size: 12), color: AppColor.textColor) ?? NSMutableAttributedString())
        
        
     //   myMutableString.append(customMethodManager?.provideUnderlineAttributedText(text: "\(ConstantTexts.CountryCodeLT) \(phoneNumber)", font: AppFont.Bold.size(AppFontName.OpenSans, size: 12), AppColor.themeColor) ?? NSMutableAttributedString())
        
        
     //   myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\n\(ConstantTexts.PleaseVarify_LT)", font: AppFont.Regular.size(AppFontName.OpenSans, size: 12), color: AppColor.textColor) ?? NSMutableAttributedString())
        
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        
        // *** Set Attributed String to your label ***
        lblInstruction.numberOfLines = 0
        lblInstruction.attributedText = myMutableString
        
        
        myMutableString = NSMutableAttributedString()
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.DidntRecieve_BT) ", font: AppFont.Regular.size(AppFontName.OpenSans, size: 12), color: AppColor.textColor) ?? NSMutableAttributedString())
        
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.ResendAgain_BT)", font: AppFont.Bold.size(AppFontName.OpenSans, size: 14), color: AppColor.themeColor) ?? NSMutableAttributedString())
        self.btnResendOTPRef.setAttributedTitle(myMutableString, for: .normal)
        self.btnResendOTPRef.backgroundColor = AppColor.whiteColor
        
        
        startTimer()
        
    }
    
    
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.isHiddenNavigationBar(true)
        //  super.setupNavigationBarTitle(AppColor.themeColor, ConstantTexts.VarificationHT, leftBarButtonsType: [.back], rightBarButtonsType: [.empty])
    }
    
    
    
    //TODO: setup validation
    internal func isValidate(){
        if !validationMethodManager!.checkEmptyField(enteredOtp.trimmingCharacters(in: .whitespaces)){
            self.customMethodManager!.showToolTip(msg: ConstantTexts.EnterOTPALERT, anchorView: self.otpView, sourceView: self.view)
            return
        } else if !validationMethodManager!.isValidOTPCount(enteredOtp.trimmingCharacters(in: .whitespaces)){
            self.customMethodManager!.showToolTip(msg: ConstantTexts.EnterValidOTPALERT, anchorView: self.otpView, sourceView: self.view)
            
            return
        }else{
            dismissKeyboard()
            
            self.dismiss(animated: true) {
                let vc = AppStoryboard.tabBarSB.instantiateViewController(withIdentifier: TabBarVC.className) as! TabBarVC
                UIApplication.shared.windows.first?.rootViewController = vc
                UIApplication.shared.windows.first?.makeKeyAndVisible()
            }
            
            
            
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
