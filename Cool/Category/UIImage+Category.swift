//
//  UIImage+Category.swift
//  Cool
//
//  Created by 刘恒 on 2017/10/23.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit
extension UIImage {
    class func getImageWithColor(_ color : UIColor , rect : CGRect)->UIImage{
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        let fillRect = CGRect.init(origin: CGPoint.zero, size: rect.size)
        context!.fill(fillRect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
