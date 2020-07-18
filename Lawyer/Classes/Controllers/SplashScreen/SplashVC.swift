//
//  SplashVC.swift
//  Lawyer
//
//  Created by Aman Kumar on 18/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit
import AVFoundation
import AVFoundation
class SplashVC: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var logo_splash_Stack: UIStackView!
    @IBOutlet weak var view_Animation: UIView!
    @IBOutlet weak var label_Logo: UILabel!
    
    //MARK: - Variables
    internal var soundManager:SoundProtocol?
    internal var customMethodManager:CustomMethodProtocol?
    
    var player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initValues()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
