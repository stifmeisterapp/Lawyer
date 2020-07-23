//
//  SignUpVC.swift
//  Lawyer
//
//  Created by Aman Kumar on 23/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit

class SignUpVC: SBaseViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var btnRegisterRef: UIButton!
    @IBOutlet weak var btnLoginRef: UIButton!
    
    @IBOutlet weak var txtFullName: UITextField!{
        didSet {
            txtFullName.tintColor = UIColor.lightGray
            txtFullName.setIcon(UIImage(systemName: "person.fill") ?? UIImage())
        }
    }
    
    
    @IBOutlet weak var txtPhoneNumber: UITextField!{
        didSet {
            txtPhoneNumber.tintColor = UIColor.lightGray
            txtPhoneNumber.setIcon(UIImage(systemName: "phone.fill") ?? UIImage())
        }
    }
    
    @IBOutlet weak var txtEmail: UITextField!{
        didSet {
            txtEmail.tintColor = UIColor.lightGray
            txtEmail.setIcon(UIImage(systemName: "envelope.fill") ?? UIImage())
        }
    }
    
    
    
    
    //MARK: - Variables
    internal var customMethodManager:CustomMethodProtocol?
    internal var validationMethodManager:ValidationProtocol?
    public var tag = Int()
    
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
    
    
    //TODO: Selectors
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    @IBAction func btnLoginTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func btnSendOTPTapped(_ sender: UIButton) {
        isValidate()
    }
    
    
    
}
