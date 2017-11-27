//
//  LoginOutView.swift
//  Cool
//
//  Created by 刘恒 on 2017/11/14.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class LoginOutView: UIView {
    
    var title:String = ""
    var OKTitle:String = ""
    var againTitle:String = ""
    
    typealias CallBackBlock = (_ index:Int)->()
    
    var callbackBlock : CallBackBlock!
    
    
    @IBOutlet weak var titleLablel: UILabel!
    
    @IBOutlet weak var againButton: UIButton!
    
    @IBOutlet weak var OKButton: UIButton!
    
    @IBAction func buttonEvent(_ sender: UIButton) {

        if let _ = callbackBlock {
            callbackBlock(sender.tag)
        }
         self.removeFromSuperview()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        let view:UIView = Bundle.main.loadNibNamed("LoginOutView", owner: self, options: nil)?.first as! UIView
        self.addSubview(view)
        
        if title.count > 0 {
            titleLablel.text = title
        }
        if OKTitle.count > 0 {
            OKButton.setTitle(OKTitle, for: UIControlState.normal)
            OKButton.setTitle(OKTitle, for: UIControlState.highlighted)
        }
        if againTitle.count > 0 {
            againButton.setTitle(againTitle, for: UIControlState.normal)
            againButton.setTitle(againTitle, for: UIControlState.highlighted)
        }
    }
    
    
}
