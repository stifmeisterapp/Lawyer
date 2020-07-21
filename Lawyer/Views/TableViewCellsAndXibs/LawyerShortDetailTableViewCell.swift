//
//  LawyerShortDetailTableViewCell.swift
//  Lawyer
//
//  Created by Aman Kumar on 21/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit

class LawyerShortDetailTableViewCell: SBaseTableViewCell {
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var viewBG: UIView!
    
    @IBOutlet weak var imageLawyer: UIImageView!
    @IBOutlet weak var labelNameLayer: UILabel!
    
    
    @IBOutlet weak var imageLawyerExp: UIImageView!
    @IBOutlet weak var labelNameLayerExp: UILabel!
    
    @IBOutlet weak var imageLawyerLoc: UIImageView!
    @IBOutlet weak var labelNameLayerLoc: UILabel!
    
    @IBOutlet weak var imageLawyerLang: UIImageView!
    @IBOutlet weak var labelNameLayerLang: UILabel!
    
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
        
        self.backgroundColor = UIColor(named: "CreamColor") ?? .clear
        self.viewBG.backgroundColor = UIColor(named: "WhiteShadow") ?? .clear
        self.customMethodManager?.provideShadowAndCornerRadius(self.viewBG, 10, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], UIColor(named: "LightGrayColor") ?? .clear, 2, 2, 2, 2, 0, UIColor(named: "CreamColor") ?? .clear)
        
        self.imageLawyer.setImageTintColor(UIColor(named: "DarkGrayColor") ?? .clear)
        
        self.labelNameLayer.font = UIFont.systemFont(ofSize: 15.0)
        self.labelNameLayer.textColor = UIColor(named: "BlackColor") ?? .clear
        
        self.imageLawyerExp.setImageTintColor(UIColor(named: "CyanColor") ?? .clear)
        self.labelNameLayerExp.font = UIFont.systemFont(ofSize: 15.0)
        self.labelNameLayerExp.textColor = UIColor(named: "DarkGrayColor") ?? .clear
        
        self.imageLawyerLoc.setImageTintColor(UIColor(named: "TangerineColor") ?? .clear)
        self.labelNameLayerLoc.font = UIFont.systemFont(ofSize: 15.0)
        self.labelNameLayerLoc.textColor = UIColor(named: "DarkGrayColor") ?? .clear
        
        
        self.imageLawyerLang.setImageTintColor(UIColor(named: "LaunchColor") ?? .clear)
        self.labelNameLayerLang.font = UIFont.systemFont(ofSize: 15.0)
        self.labelNameLayerLang.textColor = UIColor(named: "DarkGrayColor") ?? .clear
        
        self.imageLawyerNav.setImageTintColor(UIColor(named: "LaunchColor") ?? .clear)
        
        self.viewSeprator1.backgroundColor = UIColor(named: "DarkGrayColor") ?? .clear
        self.viewSeprator2.backgroundColor = UIColor(named: "DarkGrayColor") ?? .clear
        
        
        self.customMethodManager?.provideCornerRadiusTo(self.buttonMeetRef, 5, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner])
        self.customMethodManager?.provideCornerBorderTo(self.buttonMeetRef, 1, UIColor(named: "LaunchColor") ?? .clear)
        
        self.buttonMeetRef.setTitleColor(UIColor(named: "LaunchColor") ?? .clear, for: .normal)
        self.buttonMeetRef.backgroundColor = UIColor(named: "WhiteShadow") ?? .clear
        self.buttonMeetRef.setTitle(ConstantTexts.MeetBT, for: .normal)
        self.buttonMeetRef.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        
        
        self.customMethodManager?.provideCornerRadiusTo(self.buttonCallRef, 5, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner])
        
        self.buttonCallRef.setTitleColor(UIColor(named: "WhiteShadow") ?? .clear, for: .normal)
        self.buttonCallRef.backgroundColor = UIColor(named: "LaunchColor") ?? .clear
        self.buttonCallRef.setTitle(ConstantTexts.CallBT, for: .normal)
        self.buttonCallRef.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        
        //TODO: Values
        self.labelNameLayerExp.text = ConstantTexts.NALT
        self.labelNameLayer.text = "Jack Shukla"
        self.labelNameLayerLoc.text = "North West Delhi, India"
        self.labelNameLayerLang.text = "English, Hindi"
        
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points
        
        
        var myMutableString = NSMutableAttributedString()
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: ConstantTexts.ExperienceLT, font: UIFont.systemFont(ofSize: 15.0), color: UIColor(named: "DarkGrayColor") ?? .clear) ?? NSMutableAttributedString())
        
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\n \(15) \(ConstantTexts.YrsLT)", font: UIFont.systemFont(ofSize: 15.0), color: UIColor(named: "BlackColor") ?? .clear) ?? NSMutableAttributedString())
        
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        
        // *** Set Attributed String to your label ***
        
        self.labelExperience.attributedText = myMutableString
        
        
        
        
        
        myMutableString = NSMutableAttributedString()
        
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: ConstantTexts.CallLT, font: UIFont.systemFont(ofSize: 15.0), color: UIColor(named: "DarkGrayColor") ?? .clear) ?? NSMutableAttributedString())
        
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\n\(ConstantTexts.CurLT)  \(500)", font: UIFont.systemFont(ofSize: 15.0), color: UIColor(named: "BlackColor") ?? .clear) ?? NSMutableAttributedString())
        
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        
        // *** Set Attributed String to your label ***
        
        self.labelCall.attributedText = myMutableString
        
        
        
        myMutableString = NSMutableAttributedString()
        
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: ConstantTexts.MeetLT, font: UIFont.systemFont(ofSize: 15.0), color: UIColor(named: "DarkGrayColor") ?? .clear) ?? NSMutableAttributedString())
        
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\n\(ConstantTexts.CurLT)  \(2000)", font: UIFont.systemFont(ofSize: 15.0), color: UIColor(named: "BlackColor") ?? .clear) ?? NSMutableAttributedString())
        
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        
        // *** Set Attributed String to your label ***
        
        self.labelMeet.attributedText = myMutableString
        
        
        
    }
    
    
}
