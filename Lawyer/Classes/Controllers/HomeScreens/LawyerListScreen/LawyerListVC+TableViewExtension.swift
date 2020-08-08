//
//  LawyerListVC+TableViewExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 21/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit

//MARK: - UITableViewDataSource extension
extension LawyerListVC:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LawyerNewTableViewCell.className, for: indexPath) as? LawyerNewTableViewCell else {
            fatalError(ConstantTexts.unexpectedIndexPath)
        }
        
        cell.buttonMeetRef.tag = indexPath.row
        cell.buttonMeetRef.addTarget(self, action: #selector(self.btnMeetTapped(_:)), for: .touchUpInside)
        
        return cell
    }
}




//MARK: - UITableViewDelegate extension
extension LawyerListVC:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
   /* func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // fetch the animation from the TableAnimation enum and initialze the TableViewAnimator class
        let animation = currentTableAnimation.getAnimation()
        let animator = TableViewAnimator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    } */
    
    
}
