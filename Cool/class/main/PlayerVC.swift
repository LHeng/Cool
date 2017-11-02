//
//  PlayerVC.swift
//  Cool
//
//  Created by 刘恒 on 2017/10/27.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class PlayerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func buttonEvent(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
