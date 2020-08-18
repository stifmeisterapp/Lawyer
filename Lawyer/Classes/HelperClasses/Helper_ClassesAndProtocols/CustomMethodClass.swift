//
//  CustomMethodClass.swift
//  Lawyer
//
//  Created by Aman Kumar on 18/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
import Lottie
import DropDown
import FullMaterialLoader
import CoreData
class CustomMethodClass: CustomMethodProtocol {
    
    //TODO: Singleton object
    static let shared = CustomMethodClass()
    private init() {}
    
    
    //TODO: Show ToolTip
    func showToolTip(msg:String,anchorView:UIView,sourceView:UIView){
        let rightBottomView = TipView()
        rightBottomView.color = AppColor.errorColor
        rightBottomView.textColor = AppColor.whiteColor
        rightBottomView.font = AppFont.Semibold.size(AppFontName.OpenSans, size: 12)
        rightBottomView.maxWidth = anchorView.frame.size.width - 50
        rightBottomView.dismissClosure = { tipview in
            print("call back to there..")
        }
        // Dismiss after spwcified duration
        rightBottomView.show(message: msg,
                             sourceView: anchorView,
                             containerView: sourceView,
                             direction: .top, dismissAfterDuration: 2.0)
    }
    
    
    //TODO: Provide corner radius
    func provideCornerRadiusTo(_ view:UIView, _ radius:CGFloat, _ corners:CACornerMask){
        view.layer.cornerRadius = radius
        view.clipsToBounds = true
        view.layer.maskedCorners = corners
    }
    
    //TODO: Provide shadow, border and corner radius
    func provideShadowAndCornerRadius(_ blueView:UIView, _ cornerRadius:CGFloat,_ corners:CACornerMask,_ shadowColor: UIColor, _ shadowWidth: CGFloat, _ shadowHeight: CGFloat,_ shadowOpacity: Float, _ shadowRadius: CGFloat, _ borderWidth:CGFloat, _ borderColor: UIColor){
        // corner radius
        blueView.layer.cornerRadius = cornerRadius
        blueView.layer.maskedCorners = corners
        
        // border
        blueView.layer.borderWidth = borderWidth
        blueView.layer.borderColor = borderColor.cgColor
        
        // shadow
        blueView.layer.shadowColor = shadowColor.cgColor
        blueView.layer.shadowOffset = CGSize(width: shadowWidth, height: shadowHeight)
        blueView.layer.shadowOpacity = shadowOpacity
        blueView.layer.shadowRadius = shadowRadius
    }
    
    //TODO: Provide border
    public func provideCornerBorderTo(_ item: UIView, _ border: CGFloat,_ borderColor: UIColor) {
        item.layer.borderColor = borderColor.cgColor
        item.layer.borderWidth = border
        item.clipsToBounds = true
    }
    
    
    //TODO: Provide AttributedText
    public func provideSimpleAttributedText( text:String, font: UIFont,  color: UIColor)->NSMutableAttributedString{
        return NSMutableAttributedString(string: "\(text)", attributes:[.font: font, .foregroundColor :color])
    }
    
    
    //TODO: Provide underline AttributedText
    public func provideUnderlineAttributedText( text:String, font: UIFont, _ color: UIColor)->NSMutableAttributedString{
        return NSMutableAttributedString(string: "\(text)", attributes:[.font: font, .foregroundColor :color, NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
    
    
    //TODO: Open drop down
    public func openDownOnView(dropDown:DropDown,array:[String],anchor:UIView,callBack:((_ dropDown:DropDown)->())){
        dropDown.anchorView = anchor
        dropDown.width = anchor.frame.size.width
        dropDown.dataSource = array
        /* dropDown.backgroundColor = AppColor.bgColor
         dropDown.textColor = AppColor.whiteColor */
        dropDown.bottomOffset = CGPoint(x: 0, y:anchor.bounds.height)
        dropDown.direction = .bottom
        dropDown.show()
        
        callBack(dropDown)
    }
    
    
    //TODO: Get indexPath for tableview cell
    func getIndexPathFor(view: UIView, tableView: UITableView) -> IndexPath? {
        let point = tableView.convert(view.bounds.origin, from: view)
        let indexPath = tableView.indexPathForRow(at: point)
        return indexPath
    }
    
    //TODO: Get indexPath for collectionview cell
    func getIndexPathForCollectionView(view: UIView, collectionView: UICollectionView) -> IndexPath? {
        let point = collectionView.convert(view.bounds.origin, from: view)
        let indexPath = collectionView.indexPathForItem(at: point)
        return indexPath
    }
    
    
    //MARK: - For progressview
    //TODO: configViews progressview
    func configViews(view: UIView) -> MaterialLoadingIndicator  {
        
        let indicator = MaterialLoadingIndicator(frame: CGRect(x:0, y:0, width: 30, height: 30))
        indicator.indicatorColor = [AppColor.errorColor.cgColor, AppColor.themeColor.cgColor]
        indicator.center = view.center
        view.addSubview(indicator)
        indicator.isHidden = true
        view.isUserInteractionEnabled = true
        return indicator
        
    }
    
    //TODO: startLoader
    func startLoader(view:UIView,indicator:MaterialLoadingIndicator) {
        indicator.isHidden = false
        indicator.startAnimating()
        view.isUserInteractionEnabled = false
        
    }
    
    //TODO: stopLoader
    func stopLoader(view:UIView,indicator:MaterialLoadingIndicator) {
        indicator.stopAnimating()
        indicator.isHidden = true
        view.isUserInteractionEnabled = true
    }
    
    
    
    //MARK: - Methods for coredata
    //TODO: Check entity is empty
    func entityIsEmpty(entity: String) -> Bool{
        let context = kAppDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            if result.count == 0{
                return true
            }else{
                return false
            }
            
        } catch {
            print("Error: \(error.localizedDescription)")
            return true
        }
        
    }
    
    //TODO: Delete all data
    func deleteAllData( entity:String,success: @escaping () -> ()) {
        let context = kAppDelegate.persistentContainer.viewContext
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        
        do {
            try context.execute(request)
        } catch {
            print("Detele all data in \(entity) error :", error)
        }
        success()
    }
    
    
    //TODO: Delete all data filters
    func deleteAllDataFilters( entity:String){
        let context = kAppDelegate.persistentContainer.viewContext
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        
        do {
            try context.execute(request)
        } catch {
            print("Detele all data in \(entity) error :", error)
        }
    }
    
    
    
    
    //TODO: Get user from data base
    func getUser(entity: String) -> User_Data_Model{
        
        let user = User_Data_Model(DeviceId: String(), DeviceType: String(), Email: String(), FirebaseId: String(), Fullname: String(), Id: String(), IpAddress: String(), Mobile: String(), type: String(), Uuid: String(), token: String())
        
        let context = kAppDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        request.fetchLimit = 1
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                
                user.DeviceId = data.value(forKey: "device_id") as? String ?? String()
                user.DeviceType = data.value(forKey: "device_type") as? String ?? String()
                user.Email = data.value(forKey: "email") as? String ?? String()
                user.FirebaseId = data.value(forKey: "firebase_id") as? String ?? String()
                
                user.Fullname = data.value(forKey: "full_name") as? String ?? String()
                user.Id = data.value(forKey: "id") as? String ?? String()
                user.IpAddress = data.value(forKey: "ip_address") as? String ?? String()
                user.Mobile = data.value(forKey: "mobile") as? String ?? String()
                
                
                user.type = data.value(forKey: "type") as? String ?? String()
                user.Uuid = data.value(forKey: "uuid") as? String ?? String()
                user.token = data.value(forKey: "token") as? String ?? String()
                
            }
            
        } catch {
            
            print("Failed")
        }
        
        return user
    }
    
    
    //TODO: Get filter from data base
    func retrive_filter(entity: String,keyName:String,keyId:String) -> [Filter]{
        var filters = [Filter]()
        let context = kAppDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                let filter = Filter(title: String(), id: String(), isSelected: Bool())
                filter.title = data.value(forKey: keyName) as? String ?? String()
                filter.id = data.value(forKey: keyId) as? String ?? String()
                filter.isSelected = data.value(forKey: "is_selected") as? Bool ?? Bool()
                filters.append(filter)
            }
            
        } catch {
            
            print("Failed")
        }
        
        
        return filters
    }
    
    
    //TODO: Update is_select value for filter
    func updateIsSelect(entity: String,primary_key:String,primary_value:String,key:String,value:Bool){
        let context = kAppDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        request.predicate = NSPredicate(format: "\(primary_key) = %@", primary_value)
        
        do {
            let result = try context.fetch(request)
            let filterObject = result[0] as! NSManagedObject
            filterObject.setValue(value, forKey: key)
            do{
                try context.save()
            }catch{
                print("Failed")
            }
        } catch {
            
            print("Failed")
        }
        
    }
    
    
}


//MARK: - Extension for lottie animation
extension CustomMethodClass {
    
    //TODO: Run lottie animation
    func showLottieAnimation(_ view: UIView,_ animationName:String, _ loopMode:LottieLoopMode) {
        let animationViewLottie = AnimationView(name: animationName)
        view.isUserInteractionEnabled = false
        animationViewLottie.isHidden = false
        view.clipsToBounds = true
        animationViewLottie.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        animationViewLottie.contentMode = .scaleAspectFit
        animationViewLottie.animationSpeed = 1
        animationViewLottie.loopMode = loopMode
        view.addSubview(animationViewLottie)
        animationViewLottie.play()
    }
    
    
}


