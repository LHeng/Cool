//
//  CoreDataDB.swift
//  Cool
//
//  Created by 刘恒 on 2017/10/21.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit
import CoreData
import SugarRecord
class CoreDataDB: NSObject {

    class func getUser()->User {
        let user : [User]  = try! db.fetch(FetchRequest<User>().filtered(with: "cdid", equalTo: "UserInformation"))
        if user.count > 0 {
            return user.first!
        }else {
            let user : User = try! db.saveContext.new()
            return user
        }
    }
    
    class func updateUser(name : String, password : String) {
        let user : [User] = try! db.fetch(FetchRequest<User>().filtered(with: "cdid", equalTo: "UserInformation"))
        if user.count > 0 {
            try! db.operation({ (context, save) in
                if let item = try! context.request(User.self).filtered(with: "cdid", equalTo: "UserInformation").fetch().first {
                    if name.isNotEmpty() {
                        item.name = name
                    }
                    password.count
                    if  password.isNotEmpty() {
                        item.password = password
                    }
                }
                save()
            })
        } else {
            try! db.operation({ (contentext, save) in
                let user : User = try! contentext.create()
                if name.isNotEmpty() && password.isNotEmpty() {
                    user.name = name
                    user.password = password
                    user.cdid = "UserInformation"
                }
                save()
            })
        }
    }
}


