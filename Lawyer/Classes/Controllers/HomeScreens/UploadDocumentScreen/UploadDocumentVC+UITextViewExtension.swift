//
//  UploadDocumentVC+UITextViewExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 03/09/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
//MARK: - Textview delegates
extension UploadDocumentVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == AppColor.darkGrayColor {
            textView.font = AppFont.Regular.size(AppFontName.OpenSans, size: 10)
            textView.text = nil
            textView.textColor = AppColor.textColor
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.font = AppFont.Italic.size(AppFontName.OpenSans, size: 10)
            textView.text = ConstantTexts.WriteCommentPH
            textView.textColor = AppColor.darkGrayColor
        }
    }
    
}
