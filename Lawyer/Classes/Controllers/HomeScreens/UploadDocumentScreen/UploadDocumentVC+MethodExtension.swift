//
//  UploadDocumentVC+MethodExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 03/09/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
extension UploadDocumentVC{
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.tabBarController?.tabBar.isHidden = true
        super.setupNavigationBarTitle(AppColor.themeColor,ConstantTexts.UploadDocumentHT, leftBarButtonsType: [.back], rightBarButtonsType: [])
    }
    
    
    //TODO: Init values
    internal func initValues(){
        if self.customMethodManager == nil {
            self.customMethodManager = CustomMethodClass.shared
        }
        
        if self.docDataModeling == nil{
            self.docDataModeling = UploadDocumentVM.shared
        }
        
        if self.docDataList == nil{
            self.docDataList = docDataModeling?.prepareDataSource()
        }
        
      /*  let item = DocumentDataModel(Data(), String(), String(), "String", String(), Bool())
        
        self.docDataList?.documentDataItems.append(item)
        
        DispatchQueue.main.async {
            self.tblDocuments.reloadData()
        }
        */
        initialSetup()
        
    }
    
    
    //TODO: Intial setup implementation
    internal func initialSetup(){
        
        //  self.customMethodManager?.provideShadowAndCornerRadius(self.header.viewBG, 10, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.placeholderColor, -1, 1, 1, 3, 0, AppColor.clearColor)
        
        self.header.viewBG.cornerRadius = 10
        self.header.viewBG.dashColor = AppColor.placeholderColor
        self.header.viewBG.dashWidth = 1.5
        self.header.viewBG.dashLength = 6.0
        self.header.viewBG.betweenDashesSpace = 2.0
        
        self.customMethodManager?.showLottieAnimation(self.header.imgLottie, ConstantTexts.Upload_filesHeader, .loop)
        self.header.lblInstruction1.font = AppFont.Semibold.size(AppFontName.OpenSans, size: 14)
        self.header.lblInstruction1.textColor = AppColor.darkGrayColor
        self.header.lblInstruction1.numberOfLines = 0
        self.header.lblInstruction1.textAlignment = .center
        
        self.header.lblInstruction2.font = AppFont.Regular.size(AppFontName.OpenSans, size: 10)
        self.header.lblInstruction2.textColor = AppColor.darkGrayColor
        self.header.lblInstruction2.numberOfLines = 0
        self.header.lblInstruction2.textAlignment = .center
        self.header.lblInstruction2.text = ConstantTexts.UploadDocumentInsLT
        self.header.btnCamRef.tintColor = AppColor.darkGrayColor
        self.header.btnCamRef.addTarget(self, action: #selector(btnChooseTapped), for: .touchUpInside)
        
        self.tblDocuments.tableHeaderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double.leastNormalMagnitude))
        self.tblDocuments.tableFooterView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double.leastNormalMagnitude))
        
        self.tblDocuments.sectionHeaderHeight = 0.0;
        self.tblDocuments.sectionFooterHeight = 0.0;
        
        self.tblDocuments.hideEmptyCells()
        self.tblDocuments.isScrollEnabled = true
        self.tblDocuments.backgroundColor = AppColor.whiteColor
        registerNib()
        
        
        self.footer.lblInstruction2.font = AppFont.Semibold.size(AppFontName.OpenSans, size: 11)
        self.footer.lblInstruction2.textColor = AppColor.darkGrayColor
        self.footer.lblInstruction2.numberOfLines = 0
        self.footer.lblInstruction2.textAlignment = .center
        self.footer.lblInstruction2.text = ConstantTexts.AdditionalInfoLT
        
        self.footer.txtView.font = AppFont.Italic.size(AppFontName.OpenSans, size: 11)
        self.footer.txtView.text = ConstantTexts.WriteCommentPH
        self.footer.txtView.textColor = AppColor.darkGrayColor
        self.footer.txtView.delegate = self
        
        
        self.customMethodManager?.provideCornerRadiusTo(self.footer.viewBG, 10, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner])
        self.footer.viewBG.backgroundColor = AppColor.tableBGColor
        
        self.footer.txtView.backgroundColor = AppColor.tableBGColor
        
        self.customMethodManager?.provideShadowAndCornerRadius(self.btnSubmitRef, 2, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.darkGrayColor, -1, 1, 1, 3, 0, AppColor.clearColor)
        
        self.btnSubmitRef.setTitle(ConstantTexts.Submit_BT, for: .normal)
        self.btnSubmitRef.titleLabel?.font = ConstantFonts.mainBottomButtonFont
        
        self.btnSubmitRef.setTitleColor(AppColor.whiteColor, for: .normal)
        self.btnSubmitRef.backgroundColor = AppColor.themeColor
        
        
    }
    
    
    //TODO: Change header implementation
    internal func changeHeader(count:Int){
        if count == 0{
            self.header.lblInstruction1.text = ConstantTexts.UploadDocumentLT
            
        }else{
            self.header.lblInstruction1.text = ConstantTexts.DocumentUploadLT
        }
        
    }
    
    
    //TODO: register nib file
    private func registerNib(){
        self.tblDocuments.registerMultiple(nibs: [EmptyWithAlertTableViewCell.className,UploadDocTableViewCellAndXib.className])
        
    }
    
    //TODO: Delete row form index
    internal func deleteRow(index:Int){
        _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: ConstantTexts.WantToDeleteDocuALERT, style: AlertStyle.warning, buttonTitle:ConstantTexts.CancelBT, buttonColor:AppColor.errorColor , otherButtonTitle:  ConstantTexts.OkBT, otherButtonColor: AppColor.passGreenColor) { (isOtherButton) -> Void in
                   if isOtherButton == true {
                      DispatchQueue.main.async {
                           self.tblDocuments.reloadData()
                       }
                   }
                   else
                   {
                       self.docDataList?.documentDataItems.remove(at: index)
                       DispatchQueue.main.async {
                           self.tblDocuments.reloadData()
                       }
                       
                   }
                   
               }
    }
    
    
    
    //TODO: Methods for picker (Image picker and document picker)
    public func openActionSheet() {
        
        let alert = UIAlertController(title: APP_NAME, message: ConstantTexts.SelectYourOptionLT, preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: ConstantTexts.CameraLT, style: UIAlertAction.Style.default)
        {
            UIAlertAction in
            super.openCamera()
        }
        let gallaryAction = UIAlertAction(title: ConstantTexts.GalleryLT, style: UIAlertAction.Style.default)
        {
            UIAlertAction in
            super.openGallery()
        }
        
        
        let document = UIAlertAction(title: ConstantTexts.DocumetsLT, style: UIAlertAction.Style.default)
        {
            UIAlertAction in
            super.openDocuments()
        }
        
        let cancelAction = UIAlertAction(title: ConstantTexts.CancelBT, style: UIAlertAction.Style.cancel)
        {
            UIAlertAction in
        }
        
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(document)
        alert.addAction(cancelAction)
        super.present(alert, animated: true, completion: nil)
        
        super.getDocCallBack = { item in
            if let count = self.docDataList?.numberOfRowsInSection(0){
                if count > 0 {
                    self.docDataList?.documentDataItems.removeAll()
                }
                
            }
            self.docDataList?.documentDataItems.append(item)
            
            DispatchQueue.main.async {
                self.tblDocuments.reloadData()
            }
            
        }
        
    }
    
    //MARK: - Web services
    //TODO: check-bookingslot Service
    internal func hitCheckBookingSlotService(){
        guard let user = self.customMethodManager?.getUser(entity: "User_Data") else{
            print("No user found...")
            return
        }
        
        
        
        let parameters = [Api_keys_model.Date:self.date,
                          Api_keys_model.SelectedSlot:self.selectedSlot,
                          Api_keys_model.Description:self.descriptionTxtView] as [String:AnyObject]
        
        let header = ["authorization":user.token,
                      "Content-Type": "application/json",
                      "accept": "application/json"]
        
        self.customMethodManager?.startLoader(view:self.view)
        
        ServiceClass.shared.multipartImageServiceWithArrayObject(url: SCustomerApi.check_bookingslot, self.docDataArray, header: header, parameters: parameters, success: { (result) in
            self.customMethodManager?.stopLoader(view:self.view)
            print(result)
            if let result_Dict = result as? NSDictionary{
                if let code = result_Dict.value(forKey: "code") as? Int{
                    if code == 200{
                        if let dataDict = result_Dict.value(forKey: "data") as? NSDictionary{
                            
                            if let count = self.docDataList?.numberOfRowsInSection(0){
                                if count > 0 {
                                    self.docDataList?.documentDataItems[0].fileName = self.docDataModeling?.getUrl(data: dataDict) ?? String()
                                    DispatchQueue.main.async {
                                        self.tblDocuments.reloadData()
                                        
                                        if let message = result_Dict.value(forKey: "message") as? String{
                                            _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: message, style: .success, buttonTitle: ConstantTexts.OkBT, action: { (status) in
                                                if status{
                                                    let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: PaymentVC.className) as! PaymentVC
                                                    self.navigationController?.pushViewController(vc, animated: true)                                                }
                                            })
                                        }

                                        
                                        
                                    }
                                }
                            }
                            
                        }
                    }else if code == 401{
                        
                        if let count = self.docDataList?.numberOfRowsInSection(0){
                            if count > 0 {
                                self.docDataList?.documentDataItems.removeAll()
                            }
                            
                        }
                        DispatchQueue.main.async {
                            self.tblDocuments.reloadData()
                        }
                        
                        if let message = result_Dict.value(forKey: "message") as? String{
                            _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: message, style: .error, buttonTitle: ConstantTexts.OkBT, action: { (status) in
                                if status{
                                    self.customMethodManager?.deleteAllData(entity: "User_Data", success: {
                                        super.moveToNextViewCViaRoot(name: ConstantTexts.AuthSBT, withIdentifier: LoginVC.className)
                                    })
                                }
                            })
                        }
                    }
                }
            }
            
        }) { (error) in
            print(error)
            self.customMethodManager?.stopLoader(view:self.view)
            
            if let count = self.docDataList?.numberOfRowsInSection(0){
                if count > 0 {
                    self.docDataList?.documentDataItems.removeAll()
                }
                
            }
            DispatchQueue.main.async {
                self.tblDocuments.reloadData()
            }
            
            if let errorString = (error as NSError).userInfo[ConstantTexts.errorMessage_Key] as? String{
                _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: errorString, style:.error)
            }else{
                _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: ConstantTexts.errorMessage, style:.error)
            }
            
        }
    }
    
    
}
