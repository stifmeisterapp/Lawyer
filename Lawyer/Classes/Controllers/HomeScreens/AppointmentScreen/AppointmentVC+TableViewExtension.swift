//
//  AppointmentVC+TableViewExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 07/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
import ViewAnimator
//MARK: - UITableViewDataSource extension
extension AppointmentVC:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppointMentTableViewCellAndXib.className, for: indexPath) as? AppointMentTableViewCellAndXib else {
            fatalError(ConstantTexts.unexpectedIndexPath)
        }
        cell.arrayTiming = self.data[indexPath.section].list
        return cell
    }
    
}




//MARK: - UITableViewDelegate extension
extension AppointmentVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: AppointmentHeaderView  = Bundle.main.loadNibNamed(AppointmentHeaderView.className, owner: self, options: nil)?.first as! AppointmentHeaderView
        header.backgroundColor = AppColor.tableBGColor
        header.labelName.font = AppFont.Semibold.size(AppFontName.OpenSans, size: 14)
        header.labelName.textColor = AppColor.darkGrayColor
        header.labelName.numberOfLines = 0
        header.imageView.setImageTintColor(AppColor.darkGrayColor)
        header.labelName.text = self.data[section].headerTitle
        header.imageView.image = self.data[section].image
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        self.customMethodManager?.provideShadowAndCornerRadius(self.footer.btnBookConsultaionRef, 2, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.darkGrayColor, -1, 1, 1, 3, 0, AppColor.clearColor)
        
        self.footer.btnBookConsultaionRef.setTitle(ConstantTexts.BookConsul_BT, for: .normal)
        self.footer.btnBookConsultaionRef.titleLabel?.font = ConstantFonts.mainBottomButtonFont
        
        self.footer.btnBookConsultaionRef.setTitleColor(AppColor.whiteColor, for: .normal)
        self.footer.btnBookConsultaionRef.backgroundColor = AppColor.themeColor
        self.footer.btnBookConsultaionRef.addTarget(self, action: #selector(btnBookConsultationTapped), for: .touchUpInside)
        
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 2 ? 135 : 0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return section == 2 ? 135 : 0
    }
}

