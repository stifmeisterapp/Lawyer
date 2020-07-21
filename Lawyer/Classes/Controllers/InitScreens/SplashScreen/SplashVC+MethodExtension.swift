//
//  SplashVC+MethodExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 18/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit
import Foundation

extension SplashVC{
    
    //TODO: Init values
    internal func initValues(){
        if soundManager == nil {
            soundManager = SoundClass.shared
        }
        
        if customMethodManager == nil {
            customMethodManager = CustomMethodClass.shared
        }
        
        initialSetup()
        
    }
    
    
    //TODO: IntialSetup
    private func initialSetup(){
        self.view.backgroundColor = UIColor(named: "LaunchColor")
        
        self.view_Animation.backgroundColor = .white
        self.customMethodManager?.provideShadowAndCornerRadius(self.view_Animation, self.view_Animation.frame.size.height / 2, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], UIColor(named: "WhiteShadow") ?? .clear, 2, 2, 2, 2, 0.5, UIColor(named: "CreamColor") ?? .clear)
        
        self.customMethodManager?.showLottieAnimation(self.view_Animation, ConstantTexts.Law, .playOnce)
        
        label_Logo.textAlignment = .center
        label_Logo.font = UIFont(name:"TypewriterKeys",size:35)
        label_Logo.text = ConstantTexts.AppName
        
        runAnimationLogo()
        
    }
    
    
    //TODO: Run logo animation
    private func runAnimationLogo(){
        UIView.animate(withDuration: 3, delay: 0, options: [.curveEaseIn], animations: {
            self.soundManager?.playSound("Judges_Gavel.mp3")
            self.logo_splash_Stack.alpha = 0
            self.logo_splash_Stack.transform = CGAffineTransform(scaleX: 3, y: 3)
            
        }) { (done) in
            if done{
                //Move Forward
                let vc = AppStoryboard.tabBarSB.instantiateViewController(withIdentifier: TabBarVC.className) as! TabBarVC
                UIApplication.shared.windows.first?.rootViewController = vc
                UIApplication.shared.windows.first?.makeKeyAndVisible()
                
            }
        }
        
    }
    
    
}
