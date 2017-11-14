//
//  LHUIAlertController.swift
//  Cool
//
//  Created by 刘恒 on 2017/11/9.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class LHUIAlertController: UIAlertController {
        
    typealias CallBackBlock = (_ name : String)->()
    
    enum LHAlertAcionStyle {
        case LHAlertActionStyleDefault
        case LHAlertActionStyleCancel
        case LHAlertActionStyleDestructive
    }
    //MARK:- 简易提示窗 一个按钮或者无按钮
    class func showTipAlertView(viewController:UIViewController, title:String, message:String, buttonTitle:String, buttonStyle: LHAlertAcionStyle) {
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)

            var singleAction : UIAlertAction? = nil
            switch (buttonStyle) {
            case .LHAlertActionStyleDefault:
                singleAction = UIAlertAction.init(title: buttonTitle, style: UIAlertActionStyle.cancel, handler: { (action) in
                    
                })
                alertController.addAction(singleAction!)
            case .LHAlertActionStyleDestructive:
                singleAction = UIAlertAction.init(title: buttonTitle, style: UIAlertActionStyle.destructive, handler: { (action) in
                    
                })
                alertController.addAction(singleAction!)
            default://默认的
                singleAction = UIAlertAction.init(title: buttonTitle, style: UIAlertActionStyle.default, handler: { (action) in
                    
                })
                alertController.addAction(singleAction!)
        }
        viewController.present(alertController, animated: true, completion: nil)
            
            //如果没有按钮，自动延时消失actionStylev
            if buttonTitle.count == 0 {
                self.perform(#selector(dismissAlertController(sender:)), with: alertController, afterDelay: 1.0)
            }

}
    //MARK:- 简易提示窗 一个按钮或者无按钮
    class func showBottomTipViewWith(viewController:UIViewController, title:String, message:String) {
        
        let alertcontroller = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        viewController.present(alertcontroller, animated: true, completion: nil)
        
        //如果没有按钮，自动延时消失
        self.perform(#selector(dismissAlertController(sender:)), with: alertcontroller, afterDelay: 1.0)
    }
    
    //MARK:- 多按钮列表数组排布初始化
    class func showArrayAlertWith(viewController:UIViewController, title:String, message:String, callBackBlock:@escaping CallBackBlock, cancelButtonTitle:String, otherButtonTitleArray:[String], otherButtonStyleArray:NSArray, actionStyle:UIAlertControllerStyle) {
        
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: actionStyle)
        //添加按钮
    if cancelButtonTitle.count > 0 {
        let action = UIAlertAction.init(title: cancelButtonTitle, style: UIAlertActionStyle.cancel) { (action) in
            
        }
        alertController.addAction(action)
    }
    
    if otherButtonTitleArray.count > 0 && otherButtonStyleArray.count > 0 {
        
        for i in 0..<otherButtonTitleArray.count {
            let styleNum : NSNumber = otherButtonStyleArray[i] as! NSNumber
            let actionStyle : UIAlertActionStyle = UIAlertActionStyle(rawValue: Int(truncating: styleNum))!
            let action = UIAlertAction.init(title: (otherButtonTitleArray[i] ), style: actionStyle, handler: { (action) in
                callBackBlock(otherButtonTitleArray[i])
            })
            alertController.addAction(action)
        }
    }
    
    viewController.present(alertController, animated: true, completion: nil)
    
    if cancelButtonTitle.count == 0 && (otherButtonTitleArray.count == 0 || otherButtonStyleArray.count == 0)  {
        //如果没有按钮，自动延时消失
        self.perform(#selector(dismissAlertController(sender:)), with: alertController, afterDelay:1.0)
    }
    
    }
    
    
    
    //MARK:- 无按钮弹窗自动消失
    @objc class func dismissAlertController(sender:UIAlertController) {
        sender.dismiss(animated: true, completion: nil)
    }
}
