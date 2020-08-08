//
//  PaymentVC+MethodExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 07/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
extension PaymentVC{
    
    
    //TODO: Init values
    internal func initValues(){
        if customMethodManager == nil {
            customMethodManager = CustomMethodClass.shared
        }
        
        if self.gstinModeling == nil {
            self.gstinModeling = PaymentVM.shared
        }
        
        if  self.dataListVM == nil{
            self.dataListVM = self.gstinModeling?.prepareDataSource()
        }
        
        
        initialSetup()
        
    }
    
    
    //TODO: Intial setup implementation
    private func initialSetup(){
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        self.tblPayment.tableHeaderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double.leastNormalMagnitude))
        self.tblPayment.tableFooterView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double.leastNormalMagnitude))
        
        self.tblPayment.sectionHeaderHeight = 0.0;
        self.tblPayment.sectionFooterHeight = 0.0;
        
        self.tblPayment.separatorStyle = .none
        self.tblPayment.hideEmptyCells()
        self.tblPayment.isHidden = false
        self.tblPayment.isScrollEnabled = true
        self.tblPayment.backgroundColor = AppColor.tableBGColor
        registerNib()
        
        self.header.imgName.image = UIImage(systemName: "person.circle") ?? UIImage()
        self.header.imgName.setImageTintColor(AppColor.darkGrayColor)
        self.header.imgName.contentMode = .scaleToFill
        self.header.lblName.font = AppFont.Regular.size(AppFontName.OpenSans, size: 12)
        self.header.lblName.textColor = AppColor.darkGrayColor
        self.header.lblName.numberOfLines = 0
        
        self.header.imgEmail.image = UIImage(systemName: "envelope") ?? UIImage()
        self.header.imgEmail.setImageTintColor(AppColor.darkGrayColor)
        self.header.imgEmail.contentMode = .scaleToFill
        self.header.lblEmail.font = AppFont.Regular.size(AppFontName.OpenSans, size: 12)
        self.header.lblEmail.textColor = AppColor.darkGrayColor
        self.header.lblEmail.numberOfLines = 0
        
        self.header.imgPhone.image = UIImage(systemName: "phone") ?? UIImage()
        self.header.imgPhone.setImageTintColor(AppColor.darkGrayColor)
        self.header.imgPhone.contentMode = .scaleToFill
        self.header.lblPhone.font = AppFont.Regular.size(AppFontName.OpenSans, size: 12)
        self.header.lblPhone.textColor = AppColor.darkGrayColor
        self.header.lblPhone.numberOfLines = 0
        
        self.header.paymentSummaryTitle.font = AppFont.Semibold.size(AppFontName.OpenSans, size: 14)
        self.header.paymentSummaryTitle.textColor = AppColor.darkGrayColor
        self.header.paymentSummaryTitle.numberOfLines = 0
        self.header.paymentSummaryTitle.text = ConstantTexts.PaySummary_LT
        
        self.header.originalPriceTitle.font = AppFont.Regular.size(AppFontName.OpenSans, size: 12)
        self.header.originalPriceTitle.textColor = AppColor.darkGrayColor
        self.header.originalPriceTitle.numberOfLines = 0
        self.header.originalPriceTitle.text = ConstantTexts.OriginalPrice_LT
        
        self.header.originalPriceValue.font = AppFont.Regular.size(AppFontName.OpenSans, size: 12)
        self.header.originalPriceValue.textColor = AppColor.darkGrayColor
        self.header.originalPriceValue.numberOfLines = 0
        
        self.header.gstPriceTitle.font = AppFont.Regular.size(AppFontName.OpenSans, size: 12)
        self.header.gstPriceTitle.textColor = AppColor.darkGrayColor
        self.header.gstPriceTitle.numberOfLines = 0
        self.header.gstPriceTitle.text = "\(ConstantTexts.Gst_LT)\(18)\(ConstantTexts.Per_LT)"
        
        self.header.gstPriceValue.font = AppFont.Regular.size(AppFontName.OpenSans, size: 12)
        self.header.gstPriceValue.textColor = AppColor.darkGrayColor
        self.header.gstPriceValue.numberOfLines = 0
        
        self.header.couponAppliedTitle.font = AppFont.Regular.size(AppFontName.OpenSans, size: 12)
        self.header.couponAppliedTitle.textColor = AppColor.passGreenColor
        self.header.couponAppliedTitle.numberOfLines = 0
        self.header.couponAppliedTitle.text = ConstantTexts.CouponApplied_LT
        
        self.header.imgCoupon.image = #imageLiteral(resourceName: "check")
        self.header.imgCoupon.setImageTintColor(AppColor.passGreenColor)
        
        self.header.totalPriceTitle.font = AppFont.Semibold.size(AppFontName.OpenSans, size: 14)
        self.header.totalPriceTitle.textColor = AppColor.darkGrayColor
        self.header.totalPriceTitle.numberOfLines = 0
        self.header.totalPriceTitle.text = ConstantTexts.Total_LT
        
        self.header.totalPriceValue.font = AppFont.Semibold.size(AppFontName.OpenSans, size: 14)
        self.header.totalPriceValue.textColor = AppColor.darkGrayColor
        self.header.totalPriceValue.numberOfLines = 0
        
        self.header.viewBGTotal.backgroundColor = AppColor.tableBGColor
        
        self.header.txtCoupon.addBorders(edges: [.top,.bottom,.left], color: AppColor.placeholderColor, inset: 0.0, thickness: 1.0)
        self.header.txtCoupon.font = AppFont.Regular.size(AppFontName.OpenSans, size: 12)
        self.header.txtCoupon.placeholder = ConstantTexts.CouponCode_PH
        self.header.txtCoupon.textColor = AppColor.textColor
        self.header.txtCoupon.addPadding(.both(10.0))
        
        self.header.txtCoupon.maxLength = 10
        self.header.txtCoupon.keyboardType = .default
        self.header.txtCoupon.isSecureTextEntry = false
        self.header.txtCoupon.autocapitalizationType = .none
        
        self.header.btnApplyRef.addBorders(edges: [.top,.bottom,.left,.right], color: AppColor.placeholderColor, inset: 0.0, thickness: 1.0)
        self.header.btnApplyRef.tintColor = AppColor.whiteColor
        self.header.btnApplyRef.backgroundColor = AppColor.themeColor
        self.header.btnApplyRef.setTitle(ConstantTexts.Apply_BT, for: .normal)
        
        self.header.viewSwitch.backgroundColor = AppColor.tableBGColor
        self.header.switch_Ref.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
        
        self.header.lblName.text = "Jack Shukla"
        
        self.header.lblEmail.text = "jack@gmail.com"
        self.header.lblPhone.text = "8445577995"
        self.header.originalPriceValue.text = "\(ConstantTexts.CurLT) 5500"
        self.header.gstPriceValue.text = "\(ConstantTexts.CurLT) 500"
        self.header.totalPriceValue.text = "\(ConstantTexts.CurLT) 6000"
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 1 // Whatever line spacing you want in points
        
        
        let myMutableString = NSMutableAttributedString()
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.HaveGSTIN_LT)\n", font: AppFont.Semibold.size(AppFontName.OpenSans, size: 14), color: AppColor.textColor) ?? NSMutableAttributedString())
        
        if self.header.switch_Ref.isOn{
            myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\n\(ConstantTexts.HaveGSTIN_Ins_LT)", font: AppFont.Regular.size(AppFontName.OpenSans, size: 12), color: AppColor.textColor) ?? NSMutableAttributedString())
        }
        
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        
        // *** Set Attributed String to your label ***
        header.lblGSTIN.numberOfLines = 0
        header.lblGSTIN.attributedText = myMutableString
        
        
        
        
        
        
        
        
        
    }
    
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.tabBarController?.tabBar.isHidden = true
        super.setupNavigationBarTitle(AppColor.themeColor,ConstantTexts.PaymentHT, leftBarButtonsType: [.back], rightBarButtonsType: [])
        
    }
    
    //TODO: register nib file
    private func registerNib(){
        self.tblPayment.register(nib: GSTIN_TableViewCellAndXib.className)
        self.tblPayment.reloadData()
    }
    
    
    
    //TODO: setup validation
    internal func isValidate(){
        dismissKeyboard()
        
        if let dataListVM_T = self.dataListVM{
            self.gstinModeling?.validateFields(dataStore: dataListVM_T, validHandler: { (strMsg, status, row, section) in
                if status{
                    
                }else{
                    let indexPath = IndexPath(row: row, section: section)
                    
                    if let cell = self.tblPayment.cellForRow(at: indexPath) as? GSTIN_TableViewCellAndXib{
                        
                        self.customMethodManager!.showToolTip(msg: strMsg, anchorView: cell.textField, sourceView: self.view)
                        cell.textField.becomeFirstResponder()
                        
                    }
                    
                    
                }
            })
        }
        
    }
    
    
}
