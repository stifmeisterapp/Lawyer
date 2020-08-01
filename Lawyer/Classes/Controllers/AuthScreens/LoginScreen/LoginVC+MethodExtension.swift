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
        
        customMethodManager?.provideShadowAndCornerRadius(self.viewBG, 2, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.darkGrayColor, -1, 1, 1, 3, 0, AppColor.clearColor)
        
        self.logInTable.separatorStyle = .none
        self.logInTable.backgroundColor = AppColor.whiteColor
        
        
        
        registerNib()
        
        
     
        
        self.customMethodManager?.provideShadowAndCornerRadius(self.btnSendOTPRef, 2, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.darkGrayColor, -1, 1, 1, 3, 0, AppColor.clearColor)
        
        
        self.btnSendOTPRef.setTitle(ConstantTexts.SendOTP_BT, for: .normal)
        self.btnSendOTPRef.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        
        self.btnSendOTPRef.setTitleColor(AppColor.whiteColor, for: .normal)
        self.btnSendOTPRef.backgroundColor = AppColor.themeColor
        
        
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points
        
        
        var myMutableString = NSMutableAttributedString()
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.DontHaveBT)  ", font: UIFont.systemFont(ofSize: 14.0), color: AppColor.textColor) ?? NSMutableAttributedString())
        
        myMutableString.append(customMethodManager?.provideUnderlineAttributedText(text: ConstantTexts.SignUpAsC_BT, font: UIFont.boldSystemFont(ofSize: 14.0), AppColor.themeColor) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        
        // *** Set Attributed String to your label ***
        
        self.lblSignUpRef_Customer.attributedText = myMutableString
        let lblSignUpRef_Customer_Tap = UITapGestureRecognizer(target: self, action: #selector(self.lblSignUpRef_Customer_Tapped(_:)))
        self.lblSignUpRef_Customer.isUserInteractionEnabled = true
        self.lblSignUpRef_Customer.addGestureRecognizer(lblSignUpRef_Customer_Tap)
        
        
        
                
        myMutableString = NSMutableAttributedString()
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.DontHaveBT)  ", font: UIFont.systemFont(ofSize: 14.0), color: AppColor.textColor) ?? NSMutableAttributedString())
        
        myMutableString.append(customMethodManager?.provideUnderlineAttributedText(text: ConstantTexts.SignUpAsL_BT, font: UIFont.boldSystemFont(ofSize: 14.0), AppColor.themeColor) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        
        // *** Set Attributed String to your label ***
        
        self.lblSignUpRef_Lawyer.attributedText = myMutableString
        let lblSignUpRef_Lawyer_Tap = UITapGestureRecognizer(target: self, action: #selector(self.lblSignUpRef_Lawyer_Tapped(_:)))
        self.lblSignUpRef_Lawyer.isUserInteractionEnabled = true
        self.lblSignUpRef_Lawyer.addGestureRecognizer(lblSignUpRef_Lawyer_Tap)
        
        
        
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
