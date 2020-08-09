//
//  MoreVC+CustomMethods.swift
//  Lawyer
//
//  Created by Aman Kumar on 08/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
import ViewAnimator
extension MoreVC{
    
    //TODO: Init values
    internal func initValues(){
        if customMethodManager == nil {
            customMethodManager = CustomMethodClass.shared
        }
        
        
        initialSetup()
        
    }
    
    
    
    //TODO: Intial setup implementation
    private func initialSetup(){
        // For Tableview
        /* self.tblMore.tableHeaderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double.leastNormalMagnitude))
         self.tblMore.tableFooterView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double.leastNormalMagnitude))
         
         self.tblMore.sectionHeaderHeight = 0.0;
         self.tblMore.sectionFooterHeight = 0.0; */
        
        
        self.initalHideBlurView()
        
        self.tblMore.backgroundColor = AppColor.whiteColor
        self.tblMore.separatorStyle = .singleLine
        self.tblMore.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.tblMore.hideEmptyCells()
        self.tblMore.isHidden = true
        self.tblMore.isScrollEnabled = true
        
        self.customMethodManager?.provideShadowAndCornerRadius(self.viewBG, 5, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.placeholderColor, 2, 2, 2, 2, 1, AppColor.placeholderColor)
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 2 // Whatever line spacing you want in points
        
        let myMutableString = NSMutableAttributedString()
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "Jack Shukla", font: AppFont.Semibold.size(AppFontName.OpenSans, size: 16), color: AppColor.textColor) ?? NSMutableAttributedString())
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\njack@gmail.com", font: AppFont.Semibold.size(AppFontName.OpenSans, size: 12), color: AppColor.darkGrayColor) ?? NSMutableAttributedString())
        
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\n+91-8445577995", font: AppFont.Semibold.size(AppFontName.OpenSans, size: 12), color: AppColor.darkGrayColor) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        
        self.labelName.numberOfLines = 0
        self.labelName.attributedText = myMutableString
        
        
        recheckDataModels()
    }
    
    
   
    
    
    //TODO: Recheck data models implenemtation
    private func recheckDataModels(){
        if  self.moreVM == nil{
            self.moreVM = MoreVM.shared
        }
        
        if  self.categoryListVM == nil{
            self.categoryListVM = self.moreVM?.prepareDataSource()
        }
        
        registerNib()
        
    }
    
    //TODO: register nib file
    private func registerNib(){
        // For Tableview
        self.tblMore.register(nib: LawyerTableViewCell.className)
        animateView()
        /* For Tableview
         
         DispatchQueue.main.asyncAfter(deadline: .now()) {
         self.categoryTableView.isHidden = false
         
         self.currentTableAnimation =  TableAnimation.fadeIn(duration: self.animationDuration, delay: self.delay)
         
         /* self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 60,duration: self.animationDuration, delay: self.delay) */
         
         self.categoryTableView.reloadData()
         } */
    }
    
    
    //TODO: Animate rotate table view
    internal func animateView(){
        self.tblMore.isHidden = false
        self.tblMore.reloadData()
        let fromAnimation = AnimationType.from(direction: .right, offset: 30.0)
        UIView.animate(views: tblMore.visibleCells,
                       animations: [fromAnimation], delay: 0.5)
        
    }
    
    
   
    
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.tabBarController?.tabBar.isHidden = false
        super.setupNavigationBarTitle(AppColor.themeColor,ConstantTexts.MoreHT, leftBarButtonsType: [.empty], rightBarButtonsType: [])
        
    }
    
    
    //TODO: Perform table actions
    internal func perforAction(Index:Int){
        switch Index{
            
        case 0:
            let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: UnderConstructionVC.className) as! UnderConstructionVC
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            
            let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: FAQ_VC.className) as! FAQ_VC
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 2:
            self.animateView()
            let message = ConstantTexts.Link_LT
            //Set the link to share.
            if let link = NSURL(string: "\(APP_LINK)?ls=1&mt=8")
            {
                let objectsToShare = [message,link] as [Any]
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
                
                activityVC.popoverPresentationController?.sourceView = self.view
                
                self.present(activityVC, animated: true, completion: nil)
            }
            
            
            
        case 3:
            let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: UnderConstructionVC.className) as! UnderConstructionVC
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 4:
            self.rateUs()
        case 5:
            let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: AboutUsVC.className) as! AboutUsVC
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 6:
            let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: UnderConstructionVC.className) as! UnderConstructionVC
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 7:
            let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: UnderConstructionVC.className) as! UnderConstructionVC
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 8:
            _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: ConstantTexts.WantToLogoutALERT, style: AlertStyle.warning, buttonTitle:ConstantTexts.CancelBT, buttonColor:AppColor.errorColor , otherButtonTitle:  ConstantTexts.OkBT, otherButtonColor: AppColor.passGreenColor) { (isOtherButton) -> Void in
                if isOtherButton == true {
                    self.animateView()
                }
                else
                {
                    super.moveToNextViewCViaRoot(name: ConstantTexts.AuthSBT, withIdentifier: LoginVC.className)
                }
                
            }
        default:
            print("Do nothing...")
            //temp
            self.animateView()
        }
    }
    
    
    //TODO: Show blurr view
    internal func rateUs() {
        animateView()
        self.blurView.isHidden = false
        UIView.animate(withDuration: 0.3, animations: {
            self.blurView.alpha = 0.85
        }) { (status) in
            self.blurView.alpha = 0.85
        }
        
    }
    
    //TODO: Implementation initail hide blur view
    internal func initalHideBlurView(){
           self.blurView.isHidden = true
           self.blurView.alpha = 0
       }
    
    //TODO: Implementation hide blur view
       internal func hideBlurView(){
           self.blurView.isHidden = true
           UIView.animate(withDuration: 0.3, animations: {
               self.blurView.alpha = 0
           }) { (status) in
               self.blurView.alpha = 0
               
           }
           
       }
    
   
    
}
