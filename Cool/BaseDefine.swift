//
//  BaseDefine.swift
//  Cool
//
//  Created by 刘恒 on 2017/10/23.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit
import CoreData

var kMainScreen : UIScreen    = UIScreen.main
let kScreenWidth : CGFloat   = UIScreen.main.bounds.size.width
let kScreenHeight : CGFloat  = UIScreen.main.bounds.size.height

let kAppDelegate = UIApplication.shared.delegate as! AppDelegate
let TabbarHeight =  UIApplication.shared.statusBarFrame.size.height > 20 ? 83 : 49
let NaviHeight = UIApplication.shared.statusBarFrame.size.height > 20 ? CGFloat(84) : CGFloat(64)

//StoryBoard about
let MainSB      = UIStoryboard.init(name: "Main", bundle: Bundle.main)

let DanceSB    = UIStoryboard.init(name: "Dance", bundle: Bundle.main)

let ChatSB      = UIStoryboard.init(name: "Chat", bundle: Bundle.main)

let MeSB        = UIStoryboard.init(name: "Me", bundle: Bundle.main)

let LoginSB    = UIStoryboard.init(name: "Login", bundle: Bundle.main)
