//
//  BindingDeviceVC.swift
//  Cool
//
//  Created by 刘恒 on 2017/11/7.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class BindingDeviceVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func naviBackAction() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func buttonEvent(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}