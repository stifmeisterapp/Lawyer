//
//  HomeVC.swift
//  Lawyer
//
//  Created by Aman Kumar on 21/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit
import DropDown

class HomeVC: SBaseViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var viewLocationBackground: UIView!
    @IBOutlet weak var imageViewLoction: UIImageView!
    @IBOutlet weak var labelLoationTitle: UILabel!
    @IBOutlet weak var imageViewDropDown: UIImageView!
    @IBOutlet weak var categoryTableView: UITableView!
    
    //MARK: - Variables
    internal var categoryListVM:CategoryListViewModel?
    internal var homeVM: CategoryListModeling?
    internal var customMethodManager:CustomMethodProtocol?
    internal let dropDown = DropDown()
    //MARK: - variables for the animate tableview
   
   internal var animationName = String()
    
    /// an enum of type TableAnimation - determines the animation to be applied to the tableViewCells
   internal var currentTableAnimation: TableAnimation = .fadeIn(duration: 0.85, delay: 0.03) {
        didSet {
            self.animationName = currentTableAnimation.getTitle()
        }
    }
   internal var animationDuration: TimeInterval = 0.85
   internal var delay: TimeInterval = 0.05
    
    
    
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
    

    
    //MARK: - Actions, Gestures, Selectors
    //TODO: Actions
    
    @IBAction func btnCountryTapped(_ sender: UIButton) {
        self.customMethodManager?.openDownOnView(dropDown: self.dropDown, array: [ConstantTexts.SelectCityLT,"Gurugram","Amadalavalasa (Amudalavalasa)","Alipur","Akkarampalle","Anantapur","Ambicapur Pt VI","Abango","Along","Alinye"], anchor: self.viewLocationBackground, callBack: { (dropDown) in
            
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                print("Selected item: \(item) at index: \(index)")
                
                if item == ConstantTexts.SelectCityLT{
                    self.labelLoationTitle.text = "\(ConstantTexts.YouAreInLT) \("Delhi")"
                }else{
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
