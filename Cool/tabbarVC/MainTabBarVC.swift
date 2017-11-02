//
//  MainTabBarVC.swift
//  Cool
//
//  Created by 刘恒 on 2017/10/23.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class MainTabBarVC: UITabBarController {
    
    var hasSelectViewController : Bool = false

    var VCs = [UIViewController]()
    
    var markView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
        markView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth / CGFloat(VCs.count), height: 2.5))
        markView.backgroundColor = UIColor.karColor.karRed.color()
        self.tabBar.addSubview(markView)
        // Do any additional setup after loading the view.
    }
    
    func setUpTabBar() {
        //设置tabbar的背景颜色
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().isTranslucent = false
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.init(red: 129 / 255.0, green: 129 / 255.0, blue: 129 / 255.0, alpha: 1.0)], for: UIControlState.normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12)], for: UIControlState.normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.karColor.karRed.color(),NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12)], for: UIControlState.selected)
        
        //精彩视听
        let mainVC = MainSB.instantiateViewController(withIdentifier: "MainVC")
        mainVC.tabBarItem.title = "精彩视听"
        mainVC.tabBarItem.titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: 0)
        mainVC.tabBarItem.image = UIImage.init(named: "button_dock1")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        mainVC.tabBarItem.selectedImage = UIImage.init(named: "button_dock_select1")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        mainVC.tabBarItem.tag = 0
         UserDefaults.standard.setValue(NSNumber.init(value: 0), forKey: "lastSelectedIndex")
        
        //舞蹈编程
        let danceVC = UIViewController()
        danceVC.tabBarItem.title = "舞蹈编程"
        danceVC.tabBarItem.titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: -4)
        danceVC.tabBarItem.image = UIImage.init(named: "button_dock2")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        danceVC.tabBarItem.selectedImage = UIImage.init(named: "button_dock_select2")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        danceVC.tabBarItem.tag = 1
        
        //互动助手
        let chatVC:BaseNavigationViewController = ChatSB.instantiateViewController(withIdentifier: "ChatVC") as! BaseNavigationViewController
        chatVC.tabBarItem.title = "互动助手"
        chatVC.tabBarItem.titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: -4)
        chatVC.tabBarItem.image = UIImage.init(named: "button_dock3")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        chatVC.tabBarItem.selectedImage = UIImage.init(named: "button_dock_select3")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        chatVC.tabBarItem.tag = 2
        
        //个人中心
        let meVC:BaseNavigationViewController = MeSB.instantiateViewController(withIdentifier: "MeVC") as! BaseNavigationViewController
        meVC.tabBarItem.title = "个人中心"
        meVC.tabBarItem.titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: -4)
        meVC.tabBarItem.image = UIImage.init(named: "button_dock4")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        meVC.tabBarItem.selectedImage = UIImage.init(named: "button_dock_select4")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        meVC.tabBarItem.tag = 3
        
        VCs = [mainVC,danceVC,chatVC,meVC]
        self.viewControllers = VCs
        self.selectedIndex = 0
        self.tabBar.selectionIndicatorImage = UIImage.getImageWithColor(UIColor.hexStringToColor(hexsring: "f3f3f3"), rect: CGRect.init(x: 0, y: 0, width: kScreenWidth / CGFloat(VCs.count), height: CGFloat(TabbarHeight + 27)))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        var tabbarRect : CGRect = self.tabBar.frame
        tabbarRect.size.height = CGFloat(TabbarHeight + 27)
        tabbarRect.origin.y = kScreenHeight - tabbarRect.size.height
        self.tabBar.frame = tabbarRect
    }
    
    func markMoveAnimation(_ sender : Int) {
        var markRect = self.markView.frame
        markRect.origin.x = CGFloat(sender) * kScreenWidth / CGFloat(VCs.count)
        UIView.animate(withDuration: 0.1) {
            self.markView.frame = markRect
        }
    }
  
}
    extension MainTabBarVC {
        override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
            if item.tag == 1
            {
                let danceProgram = DanceSB.instantiateViewController(withIdentifier: "DanceVC")
                self.present(danceProgram, animated: true, completion: nil)
                
            }else {
                UserDefaults.standard.setValue(NSNumber.init(value: item.tag), forKey: "lastSelectedIndex")
                markMoveAnimation(item.tag)
            }
        }

}
