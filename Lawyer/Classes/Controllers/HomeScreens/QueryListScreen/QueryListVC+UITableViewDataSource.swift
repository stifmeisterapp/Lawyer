//
//  QueryListVC+UITableViewDataSource.swift
//  Lawyer
//
//  Created by Aman Kumar on 14/10/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit

//MARK: - UITableViewDataSource extension
/*extension QueryListVC:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return (self.queryList == nil) ? 0 : self.queryList?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let item = self.queryList?.QueryAtIndex(section) else {
            fatalError("No FilterCategoryViewModel found...")
        }
        
        return item.isOpen ? self.queryList?.numberOfRowsInSection(section) ?? 0 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let item = self.queryList?.QueryAtIndex(indexPath.section) else {
            fatalError("No FilterCategoryViewModel found...")
        }
        
        if item.isOpen{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Detail_TableViewCellAndXib.className, for: indexPath) as? Detail_TableViewCellAndXib else {
                fatalError(ConstantTexts.unexpectedIndexPath)
            }
            
            cell.viewBG.isHidden = false
            cell.tagListView.isHidden = true
            cell.btnSelectRef.isHidden = true
            cell.lblValue.text = item.Answer[indexPath.row]
            
            return cell
            
        }else{
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: QueryHeader  = Bundle.main.loadNibNamed(QueryHeader.className, owner: self, options: nil)?.first as! QueryHeader
        
        header.labelName.translatesAutoresizingMaskIntoConstraints = false
        header.backgroundColor = AppColor.whiteColor
        header.labelName.font = AppFont.Semibold.size(AppFontName.OpenSans, size: 16)
        header.labelName.textColor = AppColor.darkGrayColor
        header.labelName.numberOfLines = 0
        header.imageView.setImageTintColor(AppColor.darkGrayColor)
        header.btnSelectRef.tag = section
        header.btnSelectRef.addTarget(self, action: #selector(btnExpendTapped), for: .touchUpInside)
        
        if let detailItem = self.queryList?.QueryAtIndex(section) {
            header.labelName.text = detailItem.Query
        }

        return header
    }
    
}




//MARK: - UITableViewDelegate extension
extension QueryListVC:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let item = self.queryList?.QueryAtIndex(indexPath.row) else {
            fatalError("No FilterCategoryViewModel found...")
        }
        return item.isOpen ? UITableView.automaticDimension : 0
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let item = self.queryList?.QueryAtIndex(indexPath.row) else {
            fatalError("No FilterCategoryViewModel found...")
        }
        return item.isOpen ? UITableView.automaticDimension : 0
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let item = self.queryList?.QueryAtIndex(section) else {
            fatalError("No FilterCategoryViewModel found...")
        }
        
        return  item.Query.height(withConstrainedWidth: MAIN_SCREEN_WIDTH - 55, font: AppFont.Semibold.size(AppFontName.OpenSans, size: 16))
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        guard let item = self.queryList?.QueryAtIndex(section) else {
            fatalError("No FilterCategoryViewModel found...")
        }
        
        return  item.Query.height(withConstrainedWidth: MAIN_SCREEN_WIDTH - 55, font: AppFont.Semibold.size(AppFontName.OpenSans, size: 16))
    }
    
    
    
    /* func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
     // fetch the animation from the TableAnimation enum and initialze the TableViewAnimator class
     let animation = currentTableAnimation.getAnimation()
     let animator = TableViewAnimator(animation: animation)
     animator.animate(cell: cell, at: indexPath, in: tableView)
     } */
    
    
}
 */


//MARK: - UIScrollView Delegate
extension QueryListVC:UIScrollViewDelegate,UITableViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        if self.faqView.tableView.contentOffset.y != 0{
            
            if ((self.faqView.tableView.contentOffset.y + self.faqView.tableView.frame.size.height) >= self.faqView.tableView.contentSize.height){
                
                print(self.isPagination)
                if self.isPagination == false{
                    // self.offset += 10
                    self.getQuerisLisService(isRefresh: Bool())
                }
            }
        }
        
    }
}

