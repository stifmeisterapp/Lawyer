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
        
        customMethodManager?.provideShadowAndCornerRadius(self.viewBG, 2, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.darkGrayColor, -1, 1, 1, 3, 0, AppColor.clearColor)
        
        self.registerTable.separatorStyle = .none
        self.registerTable.backgroundColor = AppColor.whiteColor
        
        registerNib()
        
        self.customMethodManager?.provideShadowAndCornerRadius(self.btnRegisterRef, 2, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.darkGrayColor, -1, 1, 1, 3, 0, AppColor.clearColor)
        
        
        self.btnRegisterRef.setTitle(ConstantTexts.Register_BT, for: .normal)
        self.btnRegisterRef.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        
        self.btnRegisterRef.setTitleColor(AppColor.whiteColor, for: .normal)
        self.btnRegisterRef.backgroundColor = AppColor.themeColor
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points
        
        
        let myMutableString = NSMutableAttributedString()
        let myMutableString_For_Instruction = NSMutableAttributedString()
        
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.AlreadyHaveBT)  ", font: UIFont.systemFont(ofSize: 14.0), color: AppColor.textColor) ?? NSMutableAttributedString())
        
        /*  self.lblInstruction.font = UIFont.systemFont(ofSize: 12)
         self.lblInstruction.textColor = AppColor.darkGrayColor
         */
        
        self.lblInstruction.numberOfLines = 0
        
        
        if tag == 0{
            myMutableString.append(customMethodManager?.provideUnderlineAttributedText(text: ConstantTexts.LogInAsC_BT, font:  UIFont.boldSystemFont(ofSize: 14.0), AppColor.themeColor) ?? NSMutableAttributedString())
            
            
            myMutableString_For_Instruction.append(customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.CustomerBT)\n\n", font:  UIFont.boldSystemFont(ofSize: 16.0), color: AppColor.themeColor) ?? NSMutableAttributedString())
            
            myMutableString_For_Instruction.append(customMethodManager?.provideSimpleAttributedText(text: ConstantTexts.CustomerIns_LT, font:  UIFont.systemFont(ofSize: 12.0), color: AppColor.darkGrayColor) ?? NSMutableAttributedString())
            
            
            // *** Apply attribute to string ***
            myMutableString_For_Instruction.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString_For_Instruction.length))
            
            // *** Set Attributed String to your label ***
            
            
            self.lblInstruction.attributedText = myMutableString_For_Instruction
            
        }else{
            myMutableString.append(customMethodManager?.provideUnderlineAttributedText(text: ConstantTexts.LogInAsL_BT, font:  UIFont.boldSystemFont(ofSize: 14.0), AppColor.themeColor) ?? NSMutableAttributedString())
            
            
            myMutableString_For_Instruction.append(customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.LawyerBT)\n\n", font:  UIFont.boldSystemFont(ofSize: 16.0), color: AppColor.themeColor) ?? NSMutableAttributedString())
            
            myMutableString_For_Instruction.append(customMethodManager?.provideSimpleAttributedText(text: ConstantTexts.LawyerIns_LT, font:  UIFont.systemFont(ofSize: 12.0), color: AppColor.darkGrayColor) ?? NSMutableAttributedString())
            
            // *** Apply attribute to string ***
            myMutableString_For_Instruction.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString_For_Instruction.length))
            
            // *** Set Attributed String to your label ***
            
            self.lblInstruction.attributedText = myMutableString_For_Instruction
        }
        
        
        
        
        
        
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        
        // *** Set Attributed String to your label ***
        
        self.btnLoginRef.setAttributedTitle(myMutableString, for: .normal)
        
        
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
    
    
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.isHiddenNavigationBar(true)
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
