//
//  AppointMentTableViewCellAndXib+UICollectionViewExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 07/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit

//MARK: - UICollectionViewDataSource extension
extension AppointMentTableViewCellAndXib:UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayTiming.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeCollectionViewCellAndXib.className, for: indexPath) as? TimeCollectionViewCellAndXib else{
            fatalError(ConstantTexts.unexpectedIndexPath)
        }
        
        cell.btnSelectRef.tag = indexPath.row
        cell.buttonCallBack = { index in
            
            
            UIView.animate(withDuration: 0.1,
                           animations: {
                            cell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            },
                           completion: { _ in
                            UIView.animate(withDuration: 0.1) {
                                cell.transform = CGAffineTransform.identity
                                self.arrayTiming[index].isSelected = !self.arrayTiming[index].isSelected
                                cell.configure(with: self.arrayTiming[index])
                            }
            })
        }
        cell.configure(with: self.arrayTiming[indexPath.row])
        return cell
    }
    
    
    
}

//MARK: - UICollectionViewDelegateFlowLayout extension
extension AppointMentTableViewCellAndXib:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 4
        let spacingBetweenCells:CGFloat = 16
        
        let spacingBetweenCellsColumns:CGFloat = 8
        let numberOfItemsPerColumn:CGFloat = 2
        
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        
        let totalSpacingColumn = (2 * self.spacing) + ((numberOfItemsPerColumn - 1) * spacingBetweenCellsColumns) //Amount of total spacing in a column
        
        if let collection = self.timeCollectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            
            let height = (collection.bounds.height - totalSpacingColumn) / numberOfItemsPerColumn
            
            return CGSize(width: width, height: height)
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
    
    
}
