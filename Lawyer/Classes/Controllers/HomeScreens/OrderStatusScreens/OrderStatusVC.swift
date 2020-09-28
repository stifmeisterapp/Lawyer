//
//  OrderStatusVC.swift
//  Lawyer
//
//  Created by Aman Kumar on 27/09/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit
import MessageUI
class OrderStatusVC:  SBaseViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var viewHeaderBG: UIView!
    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblImage: UIImageView!
    @IBOutlet weak var tblOrderStatus: UITableView!
    
    @IBOutlet weak var btnCallRef: UIButton!
    @IBOutlet weak var btnMsgRef: UIButton!
    
    @IBOutlet weak var lblSuccess: UILabel!
    @IBOutlet weak var imgSuccess: UIImageView!
    
    //MARK: - Variables
    internal var order:OrderDataViewModel = OrderDataViewModel(OrderDataModel(BookingDate: String(), BookingTime: String(), CategoryName: String(), CustomerEmail: String(), CustomerName: String(), CustomerPhone: String(), Id: String(), Query: String(), Status: String()))
    
    //MARK: - Variables
    internal var customMethodManager:CustomMethodProtocol?
    internal var orderModel:OrderStatusDataListViewModel?
    internal var orderVM:OrderStatusDataModeling?
    internal var SupportPhoneNumber:String = String()
    internal var SupportEmail:String = String()
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
        //  initialSetup()
    }
    
    
    
    //MARK: - Actions, Gestures, Selectors
    //TODO: Selectors
    
    @objc func btnExpendHeader(_ sender: UIButton) {
        
        if let orders = orderModel?.order{
            for index in 0..<orders.count{
                if index == sender.tag{
                    orders[index].isExpended = !orders[index].isExpended
                }else{
                    orders[index].isExpended = Bool()
                }
            }
        }
        
        DispatchQueue.main.async {
            self.tblOrderStatus.reloadData()
        }
    }
    
    
    //TODO: Actions
    
    @IBAction func btnMsgTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                        
                        self.btnMsgRef.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            
                            self.btnMsgRef.transform = CGAffineTransform.identity
                            
                            if self.order.Status == "3"{
                                self.navigationController?.popViewController(animated: true)
                           }else{
                            // Modify following variables with your text / recipient
                            let recipientEmail = self.SupportEmail
                            let subject = "Multi client email support"
                            let body = "This code supports sending email via multiple different email apps on iOS! :)"
                            
                            // Show default mail composer
                            if MFMailComposeViewController.canSendMail() {
                                let mail = MFMailComposeViewController()
                                mail.mailComposeDelegate = self
                                mail.setToRecipients([recipientEmail])
                                mail.setSubject(subject)
                                mail.setMessageBody(body, isHTML: false)
                                
                                self.present(mail, animated: true)
                                
                                // Show third party email composer if default Mail app is not present
                            } else if let emailUrl = self.createEmailUrl(to: recipientEmail, subject: subject, body: body) {
                                UIApplication.shared.open(emailUrl)
                            }
                           }
                          
                        }
                       })
        
    }
    
    @IBAction func btnCallTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                        
                        self.btnCallRef.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            
                            self.btnCallRef.transform = CGAffineTransform.identity
                            self.customMethodManager?.callNumber(phoneNumber: "\(self.SupportPhoneNumber)")
                        }
                       })
        
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
