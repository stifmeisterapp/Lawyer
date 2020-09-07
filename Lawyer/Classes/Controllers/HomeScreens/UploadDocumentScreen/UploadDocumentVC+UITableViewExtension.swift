//
//  UploadDocumentVC+UITableViewExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 03/09/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
//MARK: - UITableViewDataSource extension
extension UploadDocumentVC:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (self.docDataList == nil) ? 1 : self.docDataList?.numberOfSections ?? 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = self.docDataList?.numberOfRowsInSection(section) else {
            fatalError("No docDataList found...")
        }
        
        return count == 0 ? 1 : count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let count = self.docDataList?.numberOfRowsInSection(indexPath.section) else {
            fatalError("No docDataList found...")
        }
        if count == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EmptyWithAlertTableViewCell.className, for: indexPath) as? EmptyWithAlertTableViewCell else {
                fatalError(ConstantTexts.unexpectedIndexPath)
            }
            
            if let animationDetail = self.customMethodManager?.getAnimationNameAndMessage(errorCode: 1){
                cell.lblValue.backgroundColor = AppColor.clearColor
                cell.lblValue.font = AppFont.Bold.size(AppFontName.OpenSans, size: 16)
                cell.lblValue.textColor = AppColor.tanColor
                cell.lblValue.textAlignment = .center
                cell.lblValue.numberOfLines = 0
                cell.lblValue.text = animationDetail.1
                self.customMethodManager?.showLottieAnimation(cell.viewBG, animationDetail.0, .loop)
                
            }
            
            return cell
            
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UploadDocTableViewCellAndXib.className, for: indexPath) as? UploadDocTableViewCellAndXib else {
                fatalError(ConstantTexts.unexpectedIndexPath)
            }
            
            if let docItem = self.docDataList?.documentAtIndex(indexPath.row){
                cell.configure(with: docItem)
                cell.btnDeleteRef.tag = indexPath.row
                cell.btnDeleteRef.addTarget(self, action: #selector(btnDeleteTapped), for: .touchUpInside)
            }
            
            return cell
            
        }
        
        
    }
    
}




//MARK: - UITableViewDelegate extension
extension UploadDocumentVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        guard let count = self.docDataList?.numberOfRowsInSection(section) else {
            fatalError("No docDataList found...")
        }
        
        self.changeHeader(count: count)
        return self.header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard let count = self.docDataList?.numberOfRowsInSection(indexPath.section) else {
            fatalError("No docDataList found...")
        }
        
        return count == 0 ? 150 : 60
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard let count = self.docDataList?.numberOfRowsInSection(indexPath.section) else {
            fatalError("No docDataList found...")
        }
        
        return count == 0 ? 150 : 60
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 170
    }
}

