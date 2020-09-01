//
//  HomeVC.swift
//  Lawyer
//
//  Created by Aman Kumar on 21/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit
import DropDown
import ViewAnimator
import FullMaterialLoader
class HomeVC: SBaseViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var viewLocationBackground: UIView!
    @IBOutlet weak var imageViewLoction: UIImageView!
    @IBOutlet weak var labelLoationTitle: UILabel!
    @IBOutlet weak var imageViewDropDown: UIImageView!
    
    
     
    /*
     For Collection view
     @IBOutlet weak var categoryCollectionView: UICollectionView! */
    
    // For Tableview
    @IBOutlet weak var categoryTableView: UITableView!
    
    //MARK: - Variables
    internal var indicator: MaterialLoadingIndicator!
    internal var categoryListVM:CategoryListViewModel?
    internal var homeVM: CategoryListModeling?
    internal var customMethodManager:CustomMethodProtocol?
    internal let dropDown = DropDown()
    
    internal var cityNameArray = [String]()
    internal var cityIdArray = [String]()
    internal var cityId:String = String()
    internal var cityName:String = String()
    
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = AppColor.themeColor
        
        return refreshControl
    }()
    
    // For Collection view
    internal let animations = [AnimationType.from(direction: .bottom, offset: 30.0)]
    
    
    
  /*   //MARK: - variables for the animate tableview
     
     internal var animationName = String()
     
     /// an enum of type TableAnimation - determines the animation to be applied to the tableViewCells
     internal var currentTableAnimation: TableAnimation = .fadeIn(duration: 0.85, delay: 0.03) {
     didSet {
     self.animationName = currentTableAnimation.getTitle()
     }
     }
     internal var animationDuration: TimeInterval = 0.85
     internal var delay: TimeInterval = 0.05 */
    
    
    
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
        animateView()
    }
    
    
    
    //MARK: - Actions, Gestures, Selectors
    
    
    //TODO: Selectors
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.filter_Service()
        refreshControl.endRefreshing()
       
    }
    
    
    //TODO: Actions
    
    @IBAction func btnCountryTapped(_ sender: UIButton) {
        self.customMethodManager?.openDownOnView(dropDown: self.dropDown, array: cityNameArray, anchor: self.viewLocationBackground, callBack: { (dropDown) in
            
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                print("Selected item: \(item) at index: \(index)")
                
                if item == ConstantTexts.SelectCityLT{
                    self.cityName = String()
                    self.cityId = String()
                    self.labelLoationTitle.text = ConstantTexts.SelectCityLT
                }else{
                    self.cityName = item
                    self.cityId = self.cityIdArray[index]
                    self.labelLoationTitle.text = "\(ConstantTexts.YouAreInLT) \(item)"
                }
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
