//
//  HomeVC+TableViewExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 21/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
import ViewAnimator

//MARK: - UITableViewDataSource extension
extension HomeVC:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return (self.categoryListVM == nil) ? 0 : self.categoryListVM?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.categoryListVM?.numberOfRowsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LawyerTableViewCell.className, for: indexPath) as? LawyerTableViewCell else {
            fatalError(ConstantTexts.unexpectedIndexPath)
        }
        cell.configure(with: categoryListVM?.categoryAtIndex(indexPath.row) ?? CategoryViewModel(Category(image: UIImage(), Url: String(), title: String(), ExpertiseId: String())))
        return cell
    }
}




//MARK: - UITableViewDelegate extension
extension HomeVC:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                        if let cell = tableView.cellForRow(at: indexPath) as? LawyerTableViewCell {
                            cell.viewBG.transform = .init(scaleX: 0.95, y: 0.95)
                            cell.contentView.backgroundColor = AppColor.highLightColor
                        }
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.05) {
                            if let cell = tableView.cellForRow(at: indexPath) as? LawyerTableViewCell {
                                cell.viewBG.transform = .identity
                                cell.contentView.backgroundColor = .clear
                                UIView.animate(views: tableView.visibleCells,
                                               animations: self.animations, reversed: true,
                                               initialAlpha: 1.0,
                                               finalAlpha: 0.0,
                                               completion: {
                                                
                                                
                                                let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: AppointmentVC.className) as! AppointmentVC
                                                
                                                
                                                if let categoryVM = self.categoryListVM?.categoryAtIndex(indexPath.row){
                                                    vc.type = "0"
                                                    vc.expID = categoryVM.expertiseId
                                                    vc.expName = categoryVM.title
                                                }
                                                
                                                self.navigationController?.pushViewController(vc, animated: true)
                                                
                                                
                                                //TODO: When lawyer list applied
                                                
                                                /*  let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: LawyerListVC.className) as! LawyerListVC
                                                if let categoryVM = self.categoryListVM?.categoryAtIndex(indexPath.row){
                                                vc.headerTitle = categoryVM.title
                                                
                                                self.customMethodManager?.updateIsSelect(entity: ConstantTexts.ExpertiseLT, primary_key: self.customMethodManager?.getTableAndKeys(entity: ConstantTexts.ExpertiseLT) ?? String(), primary_value: categoryVM.expertiseId, key: "is_selected", value: true)
                                                
                                                vc.filters.append(Filter(entity: ConstantTexts.ExpertiseLT, title: categoryVM.title, id: categoryVM.expertiseId, isSelected: true))
                                                
                                                }
                                                if self.cityIdArray.count > 0{
                                                
                                                if self.cityId == String(){
                                                // yaha name wala code karna hai
                                                }else{
                                                self.customMethodManager?.updateIsSelect(entity: ConstantTexts.CityLT, primary_key: self.customMethodManager?.getTableAndKeys(entity: ConstantTexts.CityLT) ?? String(), primary_value: self.cityId, key: "is_selected", value: true)
                                                
                                                vc.filters.append(Filter(entity: ConstantTexts.CityLT, title: self.cityName, id: self.cityId, isSelected: true))
                                                }
                                                }
                                                vc.cityId = self.cityId
                                                print(self.cityId)
                                                self.navigationController?.pushViewController(vc, animated: true) */
                                               })
                            }
                        }
                       })
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    /* For Tableview
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
     // fetch the animation from the TableAnimation enum and initialze the TableViewAnimator class
     let animation = currentTableAnimation.getAnimation()
     let animator = TableViewAnimator(animation: animation)
     animator.animate(cell: cell, at: indexPath, in: tableView)
     } */
    
    
}
