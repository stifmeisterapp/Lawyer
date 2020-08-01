//
//  SignUpVC+TableViewExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 01/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
//MARK: - UITableViewDataSource extension
extension SignUpVC:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return (self.dataListVM == nil) ? 0 : self.dataListVM?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataListVM?.numberOfRowsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Auth_TextField_TableViewCell.className, for: indexPath) as? Auth_TextField_TableViewCell else {
            fatalError(ConstantTexts.unexpectedIndexPath)
        }
        cell.textFieldFloating.delegate = self
        cell.configure(with: dataListVM?.dataStoreStructAtIndex(indexPath.row) ?? DataStoreStruct_ViewModel(DataStoreStruct(title: ConstantTexts.MobileNumberPH, placeholder: ConstantTexts.MobileNumberPH, value: ConstantTexts.empty, type: SignUpType.MobileNumber, image: UIImage(systemName: "phone.fill") ?? UIImage())))
        
        return cell
    }
}



//MARK: - UITableViewDelegate extension
extension SignUpVC:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // fetch the animation from the TableAnimation enum and initialze the TableViewAnimator class
        let animation = currentTableAnimation.getAnimation()
        let animator = TableViewAnimator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
    
    
}
