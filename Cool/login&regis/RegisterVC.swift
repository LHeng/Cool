//
//  RegisterVC.swift
//  Cool
//
//  Created by 刘恒 on 2017/10/23.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

enum RegisterType {
    case Type_nomal
    case Type_reset
    case Type_forgotPassword
}
class RegisterVC: BaseViewController {
    
    @IBOutlet weak var accountT: UITextField!
    
    @IBOutlet weak var codeT: UITextField!
    
    @IBOutlet weak var passwordT: UITextField!
    
    @IBOutlet weak var regisBut: UIButton!
    
    @IBOutlet weak var codeBut: UIButton!
    
    @IBOutlet weak var loginBut: UIButton!
    
    var registerType = RegisterType.Type_nomal
    
    var timer : Timer!
    
    var timeOut : Int = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
         let user : User = CoreDataDB.getUser()
        if registerType == RegisterType.Type_forgotPassword {
            self.navigationItem.title = "重置密码"
            regisBut.setTitle("重置", for: UIControlState.normal)
            loginBut.isHidden = true
            
            if (user.name?.isNotEmpty())! {
                accountT.text = user.name
            }
        } else if registerType == RegisterType.Type_reset {
            self.navigationItem.title = "修改密码"
            regisBut.setTitle("修改", for: UIControlState.normal)
            loginBut.isHidden = true
            
            if (user.name?.isNotEmpty())! {
                accountT.text = user.name
            }
        }
        isNaviBackShow = false
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ButtonEvent(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerEvent), userInfo: nil, repeats: true)
            break
        case 1:
            if (accountT.text! as  NSString).length < 11 {
                
            } else if (passwordT.text! as  NSString).length < 6 {
                
            } else {
                CoreDataDB.updateUser(name: accountT.text!, password: passwordT.text!)
                self.navigationController?.popViewController(animated: true)
            }
            break
        case 2:
            self.navigationController?.popViewController(animated: true)
            break
        case 3:
            self.navigationController?.popViewController(animated: true)
            break
        default:
            break
        }
    }
    
    @objc func timerEvent() {
        if timeOut == 0 {
            codeBut.setTitle(NSString.init(format: "重新发送") as String, for: UIControlState.normal)
            codeBut.isEnabled = true
            
            timer.invalidate()
            timer = nil
            timeOut = 60
            return
        }
        codeBut.isEnabled = false
        timeOut -= 1
        codeBut.setTitle(NSString.init(format: "%d秒",timeOut) as String, for: UIControlState.normal)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

extension RegisterVC : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (range.length == 1 && string.count == 0) {
            return true
        } else if textField.tag == 0 {
            return (textField.text?.count)! < 11
        } else if textField.tag == 2 {
            return (textField.text?.count)! < 6
        } else if textField.tag == 3 {
            return (textField.text?.count)! < 20
        }
        return true
    }
}





