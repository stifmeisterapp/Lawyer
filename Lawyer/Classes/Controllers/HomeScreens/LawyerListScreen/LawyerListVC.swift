//
//  LawyerListVC.swift
//  Lawyer
//
//  Created by Aman Kumar on 21/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit
import ViewAnimator

class LawyerListVC: SBaseViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var lawyerTableView: UITableView!
    @IBOutlet weak var viewFilterBG: UIView!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var btnSearchRef: UIButton!
    @IBOutlet weak var btnFilterRef: UIButton!
    @IBOutlet weak var filterCollectionView: UICollectionView!
    
    
    //MARK: - Variables
    internal var headerTitle:String = String()
    internal var customMethodManager:CustomMethodProtocol?
    internal var filterCategoryListDataVM:FilterCategory_List_ViewModel?
    internal var filterCategoryListVM: FilterCategoryListModeling?
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = AppColor.themeColor
        
        return refreshControl
    }()
    
    //MARK: - Variables for animation
    // Combined animations example
    internal let fromAnimation = AnimationType.from(direction: .right, offset: 30.0)
    internal let zoomAnimation = AnimationType.zoom(scale: 0.2)
    internal let rotateAnimation = AnimationType.rotate(angle: CGFloat.pi/6)
    
    
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
    
    //TODO: Implementation viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateView()
        //runRotateAnimation()
    }
    
    
    //TODO: Implementation viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dismissKeyboard()
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
        self.txtSearch.text = ConstantTexts.empty
        dismissKeyboard()
        refreshControl.endRefreshing()
    }
    
    @objc func btnSelectedCell(_ sender: UIButton) {
        print("Button selected...")
        let indexPath = IndexPath(item: sender.tag, section: 0)
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                        if let cell = self.filterCollectionView.cellForItem(at: indexPath) as? FilterCollectionViewCell {
                            cell.transform = .init(scaleX: 0.95, y: 0.95)
                            cell.contentView.backgroundColor = AppColor.highLightColor
                        }
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            if let cell = self.filterCollectionView.cellForItem(at: indexPath) as? FilterCollectionViewCell {
                                cell.transform = .identity
                                cell.contentView.backgroundColor = .clear
                                
                                let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: FilterPopup_VC.className) as! FilterPopup_VC
                                
                                if let headerTitle = self.filterCategoryListDataVM?.filterCategories[sender.tag].title{
                                    vc.headerTitle = headerTitle
                                }
                                vc.index = sender.tag
                                vc.modalPresentationStyle = .automatic //or .overFullScreen for transparency
                                self.present(vc, animated: true, completion: nil)
                                
                            }
                        }
        })
    }
    
    
    
    @objc func btnMeetTapped(_ sender: UIButton) {
        print("Button selected...")
        let indexPath = IndexPath(item: sender.tag, section: 0)
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                        if let cell = self.lawyerTableView.cellForRow(at: indexPath) as? LawyerNewTableViewCell {
                            cell.buttonMeetRef.transform = .init(scaleX: 0.95, y: 0.95)
                            
                        }
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            if let cell = self.lawyerTableView.cellForRow(at: indexPath) as? LawyerNewTableViewCell {
                                cell.buttonMeetRef.transform = .identity
                                
                                let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: AppointmentVC.className) as! AppointmentVC
                                
                                self.navigationController?.pushViewController(vc, animated: true)
                                
                            }
                        }
        })
    }
    
    
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
}
