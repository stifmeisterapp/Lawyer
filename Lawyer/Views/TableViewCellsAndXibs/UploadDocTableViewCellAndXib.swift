//
//  UploadDocTableViewCellAndXib.swift
//  Lawyer
//
//  Created by Aman Kumar on 04/09/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit

class UploadDocTableViewCellAndXib: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var imgDoc: UIImageView!
    @IBOutlet weak var lblDocName: UILabel!
    @IBOutlet weak var btnDeleteRef: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpTextField()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        setUpTextField()
    }
    
    
    //MARK: - User Define Functions
    //TODO: Config TableViewCell
    
    //TODO: Setup textFieldFloating
    private func setUpTextField(){
        self.viewBG.backgroundColor = AppColor.tableBGColor
        
        self.lblDocName.font = AppFont.Regular.size(AppFontName.OpenSans, size: 12)
        self.lblDocName.textColor = AppColor.darkGrayColor
        self.lblDocName.numberOfLines = 0
        self.lblDocName.textAlignment = .left
        self.lblDocName.text = "ConstantTexts.AdditionalInfoLT"
        
    }
    
}
