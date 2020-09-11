//
//  UploadDocumentVC.swift
//  Lawyer
//
//  Created by Aman Kumar on 03/09/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit

class UploadDocumentVC: SBaseViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var btnSubmitRef: UIButton!
    @IBOutlet weak var tblDocuments: UITableView!
    
    
    //MARK: - Variables
    internal let header: UploadDocHeader  = Bundle.main.loadNibNamed(UploadDocHeader.className, owner: self, options: nil)?.first as! UploadDocHeader
    
    internal let footer: UploadFooterView  = Bundle.main.loadNibNamed(UploadFooterView.className, owner: self, options: nil)?.last as! UploadFooterView
    
    
    internal var lawyer:Lawyer_Model = Lawyer_Model(CityName: String(), ConsulationType_Call_Fee: String(), ConsulationType_Meet_Fee: String(), ConsulationType_Video_Call_Fee: String(), Experience_Name: String(), Expertise_String: String(), FullName: String(), Id: String(), Language_String: String(), ProfilePhoto: String(), Uuid: String())
    internal var customMethodManager:CustomMethodProtocol?
    internal var Uuid:String = String()
    internal var descriptionTxtView: String = String()
    
    internal var selectedSlot:String = String()
    internal var date:String = String()
    
    internal var price:String = String()
    internal var type:String = String()
    internal var expID:String = String()
    internal var expName:String = String()
    
    
    internal var docDataModeling:DocumentDataModeling?
    internal var docDataList:DocumentViewModelList?
    internal var validationMethodManager:ValidationProtocol?
    
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
    
    //TODO: Implementation viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        initialSetup()
    }
    
    //MARK: - Actions, Gestures, Selectors
    
    //TODO: Actions
    
    @IBAction func btnSubmitTapped(_ sender: UIButton) {
        self.dismissKeyboard()
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.customMethodManager?.provideShadowAndCornerRadius(self.btnSubmitRef, 2, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.textColor, 0, 0, 0, 0, 0, AppColor.clearColor)
                        self.btnSubmitRef.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.btnSubmitRef.transform = .identity
                            self.customMethodManager?.provideShadowAndCornerRadius(self.btnSubmitRef, 2, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.textColor, -1, 1, 1, 3, 0, AppColor.clearColor)
                            if let count = self.docDataList?.numberOfRowsInSection(0){
                                if count > 0 {
                                    self.hitCheckBookingSlotService()
                                }else{
                                    let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: PaymentVC.className) as! PaymentVC
                                    vc.Uuid = self.Uuid
                                    vc.date = self.date
                                    vc.selectedSlot = self.selectedSlot
                                    vc.price = self.price
                                    vc.type = self.type
                                    vc.expID = self.expID
                                    vc.expName = self.expName
                                    vc.desc = self.descriptionTxtView
                                    vc.Docs = String()
                                    vc.lawyer = self.lawyer
                                    self.navigationController?.pushViewController(vc, animated: true)
                                }
                            }
                        }
        })
        
    }
    
    
    //MARK: - Actions, Gestures, Selectors
    //TODO: Selectors
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @objc func btnChooseTapped(_ sender: UIButton) {
        
        if let count = self.docDataList?.numberOfRowsInSection(0){
            if count == 0 {
                self.openActionSheet()
            }else{
                _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: ConstantTexts.chooseOneALERT, style: .error)
            }
            
        }
        
    }
    
    @objc func btnDeleteTapped(_ sender: UIButton) {
        self.deleteRow(index:sender.tag)
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
