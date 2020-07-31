//
//  OnboardingVC.swift
//  Lawyer
//
//  Created by Aman Kumar on 21/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit
import paper_onboarding
class OnboardingVC: SBaseViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var onboardingView: OnboardingView!
    @IBOutlet weak var buttonProceedRef: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialSetup()
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
    @IBAction func btnProceedTapped(_ sender: UIButton) {
    
        let newViewController = AppStoryboard.authSB.instantiateViewController(withIdentifier: LoginVC.className) as! LoginVC
        let navigationController = UINavigationController(rootViewController: newViewController)
        self.view.window?.rootViewController = navigationController
 
    }
    

}