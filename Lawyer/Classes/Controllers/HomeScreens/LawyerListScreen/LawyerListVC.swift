//
//  LawyerListVC.swift
//  Lawyer
//
//  Created by Aman Kumar on 21/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit

class LawyerListVC: SBaseViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var lawyerTableView: UITableView!
   
    //MARK: - Variables
    internal var headerTitle:String = String()
    internal var customMethodManager:CustomMethodProtocol?
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = AppColor.themeColor
        
        return refreshControl
    }()
    
    
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
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
     
        refreshControl.endRefreshing()
    }
    
    
}
