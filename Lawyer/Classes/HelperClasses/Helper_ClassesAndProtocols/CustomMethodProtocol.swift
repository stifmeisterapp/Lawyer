//
//  CustomMethodProtocol.swift
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
protocol CustomMethodProtocol {
    
    //TODO: Show ToolTip
    func showToolTip(msg:String,anchorView:UIView,sourceView:UIView)
    
    //TODO: Provide corner radius
    func provideCornerRadiusTo(_ view:UIView, _ radius:CGFloat, _ corners:CACornerMask)
    
    //TODO: Provide shadow and corner radius
    func provideShadowAndCornerRadius(_ blueView:UIView, _ cornerRadius:CGFloat,_ corners:CACornerMask, _ shadowColor: UIColor, _ shadowWidth: CGFloat, _ shadowHeight: CGFloat,_ shadowOpacity: Float, _ shadowRadius: CGFloat, _ borderWidth:CGFloat, _ borderColor: UIColor)
    
    //TODO: Run lottie animation
    func showLottieAnimation(_ view: UIView,_ animationName:String, _ loopMode:LottieLoopMode)
    
    //TODO: Provide border
    func provideCornerBorderTo(_ item: UIView, _ border: CGFloat,_ borderColor: UIColor)
    
    //TODO: Provide AttributedText
    func provideSimpleAttributedText( text:String, font: UIFont,  color: UIColor)->NSMutableAttributedString
    
    //TODO: Provide underline AttributedText
    func provideUnderlineAttributedText( text:String, font: UIFont, _ color: UIColor)->NSMutableAttributedString
    
    //TODO: Open drop down
    func openDownOnView(dropDown:DropDown,array:[String],anchor:UIView,callBack:((_ dropDown:DropDown)->()))
    
    //TODO: Get indexPath for tableview cell
    func getIndexPathFor(view: UIView, tableView: UITableView) -> IndexPath?
    
    //TODO: Get indexPath for collectionview cell
    func getIndexPathForCollectionView(view: UIView, collectionView: UICollectionView) -> IndexPath?
    
    //TODO: configViews progressview
    func configViews(view: UIView) -> MaterialLoadingIndicator
    
    //TODO: startLoader
    func startLoader(view:UIView,indicator:MaterialLoadingIndicator)
    
    //TODO: stopLoader
    func stopLoader(view:UIView,indicator:MaterialLoadingIndicator)
    
    //TODO: Check entity is empty
    func entityIsEmpty(entity: String) -> Bool
    
    //TODO: Delete all data
    func deleteAllData( entity:String,success: @escaping () -> ())
    
    //TODO: Get user from data base
    func getUser(entity: String) -> User_Data_Model
    
    
    //TODO: Delete all data filters
    func deleteAllDataFilters( entity:String)
    
    //TODO: Get filter from data base
    func retrive_filter(entity: String,keyName:String,keyId:String) -> [Filter]
    
    //TODO: Update is_select value for filter
    func updateIsSelect(entity: String,primary_key:String,primary_value:String,key:String,value:Bool)
    
}
