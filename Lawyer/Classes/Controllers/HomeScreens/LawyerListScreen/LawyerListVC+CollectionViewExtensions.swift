//
//  LawyerListVC+CollectionViewExtensions.swift
//  Lawyer
//
//  Created by Aman Kumar on 05/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
import ViewAnimator
//MARK: - UICollectionViewDataSource extension
extension LawyerListVC:UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (self.filterCategoryListDataVM == nil) ? 0 : self.filterCategoryListDataVM?.numberOfSections ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  self.filterCategoryListDataVM?.numberOfItemsInSection(section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.className, for: indexPath) as? FilterCollectionViewCell else{
            fatalError(ConstantTexts.unexpectedIndexPath)
        }
        
        guard let item = self.filterCategoryListDataVM?.filterCategoriesAtIndex(indexPath.row) else {
            fatalError("No FilterCategoryViewModel found...")
        }
        
        cell.configure(with: item)
        
     
        return cell
    }
    


}

//MARK: - UICollectionViewDelegateFlowLayout extension
extension LawyerListVC:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.className, for: indexPath) as? FilterCollectionViewCell else{
            fatalError(ConstantTexts.unexpectedIndexPath)
        }
        
        guard let item = self.filterCategoryListDataVM?.filterCategoriesAtIndex(indexPath.row) else {
            fatalError("No FilterCategoryViewModel found...")
        }
        
        let text = item.title
        cell.titleFilter.text = text
        
        return CGSize(width: (cell.titleFilter.intrinsicContentSize.width + 55), height: collectionView.frame.size.height)
    }
}

/*

//MARK: - UICollectionViewDelegate extension
extension LawyerListVC:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      UIView.animate(withDuration: 0.1,
      animations: {
          if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCellAndXib {
              cell.viewBG.transform = .init(scaleX: 0.95, y: 0.95)
             cell.contentView.backgroundColor = AppColor.highLightColor
          }
      },
      completion: { _ in
          UIView.animate(withDuration: 0.1) {
             if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCellAndXib {
                  cell.viewBG.transform = .identity
                  cell.contentView.backgroundColor = .clear
                
                
                UIView.animate(views: collectionView.orderedVisibleCells,
                               animations: self.animations, reversed: true,
                               initialAlpha: 1.0,
                               finalAlpha: 0.0,
                               completion: {
                              
                                let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: LawyerListVC.className) as! LawyerListVC
                                if let categoryVM = self.categoryListVM?.categoryAtIndex(indexPath.row){
                                    vc.headerTitle = categoryVM.title
                                }
                                self.navigationController?.pushViewController(vc, animated: true)
                                
                })
                
                  
                  
                  
              }
          }
      })
    }
    
  /*  func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
           UIView.animate(withDuration: 0.5) {
             if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCellAndXib {
                 cell.viewBG.transform = .init(scaleX: 0.95, y: 0.95)
                cell.contentView.backgroundColor = AppColor.highLightColor
             }
         }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCellAndXib {
                cell.viewBG.transform = .identity
                cell.contentView.backgroundColor = .clear
                
                let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: LawyerListVC.className) as! LawyerListVC
                if let categoryVM = self.categoryListVM?.categoryAtIndex(indexPath.row){
                    vc.headerTitle = categoryVM.title
                }
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
        }
    } */
    
}

*/

