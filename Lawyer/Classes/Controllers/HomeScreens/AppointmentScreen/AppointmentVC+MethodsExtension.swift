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
        
        if self.validationMethodManager == nil {
            self.validationMethodManager = ValidationClass.shared
        }
        
        if appointMentVM == nil {
            appointMentVM = AppointmentVM.shared
        }
        
        
        
        initialSetup()
    }
    
    
    //TODO: Intial setup implementation
    private func initialSetup(){
        
        self.viewHeader.gradientBackground(from: AppColor.placeholderColor, to: AppColor.placeholderColor, direction: .leftToRight)
        
        self.indicator = customMethodManager?.configViews(view:self.view)
        
        self.btnBackRef.setImage(#imageLiteral(resourceName: "backDate").withRenderingMode(.alwaysTemplate), for: .normal)
        self.btnForwardRef.setImage(#imageLiteral(resourceName: "forwardDate").withRenderingMode(.alwaysTemplate), for: .normal)
        self.btnBackRef.tintColor = AppColor.themeColor
        self.btnForwardRef.tintColor = AppColor.themeColor
        
        self.btnBackRef.isHidden = self.count_Tapped <= 0 ? true : false
        self.setuserBtnIteraction()
        
        self.lblDate.textColor = AppColor.darkGrayColor
        self.lblDate.font = AppFont.Semibold.size(AppFontName.OpenSans, size: 14)
        self.lblDate.textAlignment = .center
        self.lblDate.backgroundColor = AppColor.tableBGColor
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy (EEEE)"
        
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
        
        
        
        formatter.dateFormat = "dd-MMM-yyyy"
        self.current_date = formatter.string(from: date)
        self.appointmentListService(current_date:self.current_date,another_date:self.next_date,isRefresh:Bool(), btnIdentity: String())
        registerNib()
        
    }
    
    
    //TODO: set header button user interaction
    internal func setuserBtnIteraction(){
        self.btnBackRef.isUserInteractionEnabled = !self.btnBackRef.isUserInteractionEnabled
        self.btnForwardRef.isUserInteractionEnabled = !self.btnForwardRef.isUserInteractionEnabled
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
    
    
    //TODO: Validate fields implementation
    internal func validateFields(validHandler: @escaping ( String, Bool,Bool) -> Void){
        if !validationMethodManager!.checkEmptyField(self.selectedSlot.trimmingCharacters(in: .whitespaces)) {
            validHandler( ConstantTexts.SelectTimeSlotALERT, Bool(),true)
            return
            
        }
        
        if !validationMethodManager!.checkEmptyField(self.expID.trimmingCharacters(in: .whitespaces)){
            validHandler( ConstantTexts.SelectCaseTypeALERT, Bool(), Bool())
            return
            
        }
        
        validHandler(ConstantTexts.empty,  true, Bool())
        
        
    }
    
    
    //TODO: Filter web service
    internal func appointmentListService(current_date:String,another_date:String,isRefresh:Bool,btnIdentity:String){
        
        self.customMethodManager?.startLoader(view:self.view, indicator: self.indicator)
        
        ServiceClass.shared.webServiceBasicMethod(url: "\(SCustomerApi.consultation_slot)\(current_date)&AnotherDateType=\(another_date)&Uuid=\(self.Uuid)", method: .get, parameters: nil, header: nil, success: { (result) in
            print(result)
            self.setuserBtnIteraction()
            
            self.customMethodManager?.stopLoader(view:self.view, indicator: self.indicator)
            if let result_Dict = result as? NSDictionary{
                if let code = result_Dict.value(forKey: "code") as? Int{
                    if code == 200{
                        if let data = result_Dict.value(forKey: "data") as? NSDictionary{
                            print(data)
                            
                            
                            self.selectedSlot = String()
                            var text = String()
                            if let CurrentDate = data.value(forKey: "CurrentDate") as? String{
                                self.current_date = CurrentDate
                                text = "\(CurrentDate)"
                            }
                            
                            if let WeekDay = data.value(forKey: "WeekDay") as? String{
                                text = text + " (\(WeekDay))"
                            }
                            self.lblDate.text = text
                            
                            
                            if let PrevDate = data.value(forKey: "PrevDate") as? String{
                                self.prev_date = PrevDate
                            }
                            
                            if let NextDate = data.value(forKey: "NextDate") as? String{
                                self.next_date = NextDate
                            }
                            
                            if let Expertise = data.value(forKey: "Expertise") as? NSArray{
                                if self.expertise_idArray.count > 0{
                                    self.expertise_idArray.removeAll()
                                }
                                
                                if self.expertise_nameArray.count > 0{
                                    self.expertise_nameArray.removeAll()
                                }
                                
                                self.expertise_idArray.append(ConstantTexts.empty)
                                self.expertise_nameArray.append(ConstantTexts.SelectLT)
                                
                                for item in Expertise{
                                    if let ExpertiseDict = item as? NSDictionary{
                                        
                                        if let expertise_id = ExpertiseDict.value(forKey: "ExpertiseId") as? String{
                                            self.expertise_idArray.append(expertise_id)
                                        }
                                        
                                        if let expertise_id = ExpertiseDict.value(forKey: "ExpertiseId") as? Int{
                                            self.expertise_idArray.append("\(expertise_id)")
                                        }
                                        
                                        if let expertise_name = ExpertiseDict.value(forKey: "ExpertiseName") as? String{
                                            self.expertise_nameArray.append(expertise_name)
                                        }
                                        
                                        
                                    }
                                }
                            }
                            
                            if btnIdentity == "NEXT"{
                                if self.count_Tapped >= 14{
                                    self.btnForwardRef.isHidden = true
                                    self.count_Tapped = 15
                                }else{
                                    self.count_Tapped += 1
                                    self.btnForwardRef.isHidden = false
                                    self.btnBackRef.isHidden = false
                                }
                            }else if btnIdentity == "PREV"{
                                if self.count_Tapped <= 1{
                                    self.btnBackRef.isHidden = true
                                    self.count_Tapped = 0
                                }else{
                                    self.count_Tapped -= 1
                                    self.btnBackRef.isHidden = false
                                    self.btnForwardRef.isHidden = false
                                }
                            }else{
                                print("Do nothing")
                            }
                            
                            
                            if self.appointMentListVM == nil {
                                self.appointMentListVM = self.appointMentVM?.prepareDataSource(data: data)
                            }else{
                                if let count = self.appointMentListVM?.appointments.count{
                                    if count > 0{
                                        self.appointMentListVM?.appointments.removeAll()
                                    }
                                    self.appointMentListVM = self.appointMentVM?.prepareDataSource(data: data)
                                }
                            }
                            
                        }
                        
                        DispatchQueue.main.async {
                            self.tblAppointment.reloadData()
                        }
                        
                    }else{
                        if let message = result_Dict.value(forKey: "message") as? String{
                            _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: message, style:.error)
                        }
                        
                    }
                }
            }
            
            
        }) { (error) in
            print(error)
            self.setuserBtnIteraction()
            self.customMethodManager?.stopLoader(view:self.view, indicator: self.indicator)
            if let errorString = (error as NSError).userInfo[ConstantTexts.errorMessage_Key] as? String{
                _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: errorString, style:.error)
            }else{
                _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: ConstantTexts.errorMessage, style:.error)
            }
            
        }
        
    }
    
}


