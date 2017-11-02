//
//  BaseNavigationViewController.swift
//  Cool
//
//  Created by 刘恒 on 2017/10/23.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

let karBlack = UIColor.init(red: 32.0 / 255.0, green: 32.0 / 255.0, blue: 32.0 / 255.0, alpha: 1.0)

class BaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //bar backgroud color
        self.navigationBar.barTintColor = UIColor.white
        //no translucent
        self.navigationBar.isTranslucent = false
        //back button an such
        self.navigationBar.tintColor = karBlack
        //title's text color
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : karBlack]
         
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
