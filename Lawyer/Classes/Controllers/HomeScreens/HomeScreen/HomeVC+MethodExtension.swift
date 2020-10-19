//
//  HomeVC+MethodExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 20/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit
import Foundation
import ViewAnimator
import CoreData
import Firebase


extension HomeVC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.tabBarController?.tabBar.isHidden = true
        super.setupNavigationBarTitle(AppColor.header_color,ConstantTexts.CategoriesHT, leftBarButtonsType: [.back], rightBarButtonsType: [.location])
        
    }
    
    //TODO: Init values
    internal func initValues(){
        if customMethodManager == nil {
            customMethodManager = CustomMethodClass.shared
        }
        
        if self.validationMethodManager == nil {
            self.validationMethodManager = ValidationClass.shared
        }
        
        initialSetup()
        
    }
    
    
    
    //TODO: Intial setup implementation
    private func initialSetup(){
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        
        self.searchBar.backgroundImage = UIImage()
        self.searchBar.backgroundColor = AppColor.whiteColor
        self.searchBar.placeholder = "\(ConstantTexts.Search_PH) \(ConstantTexts.Categories_LT)"
        self.searchBar.searchTextField.font = AppFont.Regular.size(AppFontName.OpenSans, size: 12)
        self.searchBar.searchTextField.backgroundColor = AppColor.whiteColor
        self.customMethodManager?.provideCornerBorderTo(self.searchBar, 1, AppColor.placeholderColor)
        
        
        
        self.view.backgroundColor = AppColor.whiteColor
        self.viewLocationBackground.backgroundColor = AppColor.whiteColor
        
        self.customMethodManager?.provideShadowAndCornerRadius(self.viewLocationBackground, 0, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.placeholderColor, 2, 2, 2, 2, 0, AppColor.tableBGColor)
        
        self.imageViewLoction.setImageTintColor(AppColor.darkGrayColor)
        
        self.labelLoationTitle.font = AppFont.Regular.size(AppFontName.OpenSans, size: 12)
        self.labelLoationTitle.textColor = AppColor.darkGrayColor
        self.labelLoationTitle.text = ConstantTexts.SelectCityLT
        
        
        self.imageViewDropDown.setImageTintColor(AppColor.darkGrayColor)
        
        // For Tableview
        self.categoryTableView.backgroundColor = AppColor.whiteColor
        self.categoryTableView.separatorStyle = .singleLine
        self.categoryTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.categoryTableView.hideEmptyCells()
        self.categoryTableView.isScrollEnabled = true
        self.categoryTableView.isHidden = true
        self.categoryTableView.addSubview(self.refreshControl)
        
        
        /* For Collection view
         self.categoryCollectionView.backgroundColor = AppColor.tableBGColor */
        
        super.goToCity = {
            let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: CityListViewController.className) as! CityListViewController
            
            vc.getCity = { item in
                print(item)
                self.cityName = item
            }
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
        self.viewLocationBackground.isHidden = true
        
        recheckDataModels()
        
    }
    
    
    
    //TODO: Recheck data models implenemtation
    private func recheckDataModels(){
        if  self.homeVM == nil{
            self.homeVM = HomeVM.shared
        }
        
        /*  if  self.categoryListVM == nil{
         self.categoryListVM = self.homeVM?.prepareDataSource()
         } */
        
        if self.expertiseVM == nil{
            self.expertiseVM = self.homeVM?.prepareDataEmpty()
        }
        registerNib()
        
    }
    
    //TODO: register nib file
    private func registerNib(){
        // For Tableview
        self.categoryTableView.register(nib: CategoryTableViewCellAndXib.className)
        /* For Tableview
         
         DispatchQueue.main.asyncAfter(deadline: .now()) {
         self.categoryTableView.isHidden = false
         
         self.currentTableAnimation =  TableAnimation.fadeIn(duration: self.animationDuration, delay: self.delay)
         
         /* self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 60,duration: self.animationDuration, delay: self.delay) */
         
         self.categoryTableView.reloadData()
         } */
        
        
        
        
        /* For Collection view
         self.categoryCollectionView.register(nib: CategoryCollectionViewCellAndXib.className) */
      
        if self.categoryListVM?.categories.count == 0{
            self.expertise_list()
        }else{
            self.animateView()
        }
        
        
        
    }
    
    //TODO: Animate rotate table view
    internal func animateView(){
        self.categoryTableView.isHidden = false
        DispatchQueue.main.async {
            self.categoryTableView.reloadData()
        }
        
        
        let fromAnimation = AnimationType.from(direction: .right, offset: 30.0)
        UIView.animate(views: categoryTableView.visibleCells,
                       animations: [fromAnimation], delay: 0.5)
        
        
       // self.filter_Service()
    }
    
    
    //TODO: without animate table view
    internal func reloadView(){
        self.categoryTableView.isHidden = false
        DispatchQueue.main.async {
            self.categoryTableView.reloadData()
        }
        
    
        //TODO: For filter service
        /*
        self.filter_Service()
 
        */
    }
    
    
    
    
    /* For Collection view
     //TODO: Animate simple collection view
     internal func runSimpleAnimation(){
     categoryCollectionView?.reloadData()
     categoryCollectionView?.performBatchUpdates({
     UIView.animate(views: self.categoryCollectionView!.orderedVisibleCells,
     animations: animations, completion: {
     print("Animation done...")
     })
     }, completion: nil)
     }
     
     
     //TODO: Animate rotate collection view
     internal func runRotateAnimation(){
     let zoomAnimation = AnimationType.zoom(scale: 0.2)
     let rotateAnimation = AnimationType.rotate(angle: CGFloat.pi/6)
     UIView.animate(views: self.categoryCollectionView.visibleCells,
     animations: [zoomAnimation, rotateAnimation],
     duration: 0.5)
     } */
    
    
    //TODO: Set static data in expertise in local db
    private func setExperise(){
        
        if let experitseList = expertiseVM?.categories{
            self.customMethodManager?.deleteAllDataFilters(entity: "Expertise")
            let context = kAppDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Expertise", in: context)
            for expertise in experitseList{
                let expertiseItem = Filter(entity: ConstantTexts.ExpertiseLT, title: expertise.title,id: expertise.ExpertiseId, isSelected: Bool())
                
                let expertise = NSManagedObject(entity: entity!, insertInto: context)
                expertise.setValue(expertiseItem.title, forKey: "expertise_name")
                expertise.setValue(expertiseItem.id, forKey: "expertise_id")
                expertise.setValue(expertiseItem.isSelected, forKey: "is_selected")
                do {
                    try context.save()
                } catch {
                    print("Failed saving: - \(error)")
                }
            }
        }
        
        
    }
    
    
    //TODO: Filter web service
    internal func filter_Service(){
        
        //        self.setExperise()
        
        self.customMethodManager?.startLoader(view:self.view)
        ServiceClass.shared.webServiceBasicMethod(url: SCustomerApi.filter_list, method: .get, parameters: nil, header: nil, success: { (result) in
            print(result)
            self.customMethodManager?.stopLoader(view:self.view)
            if let result_Dict = result as? NSDictionary{
                if let code = result_Dict.value(forKey: "code") as? Int{
                    if code == 200{
                        if let data = result_Dict.value(forKey: "data") as? NSDictionary{
                            
                            
                            //TODO: City data
                            if let City = data.value(forKey: "City") as? NSArray{
                                
                                if self.cityNameArray.count > 0{
                                    self.cityNameArray.removeAll()
                                }
                                
                                if self.cityIdArray.count > 0{
                                    self.cityIdArray.removeAll()
                                }
                                
                                self.customMethodManager?.deleteAllDataFilters(entity: "City")
                                
                                self.cityNameArray.append(ConstantTexts.SelectCityLT)
                                self.cityIdArray.append(ConstantTexts.empty)
                                
                                let context = kAppDelegate.persistentContainer.viewContext
                                let entity = NSEntityDescription.entity(forEntityName: "City", in: context)
                                
                                for city in City{
                                    if let cityDict = city as? NSDictionary{
                                        
                                        let cityItem = Filter(entity: ConstantTexts.CityLT, title: String(),id: String(), isSelected: Bool())
                                        
                                        if let CityName = cityDict.value(forKey: "CityName") as? String{
                                            self.cityNameArray.append(CityName)
                                            cityItem.title = CityName
                                        }
                                        
                                        if let CityId = cityDict.value(forKey: "CityId") as? String{
                                            self.cityIdArray.append(CityId)
                                            cityItem.id = CityId
                                        }
                                        
                                        if let CityId = cityDict.value(forKey: "CityId") as? Int{
                                            self.cityIdArray.append("\(CityId)")
                                            cityItem.id = "\(CityId)"
                                        }
                                        
                                        let city = NSManagedObject(entity: entity!, insertInto: context)
                                        city.setValue(cityItem.title, forKey: "city_name")
                                        city.setValue(cityItem.id, forKey: "city_id")
                                        city.setValue(cityItem.isSelected, forKey: "is_selected")
                                        do {
                                            try context.save()
                                        } catch {
                                            print("Failed saving: - \(error)")
                                        }
                                    }
                                }
                            }
                            
                            //TODO: Experience data
                            if let Experience = data.value(forKey: "Experience") as? NSArray{
                                self.customMethodManager?.deleteAllDataFilters(entity: "Experience")
                                
                                let context = kAppDelegate.persistentContainer.viewContext
                                let entity = NSEntityDescription.entity(forEntityName: "Experience", in: context)
                                
                                for experience in Experience{
                                    if let experienceDict = experience as? NSDictionary{
                                        
                                        let experienceItem = Filter(entity: ConstantTexts.ExperienceLT, title: String(),id: String(), isSelected: Bool())
                                        
                                        if let ExperienceName = experienceDict.value(forKey: "ExperienceName") as? String{
                                            experienceItem.title = ExperienceName
                                        }
                                        
                                        if let ExperienceId = experienceDict.value(forKey: "ExperienceId") as? String{
                                            experienceItem.id = ExperienceId
                                        }
                                        
                                        if let ExperienceId = experienceDict.value(forKey: "ExperienceId") as? Int{
                                            experienceItem.id = "\(ExperienceId)"
                                        }
                                        
                                        let experience = NSManagedObject(entity: entity!, insertInto: context)
                                        experience.setValue(experienceItem.title, forKey: "experience_name")
                                        experience.setValue(experienceItem.id, forKey: "experience_id")
                                        experience.setValue(experienceItem.isSelected, forKey: "is_selected")
                                        do {
                                            try context.save()
                                        } catch {
                                            print("Failed saving: - \(error)")
                                        }
                                    }
                                }
                            }
                            
                            //TODO: Expertise data
                            if let Expertise = data.value(forKey: "Expertise") as? NSArray{
                                self.customMethodManager?.deleteAllDataFilters(entity: "Expertise")
                                
                                let context = kAppDelegate.persistentContainer.viewContext
                                let entity = NSEntityDescription.entity(forEntityName: "Expertise", in: context)
                                
                                for expertise in Expertise{
                                    if let expertiseDict = expertise as? NSDictionary{
                                        
                                        let expertiseItem = Filter(entity: ConstantTexts.ExpertiseLT, title: String(),id: String(), isSelected: Bool())
                                        
                                        if let ExpertiseName = expertiseDict.value(forKey: "ExpertiseName") as? String{
                                            expertiseItem.title = ExpertiseName
                                        }
                                        
                                        if let ExpertiseId = expertiseDict.value(forKey: "ExpertiseId") as? String{
                                            expertiseItem.id = ExpertiseId
                                        }
                                        
                                        if let ExpertiseId = expertiseDict.value(forKey: "ExpertiseId") as? Int{
                                            expertiseItem.id = "\(ExpertiseId)"
                                        }
                                        
                                        let expertise = NSManagedObject(entity: entity!, insertInto: context)
                                        expertise.setValue(expertiseItem.title, forKey: "expertise_name")
                                        expertise.setValue(expertiseItem.id, forKey: "expertise_id")
                                        expertise.setValue(expertiseItem.isSelected, forKey: "is_selected")
                                        do {
                                            try context.save()
                                        } catch {
                                            print("Failed saving: - \(error)")
                                        }
                                    }
                                }
                            }
                            
                            
                            //TODO: Language data
                            if let Language = data.value(forKey: "Language") as? NSArray{
                                self.customMethodManager?.deleteAllDataFilters(entity: "Language")
                                
                                let context = kAppDelegate.persistentContainer.viewContext
                                let entity = NSEntityDescription.entity(forEntityName: "Language", in: context)
                                
                                for language in Language{
                                    if let languageDict = language as? NSDictionary{
                                        
                                        let languageItem = Filter(entity: ConstantTexts.LanguageLT, title: String(),id: String(), isSelected: Bool())
                                        
                                        if let LanguageName = languageDict.value(forKey: "LanguageName") as? String{
                                            languageItem.title = LanguageName
                                        }
                                        
                                        if let LanguageId = languageDict.value(forKey: "LanguageId") as? String{
                                            languageItem.id = LanguageId
                                        }
                                        
                                        if let LanguageId = languageDict.value(forKey: "LanguageId") as? Int{
                                            languageItem.id = "\(LanguageId)"
                                        }
                                        
                                        let language = NSManagedObject(entity: entity!, insertInto: context)
                                        language.setValue(languageItem.title, forKey: "language_name")
                                        language.setValue(languageItem.id, forKey: "language_id")
                                        language.setValue(languageItem.isSelected, forKey: "is_selected")
                                        do {
                                            try context.save()
                                        } catch {
                                            print("Failed saving: - \(error)")
                                        }
                                    }
                                }
                            }
                            
                            
                            
                        }
                    }else{
                        if let message = result_Dict.value(forKey: "message") as? String{
                            _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: message, style:.error)
                        }
                        
                    }
                }
            }
            
            
        }) { (error) in
            print(error)
            self.customMethodManager?.stopLoader(view:self.view)
            if let errorString = (error as NSError).userInfo[ConstantTexts.errorMessage_Key] as? String{
                _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: errorString, style:.error)
            }else{
                _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: ConstantTexts.errorMessage, style:.error)
            }
            
            
            
        }
        
        
    }
    
    
    
    
    //TODO: Filter web service
    internal func expertise_list(){
        self.customMethodManager?.startLoader(view:self.view)
        ServiceClass.shared.webServiceBasicMethod(url: SCustomerApi.expertise_list, method: .get, parameters: nil, header: nil, success: { (result) in
            print(result)
            self.customMethodManager?.stopLoader(view:self.view)
            if let result_Dict = result as? NSDictionary{
                if let code = result_Dict.value(forKey: "code") as? Int{
                    if code == 200{
                        if let data = result_Dict.value(forKey: "data") as? NSDictionary{
                            print(data)
                            if let ExpertiseId = data.value(forKey: "ExpertiseId") as? NSArray{
                                
                                if let Url = data.value(forKey: "Url") as? String{
                                    if  self.categoryListVM == nil{
                                        self.categoryListVM = self.homeVM?.prepareDataSourceWithJSON(data: ExpertiseId, baseUrl: Url)
                                        self.animateView()
                                        
                                    }else{
                                        self.categoryListVM = self.homeVM?.prepareDataSourceWithJSON(data: ExpertiseId, baseUrl: Url)
                                        self.animateView()
                                        
                                    }
                                }
                                
                                
                                
                            }
                            
                        }
                    }else{
                        if let message = result_Dict.value(forKey: "message") as? String{
                            _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: message, style:.error)
                        }
                        
                    }
                }
            }
            
            
        }) { (error) in
            print(error)
            self.customMethodManager?.stopLoader(view:self.view)
            if let errorString = (error as NSError).userInfo[ConstantTexts.errorMessage_Key] as? String{
                _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: errorString, style:.error)
            }else{
                _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: ConstantTexts.errorMessage, style:.error)
            }
            
            
            
        }
        
        
    }
    
    
    
    
    
    
    
    
}
