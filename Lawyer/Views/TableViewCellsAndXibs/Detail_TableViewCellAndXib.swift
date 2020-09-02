//
//  Detail_TableViewCellAndXib.swift
//  Lawyer
//
//  Created by Aman Kumar on 02/09/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit

class Detail_TableViewCellAndXib: SBaseTableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var viewBG: UIView!
    
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
    
    
    
    
    //TODO: - Setup textFieldFloating
    private func setUpTextField(){
        
        lblValue.font = AppFont.Regular.size(AppFontName.OpenSans, size: 14)
        lblValue.textColor = AppColor.darkGrayColor
        lblValue.numberOfLines = 0
        
    }
    
    
}
