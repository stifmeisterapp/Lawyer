//
//  AppointmentVC+MethodsExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 07/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
import ViewAnimator
extension AppointmentVC{
    
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.tabBarController?.tabBar.isHidden = true
        super.setupNavigationBarTitle(AppColor.themeColor,ConstantTexts.BookAppointmentLT, leftBarButtonsType: [.back], rightBarButtonsType: [])
        
    }
    
    //TODO: Init values
    internal func initValues(){
        if customMethodManager == nil {
            customMethodManager = CustomMethodClass.shared
        }
        initialSetup()
    }
    

    //TODO: Intial setup implementation
    private func initialSetup(){
        
        self.viewHeader.gradientBackground(from: AppColor.placeholderColor, to: AppColor.placeholderColor, direction: .leftToRight)
    
        self.btnBackRef.setImage(#imageLiteral(resourceName: "backDate").withRenderingMode(.alwaysTemplate), for: .normal)
        self.btnForwardRef.setImage(#imageLiteral(resourceName: "forwardDate").withRenderingMode(.alwaysTemplate), for: .normal)
        self.btnBackRef.tintColor = AppColor.themeColor
        self.btnForwardRef.tintColor = AppColor.themeColor
        
        self.btnBackRef.isHidden = self.count_Tapped <= 0 ? true : false
        
        
        self.lblDate.textColor = AppColor.darkGrayColor
        self.lblDate.font = AppFont.Semibold.size(AppFontName.OpenSans, size: 16)
        self.lblDate.textAlignment = .center
        self.lblDate.backgroundColor = AppColor.tableBGColor
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy (EEEE)"

        self.lblDate.text = formatter.string(from: date)
        
        
        self.tblAppointment.tableHeaderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double.leastNormalMagnitude))
        self.tblAppointment.tableFooterView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double.leastNormalMagnitude))
        
        self.tblAppointment.sectionHeaderHeight = 0.0;
        self.tblAppointment.sectionFooterHeight = 0.0;
        
        self.tblAppointment.separatorStyle = .none
        self.tblAppointment.hideEmptyCells()
        self.tblAppointment.isHidden = true
        self.tblAppointment.isScrollEnabled = true
        self.tblAppointment.backgroundColor = AppColor.whiteColor
        self.tblAppointment.addSubview(self.refreshControl)
        
       
        
        //TODO: Temp static code (Needs to be removed)
        
        self.data.append(AppointmentViewModel(#imageLiteral(resourceName: "morning"), ConstantTexts.MorningLT, [AppointmentTimeDataModel("09:00 \(ConstantTexts.AM_LT)", Bool()),
        AppointmentTimeDataModel("09:30 \(ConstantTexts.AM_LT)", Bool()),
        AppointmentTimeDataModel("10:00 \(ConstantTexts.AM_LT)", Bool()),
        AppointmentTimeDataModel("10:30 \(ConstantTexts.AM_LT)", true),
        AppointmentTimeDataModel("11:00 \(ConstantTexts.AM_LT)", Bool()),
        AppointmentTimeDataModel("11:30 \(ConstantTexts.AM_LT)", Bool())]))
        
        self.data.append(AppointmentViewModel(#imageLiteral(resourceName: "afternoon"), ConstantTexts.AfternoonLT, [AppointmentTimeDataModel("12:30 \(ConstantTexts.PM_LT)", Bool()),
        AppointmentTimeDataModel("01:00 \(ConstantTexts.PM_LT)", Bool()),
        AppointmentTimeDataModel("01:30 \(ConstantTexts.PM_LT)", Bool()),
        AppointmentTimeDataModel("02:00 \(ConstantTexts.PM_LT)", true),
        AppointmentTimeDataModel("02:30 \(ConstantTexts.PM_LT)", Bool())]))
        
        self.data.append(AppointmentViewModel(#imageLiteral(resourceName: "evening"), ConstantTexts.EveningLT, [AppointmentTimeDataModel("03:00 \(ConstantTexts.PM_LT)", Bool()),
        AppointmentTimeDataModel("03:30 \(ConstantTexts.PM_LT)", true),
        AppointmentTimeDataModel("04:00 \(ConstantTexts.PM_LT)", Bool()),
        AppointmentTimeDataModel("04:30 \(ConstantTexts.PM_LT)", Bool()),
        AppointmentTimeDataModel("05:00 \(ConstantTexts.PM_LT)", Bool()),
        AppointmentTimeDataModel("05:30 \(ConstantTexts.PM_LT)", Bool()),
        AppointmentTimeDataModel("06:00 \(ConstantTexts.PM_LT)", Bool())]))
        
        
         registerNib()
        
    }
    
    
    //TODO: register nib file
    private func registerNib(){
        self.tblAppointment.register(nib: AppointMentTableViewCellAndXib.className)
        animateView()
    }
    
    //TODO: Animate rotate collection view
    internal func animateView(){
        self.tblAppointment.isHidden = false
        self.tblAppointment.reloadData()
        let fromAnimation = AnimationType.from(direction: .right, offset: 30.0)
        UIView.animate(views: tblAppointment.visibleCells,
                       animations: [fromAnimation], delay: 0.5)
        
        
        
    }
    
}


