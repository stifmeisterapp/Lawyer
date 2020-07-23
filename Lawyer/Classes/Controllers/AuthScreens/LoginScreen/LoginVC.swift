//
//  LoginVC.swift
//  Lawyer
//
//  Created by Aman Kumar on 23/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit

class LoginVC: SBaseViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var btnLawyerRef: UIButton!
    @IBOutlet weak var btnCustomerRef: UIButton!
    @IBOutlet weak var btnSendOTPRef: UIButton!
    @IBOutlet weak var btnSignUpRef: UIButton!
    
    @IBOutlet weak var txtPhoneNumber: UITextField!{
        didSet {
            txtPhoneNumber.tintColor = UIColor.lightGray
            txtPhoneNumber.setIcon(UIImage(systemName: "phone.fill") ?? UIImage())
        }
    }
    
    
    
    //MARK: - Variables
    internal var customMethodManager:CustomMethodProtocol?
    internal var validationMethodManager:ValidationProtocol?
    internal var tag = Int()
    //MARK: - View life cycle methods
    //TODO: Implementation viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        initValues()
        
    }
    
    //TODO: Implementation viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navSetup()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     
     
     
     */
    
    
    //MARK: - Actions, Gestures, Selectors
    
    //TODO: Selectors
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    //TODO: Actions
    @IBAction func btnLawyerTapped(_ sender: UIButton) {
        
        self.tag = 1
        
        self.customMethodManager?.provideCornerBorderTo(self.btnCustomerRef, 1, AppColor.themeColor)
        self.btnCustomerRef.setTitleColor(AppColor.themeColor, for: .normal)
        self.btnCustomerRef.backgroundColor = AppColor.whiteColor
        
        
        self.btnLawyerRef.setTitleColor(AppColor.whiteColor, for: .normal)
        self.btnLawyerRef.backgroundColor = AppColor.themeColor
        
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points
        
        
        let myMutableString = NSMutableAttributedString()
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: ConstantTexts.DontHaveBT, font: UIFont.systemFont(ofSize: 15.0), color: AppColor.textColor) ?? NSMutableAttributedString())
        
        myMutableString.append(customMethodManager?.provideUnderlineAttributedText(text: ConstantTexts.SignUpAsL_BT, font: UIFont.systemFont(ofSize: 15.0), AppColor.themeColor) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        
        // *** Set Attributed String to your label ***
        
        self.btnSignUpRef.setAttributedTitle(myMutableString, for: .normal)
        
        
    }
    
    @IBAction func btnCustomerTapped(_ sender: UIButton) {
        self.tag = 0
        self.customMethodManager?.provideCornerBorderTo(self.btnLawyerRef, 1, AppColor.themeColor)
        self.btnLawyerRef.setTitleColor(AppColor.themeColor, for: .normal)
        self.btnLawyerRef.backgroundColor = AppColor.whiteColor
        
        self.btnCustomerRef.setTitleColor(AppColor.whiteColor, for: .normal)
        self.btnCustomerRef.backgroundColor = AppColor.themeColor
        
        
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
    
    @IBAction func btnSendOTPTapped(_ sender: UIButton) {
        
        isValidate()
        
        
    }
    
    @IBAction func btnSignUpTapped(_ sender: UIButton) {
        let vc = AppStoryboard.authSB.instantiateViewController(withIdentifier: SignUpVC.className) as! SignUpVC
        vc.tag = self.tag
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
