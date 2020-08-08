//
//  FilterPopup_VC.swift
//  Lawyer
//
//  Created by Aman Kumar on 06/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit

class FilterPopup_VC: SBaseViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var btnDismissRef: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var btnClearRef: UIButton!
    @IBOutlet weak var btnDoneRef: UIButton!
    @IBOutlet weak var filterTableView: UITableView!
    
    
    //MARK: - Variables
    internal var index:Int = Int()
    internal var headerTitle:String = String()
    internal var searchActive = Bool()
    
    internal var validationMethodManager:ValidationProtocol?
    internal var customMethodManager:CustomMethodProtocol?
    internal var filterListVM:FilterListModeling?
    internal var filterList:Filter_List_ViewModel?
    
    internal var search_filterListVM:FilterListModeling?
    internal var search_filterList:Filter_List_ViewModel?
    
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
    
    
    /*  //TODO: Implementation viewDidAppear
     override func viewDidAppear(_ animated: Bool) {
     super.viewDidAppear(animated)
     
     animateView()
     } */
    
    
    //TODO: Implementation viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dismissKeyboard()
    }
    
    
    //MARK: - Actions, Gestures, Selectors
    //TODO: Actions
    @IBAction func btnDismissTapped(_ sender: UIButton) {
        dismissKeyboard()
        self.dismiss(animated: true, completion: nil)
    }
    
    //TODO: Selectors
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    //TODO: Selectors
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.searchBar.text = ConstantTexts.empty
        dismissKeyboard()
        refreshControl.endRefreshing()
    }
    
    
    
    @objc func btnSelectedCell(_ sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        
        if self.searchActive{
            guard let item = self.search_filterList?.filterAtIndex(sender.tag) else {
                fatalError("No Filter found...")
            }
            item.filter.isSelected = !item.filter.isSelected
            if let cell = self.filterTableView.cellForRow(at: indexPath) as? FilterTableViewCellAndXib{
                cell.configure(with: item)
            }
        }else{
            guard let item = self.filterList?.filterAtIndex(sender.tag) else {
                fatalError("No Filter found...")
            }
            item.filter.isSelected = !item.filter.isSelected
            if let cell = self.filterTableView.cellForRow(at: indexPath) as? FilterTableViewCellAndXib{
                cell.configure(with: item)
            }
        }
        
        
    }
    
}
