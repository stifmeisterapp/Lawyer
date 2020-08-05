//
//  CategoryCollectionViewCellAndXib.swift
//  Lawyer
//
//  Created by Aman Kumar on 02/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit

class CategoryCollectionViewCellAndXib: UICollectionViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var imageCategory: UIImageView!
    @IBOutlet weak var titlelLabelCategory: UILabel!
    @IBOutlet weak var viewBG: UIView!
    
    //MARK: - Variables
    internal var customMethodManager:CustomMethodProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpCell()
    }
    
    
    //TODO: Setup cell implementation
    private func setUpCell(){
        
        if customMethodManager == nil {
            customMethodManager = CustomMethodClass.shared
        }
        
        
       /* self.customMethodManager?.provideShadowAndCornerRadius(self.viewBG, 0, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.placeholderColor, 2, 2, 2, 2, 0, AppColor.tableBGColor) */
        self.customMethodManager?.provideCornerBorderTo(self, 0.5, AppColor.placeholderColor)
        self.viewBG.backgroundColor = AppColor.whiteColor
        
        self.backgroundColor = AppColor.tableBGColor
        self.titlelLabelCategory.font = AppFont.Semibold.size(AppFontName.OpenSans, size: 11)
        self.titlelLabelCategory.textColor = AppColor.darkGrayColor
        self.titlelLabelCategory.textAlignment = .center
        self.titlelLabelCategory.numberOfLines = 0
        
        self.imageCategory.setImageTintColor(AppColor.darkGrayColor)
        
    }
    
    
    //TODO: Configure with info
    public func configure(with info: CategoryViewModel){
        self.imageCategory.image = info.image
        self.titlelLabelCategory.text = info.title.replacingOccurrences(of: ConstantTexts.blankSpace, with: ConstantTexts.newLineBreak)
    }
    
    
}
