//
//  SBaseViewController+MethodExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 23/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Extension setup navigation
extension SBaseViewController{
    
    //TODO: Main method for setup UIBarButtonItems and title
    internal func setupNavigationBarTitle(_ title: String, leftBarButtonsType: [UINavigationBarButtonType], rightBarButtonsType: [UINavigationBarButtonType]) {
        
        self.navigationItem.title = title
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = AppColor.themeColor
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: AppColor.whiteColor]
        
        var rightBarButtonItems = [UIBarButtonItem]()
        for rightButtonType in rightBarButtonsType {
            let rightButtonItem = getBarButtonItem(for: rightButtonType, isLeftBarButtonItem: false)
            rightBarButtonItems.append(rightButtonItem)
        }
        
        if rightBarButtonItems.count > 0 {
            self.navigationItem.rightBarButtonItems = rightBarButtonItems
        }
        
        var leftBarButtonItems = [UIBarButtonItem]()
        for leftButtonType in leftBarButtonsType {
            let leftButtonItem = getBarButtonItem(for: leftButtonType, isLeftBarButtonItem: true)
            leftBarButtonItems.append(leftButtonItem)
        }
        
        if leftBarButtonItems.count > 0 {
            self.navigationItem.leftBarButtonItems = leftBarButtonItems
        }
    }
    
    
    //TODO: Method for setup UIBarButtonItems
    internal func getBarButtonItem(for type: UINavigationBarButtonType, isLeftBarButtonItem: Bool) -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: Int(NAVIGATION_BAR_BUTTON_DEFAULT_WIDTH), height: NAVIGATION_BAR_DEFAULT_HEIGHT))
        button.setTitleColor(.black, for: UIControl.State())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.titleLabel?.textAlignment = .right
        button.tag = type.rawValue
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: isLeftBarButtonItem ? -EDGE_INSET : EDGE_INSET, bottom: 0, right: isLeftBarButtonItem ? EDGE_INSET : -EDGE_INSET)
        if let iconImage = type.iconImage {
            button.setImage(iconImage, for: UIControl.State())
        }/* else if let title = type.title {
         button.setTitle(title, for: UIControlState())
         button.frame.size.width = 40.0
         } */
        button.addTarget(self, action: #selector(SBaseViewController.navigationButtonTapped(_:)), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
    
}



//MARK: - Extension navigation methods actions
extension SBaseViewController{
    internal func navigationBarButtonDidTapped(_ buttonType: UINavigationBarButtonType) {
        backButtonTapped()
    }
    
    //TODO: Back action method
    internal func backButtonTapped() {
        if self.navigationController!.viewControllers.count > 1 {
            self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    //TODO: Go back to index main method, go particular index back
    internal  func goBackToIndex(_ backIndex: Int) {
        self.goBackToIndex(backIndex, animated: true)
    }
    
    //TODO: Go back to index sub method
    internal  func goBackToIndex(_ backIndex: Int, animated animate: Bool) {
        if (self.navigationController!.viewControllers.count - backIndex) > 0 {
            let controller: SBaseViewController = (self.navigationController!.viewControllers[(self.navigationController!.viewControllers.count - 1 - backIndex)] as! SBaseViewController)
            self.navigationController!.popToViewController(controller, animated: animate)
        }
    }
    
    //TODO: Push navigation to next view controller
    internal  func moveToNextViewC(name: String, withIdentifier: String) {
        let viewC = UIStoryboard(name: name, bundle: nil).instantiateViewController(withIdentifier: withIdentifier)
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    
    
    //TODO: Move to next via root view controller
    internal func moveToNextViewCViaRoot(name:String,withIdentifier:String){
        let mainStoryboard: UIStoryboard = UIStoryboard(name: name, bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: withIdentifier)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.isHidden = false
        self.view.window?.rootViewController = navigationController
    }
  
}
