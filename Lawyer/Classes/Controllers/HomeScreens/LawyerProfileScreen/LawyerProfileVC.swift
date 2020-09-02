//
//  LawyerProfileVC.swift
//  Lawyer
//
//  Created by Aman Kumar on 01/09/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit

class LawyerProfileVC: SBaseViewController {

    //MARK: - IBOutlets
   
    
    @IBOutlet weak var profileImageViewPlaceholder: UIView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var buttonMeetRef: UIButton!
    @IBOutlet weak var buttonCallRef: UIButton!
    @IBOutlet weak var profileTable: UITableView!

    
    //MARK: - Variables
    internal var Uuid:String = String()
    internal var Id:String = String()
    internal var name_Lawyer:String = String()
    internal var imageURL:String = String()
    
    internal var customMethodManager:CustomMethodProtocol?
    internal var lawyerProfileVM:ProfileDataModelModeling?
    internal var lawyerDetailsVM:ProfileDataViewModelList?
    
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = AppColor.themeColor
        
        return refreshControl
    }()
    
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

        
    }
    
    
    //TODO: Selectors
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        lawyerDetailService()
        refreshControl.endRefreshing()
        
    }
    
   

}
