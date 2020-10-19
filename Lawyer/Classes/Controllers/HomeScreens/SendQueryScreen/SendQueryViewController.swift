//
//  SendQueryViewController.swift
//  Lawyer
//
//  Created by Aman Kumar on 14/10/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit

class SendQueryViewController: SBaseViewController {

    
    //MARK: - IBOutlets
    @IBOutlet weak var btnSubmitRef: UIButton!
    @IBOutlet weak var tblDocuments: UITableView!
    
    //MARK: - Variables
    internal let header: QueryHeaderView  = Bundle.main.loadNibNamed(QueryHeaderView.className, owner: self, options: nil)?.first as! QueryHeaderView
   
    internal var customMethodManager:CustomMethodProtocol?
    internal var descriptionTxtView: String = String()
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    //MARK: - Actions, Gestures, Selectors
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
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
                            self.validateFields { (strMsg, status) in
                                if status{
                                    print("hit api")
                                    self.hitSendQueryService()
                                }else{
                                    self.customMethodManager?.showToolTip(msg: strMsg, anchorView: self.header.txtView, sourceView: self.view)
                                    self.header.txtView.becomeFirstResponder()
                                }
                            }
                           // self.get_packages_Service()
                            /*  if let count = self.docDataList?.numberOfRowsInSection(0){
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
                             } */
                        }
                       })
        
    }

}
