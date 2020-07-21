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
class CustomMethodClass: CustomMethodProtocol {
    
    //TODO: Singleton object
    static let shared = CustomMethodClass()
    private init() {}
    
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
        return NSMutableAttributedString(string: "\(text) ", attributes:[.font: font, .foregroundColor :color])
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

//MARK: - NSObject extension
extension NSObject {
    //TODO: Get class name
    class var className: String {
        return String(describing: self)
    }
}


//MARK: - Extension UIImageView
extension UIImageView{
    //TODO: Set image color
    func setImageTintColor(_ color:UIColor){
        self.image = self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
}
