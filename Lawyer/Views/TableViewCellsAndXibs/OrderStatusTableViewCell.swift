//
//  OrderStatusTableViewCell.swift
//  Lawyer
//
//  Created by Aman Kumar on 28/09/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit

class OrderStatusTableViewCell: SBaseTableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var viewLine: UIView!
    @IBOutlet weak var lblDetails: UILabel!
    
    //MARK: - Variables
    internal var customMethodManager:CustomMethodProtocol?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        setup()
    }
    
    //MARK: - User Define Functions
    //TODO: Configure with info
    public func configureNew(with info: String){
        self.lblDetails.text = info
        
        
    }
    
    
    
    
    //TODO: setup with new info
    private func setup(){
        if customMethodManager == nil {
            customMethodManager = CustomMethodClass.shared
        }
        
        self.viewBG.backgroundColor = AppColor.tableBGColor
        self.viewLine.backgroundColor = AppColor.themeColor
        self.customMethodManager?.provideCornerRadiusTo(self.viewBG, 5, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner])
        self.lblDetails.font = AppFont.Semibold.size(AppFontName.OpenSans, size: 10)
        self.lblDetails.textColor = AppColor.darkGrayColor
        self.lblDetails.numberOfLines = 0
        
        
        
    }
    
    
    
}
