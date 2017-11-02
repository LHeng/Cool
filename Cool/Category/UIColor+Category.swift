//
//  UIColor+Category.swift
//  Cool
//
//  Created by 刘恒 on 2017/10/23.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

extension UIColor {
    enum karColor {
        case mainBGColor
        case karRed
        case karRedPress
        case karPink
        case karBule
        case karPurple
        case karBlack
        case karGray
        func color() -> UIColor {
            switch self {
            case .mainBGColor:
                return hexStringToColor(hexsring: "F9F9F9")
            case .karRed:
                return UIColor.init(red: 255.0 / 255.0, green: 80.0 / 255.0, blue: 95.0 / 255.0, alpha: 1.0)
            case .karRedPress:
                return UIColor.init(red: 215.0 / 255.0, green: 70.0 / 255.0, blue: 84.0 / 255.0, alpha: 1.0)
            case .karPink:
                return UIColor.init(red: 255.0 / 255.0, green: 200.0 / 255.0, blue: 207.0 / 255.0, alpha: 1.0)
            case .karBule:
                return UIColor.init(red: 0.0 / 255.0, green: 188.0 / 255.0, blue: 252.0 / 255.0, alpha: 1.0)
            case .karPurple:
                return UIColor.init(red: 255.0 / 255.0, green: 0.0 / 255.0, blue: 128.0 / 255.0, alpha: 1.0)
            case .karBlack:
                return UIColor.init(red: 32.0 / 255.0, green: 32.0 / 255.0, blue: 32.0 / 255.0, alpha: 1.0)
            case .karGray:
                return UIColor.init(red: 129.0 / 255.0, green: 129.0 / 255.0, blue: 129.0 / 255.0, alpha: 1.0)
            default: break
            
            }
        }

    }
    
    class func karRGB(R : CGFloat, G : CGFloat, B : CGFloat)->UIColor{
        return UIColor.init(red: R / 255.0, green: G / 255.0, blue: B / 255.0, alpha: 1.0)
    }
    
    class func hexStringToColor(hexsring : String) -> UIColor {
        
        var cString: String = hexsring.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        if cString.characters.count < 6 {return UIColor.black}
        
        let index = cString.index(cString.endIndex, offsetBy: -6)
        
        if cString.hasPrefix("0X") {cString = cString.substring(from: index)}
        
        if cString.hasPrefix("#") {cString = cString.substring(from: index)}
        
        if cString.characters.count != 6 {return UIColor.black}
        
        
        
        var range: NSRange = NSMakeRange(0, 2)
        
        let rString = (cString as NSString).substring(with: range)
        
        range.location = 2
        
        let gString = (cString as NSString).substring(with: range)
        
        range.location = 4
        
        let bString = (cString as NSString).substring(with: range)
        
        
        
        var r: UInt32 = 0x0
        
        var g: UInt32 = 0x0
        
        var b: UInt32 = 0x0
        
        Scanner.init(string: rString).scanHexInt32(&r)
        
        Scanner.init(string: gString).scanHexInt32(&g)
        
        Scanner.init(string: bString).scanHexInt32(&b)
        
        
        
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(1))
    }
}
