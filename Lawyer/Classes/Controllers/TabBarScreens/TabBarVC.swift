//
//  TabBarVC.swift
//  Lawyer
//
//  Created by Aman Kumar on 20/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit
class TabBarVC: UITabBarController {
    
    //MARK: - Variables
    
    private let images = [#imageLiteral(resourceName: "Home") ,#imageLiteral(resourceName: "Blogs")  ,#imageLiteral(resourceName: "FlatFee")  , #imageLiteral(resourceName: "Coupons"),  #imageLiteral(resourceName: "Menu")]
    private let titles = [ConstantTexts.HomeLT ,ConstantTexts.BlogsLT,ConstantTexts.FlatFeesLT, ConstantTexts.CouponsLT, ConstantTexts.MoreLT]
    
    //MARK: - View life cycle methods
    //TODO: Implementation viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    
    //TODO: Implementation viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.extendedLayoutIncludesOpaqueBars = false
    }
    
}

//MARK: - Extension custom methods
extension TabBarVC{
    //TODO: Implementation setUpView
    private func setUpView() {
        
        self.tabBar.barTintColor =  AppColor.themeColor
        self.tabBar.isTranslucent = true
        
        self.selectedIndex = 0
        self.delegate = self
        
        self.tabBar.unselectedItemTintColor = AppColor.tabUnselectTintColor
        
        if let tabBarItems = tabBar.items{
            for index in 0..<tabBarItems.count {
                
                tabBarItems[index].setTitleTextAttributes([NSAttributedString.Key.foregroundColor: AppColor.whiteColor], for: .selected)
                tabBarItems[index].imageInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
                
                let image = images[index].withRenderingMode(.alwaysOriginal).withTintColor(AppColor.whiteColor)
                
                tabBarItems[index].selectedImage = image
                tabBarItems[index].image = images[index]
                tabBarItems[index].title = titles[index]
            }
        }
    }
}


//MARK: - Tab Bar Delegate Method
extension TabBarVC: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool{
        return true
    }
    
    /*  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController){
     } */
}


//MARK: - Tab bar show hide
extension TabBarVC {
    
}
