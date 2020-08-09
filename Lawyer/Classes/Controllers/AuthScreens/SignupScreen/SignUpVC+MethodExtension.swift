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
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.isHiddenNavigationBar(true)
    }
    
    
    //TODO: Init values
    internal func initValues(){
        if self.customMethodManager == nil {
            self.customMethodManager = CustomMethodClass.shared
        }
        
        if self.registerListModel == nil {
            self.registerListModel = SignUpVM.shared
        }
        
        if  self.dataListVM == nil{
            self.dataListVM = self.registerListModel?.prepareDataSource()
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
        
        customMethodManager?.provideShadowAndCornerRadius(self.viewBG, 5, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.placeholderColor, -1, 1, 1, 3, 0, AppColor.clearColor)
        
        self.registerTable.separatorStyle = .none
        self.registerTable.backgroundColor = AppColor.whiteColor
        
        registerNib()
        
        self.customMethodManager?.provideShadowAndCornerRadius(self.btnRegisterRef, 2, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.darkGrayColor, -1, 1, 1, 3, 0, AppColor.clearColor)
        
        
        self.btnRegisterRef.setTitle(ConstantTexts.SendOTP_BT, for: .normal)
        self.btnRegisterRef.titleLabel?.font = ConstantFonts.mainBottomButtonFont
        
        self.btnRegisterRef.setTitleColor(AppColor.whiteColor, for: .normal)
        self.btnRegisterRef.backgroundColor = AppColor.themeColor
        
        
        
        self.lblInstruction.numberOfLines = 0
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 0 // Whatever line spacing you want in points
        
        
        let myMutableString = NSMutableAttributedString()
        let myMutableString_For_Instruction = NSMutableAttributedString()
        
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.AlreadyHaveBT)  ", font: AppFont.Regular.size(AppFontName.OpenSans, size: 11), color: AppColor.darkGrayColor) ?? NSMutableAttributedString())
        
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: ConstantTexts.LogInAsC_BT, font: AppFont.Bold.size(AppFontName.OpenSans, size: 11), color: AppColor.themeColor) ?? NSMutableAttributedString())
        
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        
        // *** Set Attributed String to your label ***
        
        self.lblInstruction_SignIn_Customer.attributedText = myMutableString
        
        let lblInstruction_SignIn_Customer_Tap = UITapGestureRecognizer(target: self, action: #selector(self.lblInstruction_SignIn_Customer_Tapped(_:)))
        self.lblInstruction_SignIn_Customer.isUserInteractionEnabled = true
        self.lblInstruction_SignIn_Customer.addGestureRecognizer(lblInstruction_SignIn_Customer_Tap)
        
        
        
        self.lblInstruction_SignIn_Lawyer.font = AppFont.Bold.size(AppFontName.OpenSans, size: 11)
        self.lblInstruction_SignIn_Lawyer.textAlignment = .center
        self.lblInstruction_SignIn_Lawyer.textColor = AppColor.themeColor
        self.lblInstruction_SignIn_Lawyer.text = ConstantTexts.LogInAsL_BT
        
        let lblInstruction_SignIn_Lawyer_Tap = UITapGestureRecognizer(target: self, action: #selector(self.lblInstruction_SignIn_Lawyer_Tapped(_:)))
        self.lblInstruction_SignIn_Lawyer.isUserInteractionEnabled = true
        self.lblInstruction_SignIn_Lawyer.addGestureRecognizer(lblInstruction_SignIn_Lawyer_Tap)
        
  
        if tag == 0{
           
            myMutableString_For_Instruction.append(customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.SignUpAsC_New_BT)\n\n", font:  AppFont.Bold.size(AppFontName.OpenSans, size: 18), color: AppColor.themeColor) ?? NSMutableAttributedString())
            
            myMutableString_For_Instruction.append(customMethodManager?.provideSimpleAttributedText(text: ConstantTexts.CustomerIns_LT, font:  AppFont.Regular.size(AppFontName.OpenSans, size: 11), color: AppColor.darkGrayColor) ?? NSMutableAttributedString())
            
            
            // *** Apply attribute to string ***
            myMutableString_For_Instruction.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString_For_Instruction.length))
            
            // *** Set Attributed String to your label ***
            
            
            self.lblInstruction.attributedText = myMutableString_For_Instruction
            
        }else{
           
            myMutableString_For_Instruction.append(customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.SignUpAsL_New_BT)\n\n", font:  AppFont.Bold.size(AppFontName.OpenSans, size: 18), color: AppColor.themeColor) ?? NSMutableAttributedString())
            
            myMutableString_For_Instruction.append(customMethodManager?.provideSimpleAttributedText(text: ConstantTexts.LawyerIns_LT, font:  AppFont.Regular.size(AppFontName.OpenSans, size: 11), color: AppColor.darkGrayColor) ?? NSMutableAttributedString())
            
            // *** Apply attribute to string ***
            myMutableString_For_Instruction.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString_For_Instruction.length))
            
            // *** Set Attributed String to your label ***
            
            self.lblInstruction.attributedText = myMutableString_For_Instruction
        }
  
    }
    
    
    //TODO: register nib file
    private func registerNib(){
        self.registerTable.register(nib: Auth_TextField_TableViewCell.className)
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.registerTable.isHidden = false
            
            self.currentTableAnimation =  TableAnimation.fadeIn(duration: self.animationDuration, delay: self.delay)
            
            /* self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 60,duration: self.animationDuration, delay: self.delay) */
            
            self.registerTable.reloadData()
        }
        
        
        
    }

    //TODO: setup validation
    internal func isValidate(){
        dismissKeyboard()
        
        if let dataListVM_T = self.dataListVM{
            self.registerListModel?.validateFields(dataStore: dataListVM_T, validHandler: { (strMsg, status, row, section) in
                if status{
                    
                    let vc = AppStoryboard.authSB.instantiateViewController(withIdentifier: OTP_VC.className) as! OTP_VC
                    vc.phoneNumber = dataListVM_T.dataStoreStructAtIndex(row).value
                    vc.modalPresentationStyle = .automatic //or .overFullScreen for transparency
                    self.present(vc, animated: true, completion: nil)
                    
                }else{
                    let indexPath = IndexPath(row: row, section: section)
                    
                    if let cell = self.registerTable.cellForRow(at: indexPath) as? Auth_TextField_TableViewCell{
                        
                        self.customMethodManager!.showToolTip(msg: strMsg, anchorView: cell.textFieldFloating, sourceView: self.view)
                        cell.textFieldFloating.becomeFirstResponder()
                        
                    }
                    
                    
                }
            })
        }
        
    }
    
    
}
