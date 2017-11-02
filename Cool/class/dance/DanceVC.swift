//
//  DanceVC.swift
//  Cool
//
//  Created by 刘恒 on 2017/10/24.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class DanceVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        isNaviBackShow = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonEvent(_ sender: UIButton) {
        
        let lastSelectedIndex : NSNumber = (UserDefaults.standard.value(forKey: "lastSelectedIndex") as? NSNumber)!
        let tabbarVc : MainTabBarVC = UIApplication.shared.keyWindow?.rootViewController as! UITabBarController as! MainTabBarVC
        tabbarVc.selectedIndex = lastSelectedIndex.intValue
        self.dismiss(animated: true, completion: nil)
    }
    //屏幕旋转
    override open var shouldAutorotate: Bool {
        return true
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    override open var preferredInterfaceOrientationForPresentation : UIInterfaceOrientation{
        return UIInterfaceOrientation.landscapeRight
    }
  
}
