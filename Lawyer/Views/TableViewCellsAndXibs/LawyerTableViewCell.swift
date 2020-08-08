//
//  LawyerTableViewCell.swift
//  Lawyer
//
//  Created by Aman Kumar on 21/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit

class LawyerTableViewCell: SBaseTableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var imageCategory: UIImageView!
    @IBOutlet weak var titlelLabelCategory: UILabel!
    @IBOutlet weak var imageRightArrow: UIImageView!
    @IBOutlet weak var viewBG: UIView!
    
    //MARK: - Variables
    internal var customMethodManager:CustomMethodProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //TODO: Setup cell implementation
    private func setUpCell(){
        
        if customMethodManager == nil {
            customMethodManager = CustomMethodClass.shared
        }
        
        self.imageRightArrow.isHidden = true
        
        self.customMethodManager?.provideShadowAndCornerRadius(self.viewBG, 0, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.placeholderColor, 2, 2, 2, 2, 0, AppColor.tableBGColor)
        self.viewBG.backgroundColor = AppColor.whiteColor
        
        self.backgroundColor = AppColor.tableBGColor
        self.titlelLabelCategory.font = AppFont.Semibold.size(AppFontName.OpenSans, size: 12)
        self.titlelLabelCategory.textColor = AppColor.darkGrayColor
       /*
        self.imageCategory.setImageTintColor(AppColor.darkGrayColor)
        self.imageRightArrow.setImageTintColor(AppColor.darkGrayColor)
         */
    }
    
    
    //TODO: Configure with info
    public func configure(with info: CategoryViewModel){
        self.imageCategory.image = info.image
        self.titlelLabelCategory.text = info.title
    }
    
}
