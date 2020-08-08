//
//  LawyerListVC+CollectionViewExtensions.swift
//  Lawyer
//
//  Created by Aman Kumar on 05/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
//MARK: - UICollectionViewDataSource extension
extension LawyerListVC:UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (self.filterCategoryListDataVM == nil) ? 0 : self.filterCategoryListDataVM?.numberOfSections ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.filterCategoryListDataVM?.numberOfItemsInSection(section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.className, for: indexPath) as? FilterCollectionViewCell else{
            fatalError(ConstantTexts.unexpectedIndexPath)
        }
        
        guard let item = self.filterCategoryListDataVM?.filterCategoriesAtIndex(indexPath.row) else {
            fatalError("No FilterCategoryViewModel found...")
        }
        
        cell.btnSelectRef.tag = indexPath.row
        cell.btnSelectRef.addTarget(self, action: #selector(self.btnSelectedCell(_:)), for: .touchUpInside)
        
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
        
        return CGSize(width: (cell.titleFilter.intrinsicContentSize.width + 65), height: collectionView.frame.size.height)
    }
}
