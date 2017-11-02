//
//  LoginVC.swift
//  Cool
//
//  Created by 刘恒 on 2017/10/23.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class LoginVC: BaseViewController {

    @IBOutlet weak var accountT: UITextField!
    
    @IBOutlet weak var passwordT: UITextField!
    
    @IBOutlet weak var loginBut: UIButton!
    var isForgotPassword:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "登录"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "icon_wifi")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), style: UIBarButtonItemStyle.plain, target: self, action: #selector(rightNaviAction(_:)))
        isNaviBackShow = false
      
     
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let user : User = CoreDataDB.getUser()
        accountT.text = user.name
        passwordT.text = user.password
    }
    @objc func rightNaviAction(_ sender: UIBarButtonItem) {
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ButtonEvent(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if (accountT.text! as  NSString).length < 11 {
                
            } else if (passwordT.text! as  NSString).length < 6 {
                
            } else {
                CoreDataDB.updateUser(name: accountT.text!, password: passwordT.text!)
                let mainVC = MainTabBarVC()
                mainVC.selectedIndex = 0
                kAppDelegate.window?.rootViewController = mainVC
            }
            break
        case 1:
            isForgotPassword = false
          self .performSegue(withIdentifier: "toRegis", sender: nil)
            break
        case 2:
            isForgotPassword = true
            self.performSegue(withIdentifier: "toRegis", sender: nil)
            break
        default:
            break
        }
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination.isKind(of: RegisterVC.self) {
            let vc:RegisterVC = segue.destination as! RegisterVC
            if isForgotPassword {
                vc.registerType = RegisterType.Type_forgotPassword
            }
            else {
                vc.registerType = RegisterType.Type_nomal
            }
        }
    }
    
}

extension LoginVC : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (range.length == 1 && string.characters.count == 0) {
            return true
        } else if textField.tag == 0 {
            return (textField.text?.characters.count)! < 11
        } else if textField.tag == 1 {
            return (textField.text?.characters.count)! < 20
        }
        
        return true
}


}
