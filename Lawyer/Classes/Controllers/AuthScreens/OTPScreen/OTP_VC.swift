//
//  OTP_VC.swift
//  Lawyer
//
//  Created by Aman Kumar on 23/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit

class OTP_VC: SBaseViewController {
    //MARK: - IBOutlets
   
    @IBOutlet weak var lblInstruction: UILabel!
    @IBOutlet weak var btnDoneOTPRef: UIButton!
    @IBOutlet weak var btnResendOTPRef: UIButton!
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var txtOTP_Number: UITextField!{
           didSet {
               txtOTP_Number.tintColor = UIColor.lightGray
               txtOTP_Number.setIcon(UIImage(systemName: "pencil.and.ellipsis.rectangle") ?? UIImage())
           }
       }
    
    
    //MARK: - Variables
    internal var customMethodManager:CustomMethodProtocol?
    internal var validationMethodManager:ValidationProtocol?

    internal var timer: Timer?
    internal var time: Int = 30
    internal var phoneNumber: String = String()
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
    
    //TODO: Implementation viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopTimer()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
     
     
     /*  */
            
            
    }
    */
    
    
    //MARK: - Actions, Gestures, Selectors
    //TODO: Actions

    @IBAction func btnDoneTapped(_ sender: UIButton) {
        isValidate()
    }
    
    @IBAction func btnResendTapped(_ sender: UIButton) {
        startTimer()
    }
    
    
    //TODO: Selectors
    @objc func runTimedCode(){
        if time > 0{
            time -= 1
            lblTimer.text = (time > 9) ? "\(ConstantTexts.ResendInLT) 00:\(time)" : "\(ConstantTexts.ResendInLT) 00:0\(time)"
        }else{
            stopTimer()
        }
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
