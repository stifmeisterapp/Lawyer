//
//  SBaseViewController+UIDocumentPicker.swift
//  Lawyer
//
//  Created by Aman Kumar on 06/09/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

extension SBaseViewController:UIDocumentPickerDelegate{
    
    
    //TODO: Open documents
    public func openDocuments(){
        let documentsPicker = UIDocumentPickerViewController(documentTypes: [String(kUTTypeText),String(kUTTypeContent),String(kUTTypeItem),String(kUTTypeData)], in: .import)
        documentsPicker.delegate = self
        documentsPicker.allowsMultipleSelection = false
        self.present(documentsPicker, animated: true, completion: nil)
        
    }
    
    
    
    //MARK: - Document picker delegates
    //TODO: Implementation documentPicker
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let myURL = urls.first else {
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            do
            {
                let item = DocumentDataModel(Data(), ".pdf", "OtherDocs", String(), "document", Bool())
                item.fileName = "\(myURL)"
                item.data = try Data.init(contentsOf: URL.init(string:"\(item.fileName)")!)
                DispatchQueue.main.async {
                    self.getDocCallBack?(item)
                }
            }
            catch {
                // error
            }
        }
    }
    
    //TODO: Implementation documentPickerWasCancelled
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
        dismiss(animated: true, completion: nil)
    }
    
    
}