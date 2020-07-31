//
//  LawyerNewTableViewCell.swift
//  Lawyer
//
//  Created by Aman Kumar on 30/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit

class LawyerNewTableViewCell: SBaseTableViewCell {

    
    //MARK: - IBOutlets
      
      @IBOutlet weak var viewBG: UIView!
      
      @IBOutlet weak var imageLawyer: UIImageView!
      @IBOutlet weak var labelNameLayer: UILabel!
     
      @IBOutlet weak var imageLawyerNav: UIImageView!
      
      @IBOutlet weak var viewSeprator1: UIView!
      
      @IBOutlet weak var labelExperience: UILabel!
      @IBOutlet weak var labelCall: UILabel!
      @IBOutlet weak var labelMeet: UILabel!
      
      @IBOutlet weak var viewSeprator2: UIView!
      
      @IBOutlet weak var buttonMeetRef: UIButton!
      @IBOutlet weak var buttonCallRef: UIButton!
      
      //MARK: - Variables
      internal var customMethodManager:CustomMethodProtocol?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    //TODO: Setup cell implementation
    private func setUpCell(){
        
        if customMethodManager == nil {
            customMethodManager = CustomMethodClass.shared
        }
        
        self.imageLawyerNav.isHidden = true
        
        self.backgroundColor = AppColor.tableBGColor
        self.viewBG.backgroundColor = AppColor.whiteColor
        self.customMethodManager?.provideShadowAndCornerRadius(self.viewBG, 10, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.placeholderColor, 2, 2, 2, 2, 0, AppColor.tableBGColor)
        
        self.imageLawyer.setImageTintColor(AppColor.darkGrayColor)
        self.customMethodManager?.provideCornerRadiusTo(self.imageLawyer, 5, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner])
        self.customMethodManager?.provideCornerBorderTo(self.imageLawyer, 1, AppColor.darkGrayColor)
        
        self.imageLawyerNav.setImageTintColor(AppColor.themeColor)
        
       /* self.viewSeprator1.backgroundColor = AppColor.darkGrayColor
        self.viewSeprator2.backgroundColor = AppColor.darkGrayColor */
        
        self.viewSeprator1.backgroundColor = AppColor.clearColor
        self.viewSeprator2.backgroundColor = AppColor.clearColor
        
        
        self.customMethodManager?.provideCornerRadiusTo(self.buttonMeetRef, 5, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner])
        self.customMethodManager?.provideCornerBorderTo(self.buttonMeetRef, 1, AppColor.themeColor)
        
        self.buttonMeetRef.setTitleColor(AppColor.themeColor, for: .normal)
        self.buttonMeetRef.backgroundColor = AppColor.whiteColor
        self.buttonMeetRef.setTitle(ConstantTexts.CallBT, for: .normal)
        self.buttonMeetRef.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        
        
        self.customMethodManager?.provideCornerRadiusTo(self.buttonCallRef, 5, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner])
        
        self.buttonCallRef.setTitleColor(AppColor.whiteColor, for: .normal)
        self.buttonCallRef.backgroundColor = AppColor.themeColor
        self.buttonCallRef.setTitle(ConstantTexts.MeetBT, for: .normal)
        self.buttonCallRef.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        
        //TODO: Values
        
        
        self.labelNameLayer.font = UIFont.systemFont(ofSize: 15.0)
        self.labelNameLayer.textColor = AppColor.textColor
        
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyleLeft = NSMutableParagraphStyle()
        paragraphStyleLeft.alignment = .left
        
        // *** set LineSpacing property in points ***
        paragraphStyleLeft.lineSpacing = 5 // Whatever line spacing you want in points
        
        var myMutableString = NSMutableAttributedString()
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "Jack Shukla", font: UIFont.boldSystemFont(ofSize: 18), color: AppColor.textColor) ?? NSMutableAttributedString())
        
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\nDelhi, Noida", font: UIFont.systemFont(ofSize: 15.0), color: AppColor.darkGrayColor) ?? NSMutableAttributedString())
        
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\nHindi, English", font: UIFont.systemFont(ofSize: 15.0), color: AppColor.darkGrayColor) ?? NSMutableAttributedString())
        
        
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyleLeft, range:NSMakeRange(0, myMutableString.length))
        
        // *** Set Attributed String to your label ***
        self.labelNameLayer.numberOfLines = 0
        self.labelNameLayer.attributedText = myMutableString
        
        
       
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points
        
        
        myMutableString = NSMutableAttributedString()
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: ConstantTexts.ExperienceLT, font: UIFont.systemFont(ofSize: 15.0), color: AppColor.darkGrayColor) ?? NSMutableAttributedString())
        
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\n \(15) \(ConstantTexts.YrsLT)", font: UIFont.systemFont(ofSize: 15.0), color: AppColor.textColor) ?? NSMutableAttributedString())
        
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        
        // *** Set Attributed String to your label ***
        
        self.labelExperience.attributedText = myMutableString
        
        
        
        
        
        myMutableString = NSMutableAttributedString()
        
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: ConstantTexts.CallLT, font: UIFont.systemFont(ofSize: 15.0), color: AppColor.darkGrayColor) ?? NSMutableAttributedString())
        
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\n\(ConstantTexts.CurLT)  \(500)", font: UIFont.systemFont(ofSize: 15.0), color: AppColor.textColor) ?? NSMutableAttributedString())
        
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        
        // *** Set Attributed String to your label ***
        
        self.labelCall.attributedText = myMutableString
        
        
        
        myMutableString = NSMutableAttributedString()
        
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: ConstantTexts.MeetLT, font: UIFont.systemFont(ofSize: 15.0), color: AppColor.darkGrayColor) ?? NSMutableAttributedString())
        
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\n\(ConstantTexts.CurLT)  \(2000)", font: UIFont.systemFont(ofSize: 15.0), color: AppColor.textColor) ?? NSMutableAttributedString())
        
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        
        // *** Set Attributed String to your label ***
        
        self.labelMeet.attributedText = myMutableString
        
        
        
    }
    
    
}
