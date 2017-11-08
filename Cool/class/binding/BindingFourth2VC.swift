//
//  BindingFourth2VC.swift
//  Cool
//
//  Created by 刘恒 on 2017/11/7.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class BindingFourth2VC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0){
            let fourth4  = LoginSB.instantiateViewController(withIdentifier: "BindingFourth3VC")
            self.navigationController?.pushViewController(fourth4, animated: true)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
