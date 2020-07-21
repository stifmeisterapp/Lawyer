//
//  LawyerListVC.swift
//  Lawyer
//
//  Created by Aman Kumar on 21/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit

class LawyerListVC: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var viewBtnStackBG: UIView!
    @IBOutlet weak var buttonListRef: UIButton!
    @IBOutlet weak var buttonMapRef: UIButton!
    @IBOutlet weak var lawyerTableView: UITableView!
    
    @IBOutlet weak var viewList: UIView!
    @IBOutlet weak var imageList: UIImageView!
    @IBOutlet weak var labelList: UILabel!
    
    @IBOutlet weak var viewMap: UIView!
    @IBOutlet weak var imageMap: UIImageView!
    @IBOutlet weak var labelMap: UILabel!
    
    
    //MARK: - Variables
    internal var headerTitle:String = String()
    internal var customMethodManager:CustomMethodProtocol?
    
    
 /*  //MARK: - variables for the animate tableview
   
   internal var animationName = String()
    
    /// an enum of type TableAnimation - determines the animation to be applied to the tableViewCells
   internal var currentTableAnimation: TableAnimation = .fadeIn(duration: 0.85, delay: 0.03) {
        didSet {
            self.animationName = currentTableAnimation.getTitle()
        }
    }
   internal var animationDuration: TimeInterval = 0.85
   internal var delay: TimeInterval = 0.05  */
    
    
    
    //MARK: - View life cycle methods
    //TODO: Implementation viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            initialSetup()
    }
    
    //TODO: Implementation viewDidLoad
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
    
    
    //MARK: - Actions, Gestures, Selecters
    //TODO: Actions
    
    @IBAction func btnListTapped(_ sender: UIButton) {
        
        self.viewList.backgroundColor = UIColor(named: "GreenColor") ?? .clear
        self.imageList.setImageTintColor(UIColor(named: "WhiteShadow") ?? .clear)
        self.labelList.textColor = UIColor(named: "WhiteShadow") ?? .clear
        
        self.viewMap.backgroundColor = UIColor(named: "WhiteShadow") ?? .clear
        self.imageMap.setImageTintColor(UIColor(named: "LaunchColor") ?? .clear)
        self.labelMap.textColor = UIColor(named: "BlackColor") ?? .clear
 
    }
    
    @IBAction func btnMapTapped(_ sender: UIButton) {
           
           self.viewList.backgroundColor = UIColor(named: "WhiteShadow") ?? .clear
           self.imageList.setImageTintColor(UIColor(named: "LaunchColor") ?? .clear)
           self.labelList.textColor = UIColor(named: "BlackColor") ?? .clear
           
           self.viewMap.backgroundColor = UIColor(named: "GreenColor") ?? .clear
           self.imageMap.setImageTintColor(UIColor(named: "WhiteShadow") ?? .clear)
           self.labelMap.textColor = UIColor(named: "WhiteShadow") ?? .clear
    
       }
    
    

}
