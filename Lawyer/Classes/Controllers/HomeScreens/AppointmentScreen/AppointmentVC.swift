//
//  AppointmentVC.swift
//  Lawyer
//
//  Created by Aman Kumar on 07/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit
import ViewAnimator

class AppointmentVC: SBaseViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var btnBackRef: UIButton!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var btnForwardRef: UIButton!
    @IBOutlet weak var tblAppointment: UITableView!
    
    //MARK: - Variables
    internal var customMethodManager:CustomMethodProtocol?
    
    internal let footer: AppointmentFooterView  = Bundle.main.loadNibNamed(AppointmentFooterView.className, owner: self, options: nil)?.last as! AppointmentFooterView
    
    
    internal var count_Tapped = 0
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = AppColor.themeColor
        
        return refreshControl
    }()
    
    
    //MARK: - Temp static variables (Needs to be removed)
    internal var data = [AppointmentViewModel]()
    
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
    //TODO: Actions
    
    @IBAction func btnPrevTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                        
                        self.btnBackRef.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            
                            self.btnBackRef.transform = CGAffineTransform.identity
                            if self.count_Tapped <= 1{
                                self.btnBackRef.isHidden = true
                                self.count_Tapped = 0
                            }else{
                                self.count_Tapped -= 1
                                self.btnBackRef.isHidden = false
                                self.btnForwardRef.isHidden = false
                            }
                        }
        })
        
    }
    
    
    @IBAction func btnNextTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                        
                        self.btnForwardRef.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            
                            self.btnForwardRef.transform = CGAffineTransform.identity
                            
                            if self.count_Tapped >= 14{
                                self.btnForwardRef.isHidden = true
                                self.count_Tapped = 15
                            }else{
                                self.count_Tapped += 1
                                self.btnForwardRef.isHidden = false
                                self.btnBackRef.isHidden = false
                            }
                            
                        }
        })
        
  
    }
    
    //TODO: Selectors
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        refreshControl.endRefreshing()
    }
    
    
    
    @objc func btnBookConsultationTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.customMethodManager?.provideShadowAndCornerRadius(self.footer.btnBookConsultaionRef, 2, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.textColor, 0, 0, 0, 0, 0, AppColor.clearColor)
                        self.footer.btnBookConsultaionRef.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.customMethodManager?.provideShadowAndCornerRadius(self.footer.btnBookConsultaionRef, 2, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.textColor, -1, 1, 1, 3, 0, AppColor.clearColor)
                            self.footer.btnBookConsultaionRef.transform = CGAffineTransform.identity
                            //TODO: Temp code need to remove
                            
                            let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: PaymentVC.className) as! PaymentVC
                            
                            self.navigationController?.pushViewController(vc, animated: true)
                            
                        }
        })
        
    }
    
    

}
