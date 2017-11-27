//
//  MeVC.swift
//  Cool
//
//  Created by 刘恒 on 2017/10/24.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class MeVC: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var msgView: UIView!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var sexImage: UIImageView!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var birthdayImage: UIImageView!
    @IBOutlet weak var constellationLabel: UILabel!
    @IBOutlet weak var constellationImage: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNaviBackShow = false
        
        headerImage.layer.cornerRadius = 50.0
        headerImage.layer.masksToBounds = true
        
        tableView.tableFooterView = UIView()
        tableView.isScrollEnabled = false
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.backgroundColor = UIColor.clear
        
        let user : User = CoreDataDB.getUser()
        phoneLabel.text = String.init(format: "账号：%@", user.name!)
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(messageTapAction))
        msgView.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    @objc func messageTapAction() {
        performSegue(withIdentifier: "tomsgView", sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.hidesBottomBarWhenPushed = true
       
    }

    @IBAction func buttonEvent(_ sender: UIButton) {
        let loginOutView : LoginOutView = LoginOutView.init(frame: UIScreen.main.bounds)
        loginOutView.callbackBlock={(index) in
            switch index {
            case 0:
                kAppDelegate.window?.rootViewController = UIStoryboard.init(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "BaseNavigationViewController")
            default:
                break
            }
        }
        Kwindow?.addSubview(loginOutView)
       
    }


@IBAction func performMeMessage(segue: UIStoryboardSegue) {
    
    if segue.identifier == MeMessageVC.MeMessage {
        if (segue.source as! MeMessageVC).sexStr == "男" {
            sexImage.image = UIImage.init(named: "icon_center_boy")
            sexLabel.text = "\((segue.source as! MeMessageVC).sexStr)生"
        } else if (segue.source as! MeMessageVC).sexStr == "女" {
            sexImage.image = UIImage.init(named: "icon_center_girl")
            sexLabel.text = "\((segue.source as! MeMessageVC).sexStr)生"
        }
        if (segue.source as! MeMessageVC).dadeStr.isNotEmpty() {
            birthdayLabel.text = (segue.source as! MeMessageVC).dadeStr
            birthdayImage.image = UIImage.init(named: "icon_center_date")
            let strs = (segue.source as! MeMessageVC).dadeStr.components(separatedBy: "-")
            var strTwo = ""
            if strs[2].count == 1 {
                strTwo = "0\(strs[2])"
            }else{
                strTwo = strs[2]
            }
            dayLabel.text = "\(strs.last!)"
            birthdayLabel.text = "\(strs[1]).\(strTwo)"
            let birth : String = strs[1] + strTwo
            let birthData = Int(birth)
            
            var xzImage : UIImage!
            var xzString : String!
            if birthData! >= 321 && birthData! <= 419 {//白羊座
                xzString = "白羊座"
                xzImage = UIImage.init(named: "icon_center_star1_牧羊座")
            }else if birthData! >= 420 && birthData! <= 520{//金牛座
                xzString = "金牛座"
                xzImage = UIImage.init(named: "icon_center_star2_金牛座")
            }else if birthData! >= 521 && birthData! <= 621{//双子座
                xzString = "双子座"
                xzImage = UIImage.init(named: "icon_center_star3_双子座")
            }else if birthData! >= 622 && birthData! <= 722{//巨蟹座
                xzString = "巨蟹座"
                xzImage = UIImage.init(named: "icon_center_star4_巨蟹座")
            }else if birthData! >= 723 && birthData! <= 822{//狮子座
                xzString = "狮子座"
                xzImage = UIImage.init(named: "icon_center_star5_狮子座")
            }else if birthData! >= 823 && birthData! <= 922{//处女座
                xzString = "处女座"
                xzImage = UIImage.init(named: "icon_center_star6_处女座")
            }else if birthData! >= 923 && birthData! <= 1023{//天秤座
                xzString = "天秤座"
                xzImage = UIImage.init(named: "icon_center_star7_天秤座")
            }else if birthData! >= 1024 && birthData! <= 1122{//天蝎座
                xzString = "天蝎座"
                xzImage = UIImage.init(named: "icon_center_star8_天蝎座")
            }else if birthData! >= 1123 && birthData! <= 1221{//射手座
                xzString = "射手座"
                xzImage = UIImage.init(named: "icon_center_star9_射手座")
            }else if birthData! >= 1222 && birthData! <= 1231{//摩羯座
                xzString = "摩羯座"
                xzImage = UIImage.init(named: "icon_center_star10_摩羯座")
            }else if birthData! >= 100 && birthData! <= 119{//摩羯座
                xzString = "摩羯座"
                xzImage = UIImage.init(named: "icon_center_star10_摩羯座")
            }else if birthData! >= 120 && birthData! <= 218{//水瓶座
                xzString = "水瓶座"
                xzImage = UIImage.init(named: "icon_center_star11_水瓶座")
            }else if birthData! >= 219 && birthData! <= 320{//双鱼座
                xzString = "双鱼座"
                xzImage = UIImage.init(named: "icon_center_star12_双鱼座")
            }
            constellationImage.image = xzImage
            constellationLabel.text = xzString
        }
        if (segue.source as! MeMessageVC).nicknameStr.isNotEmpty() {
            nickNameLabel.text = (segue.source as! MeMessageVC).nicknameStr
        }
        if ((segue.source as! MeMessageVC).headerImage != nil) {
            headerImage.image = (segue.source as! MeMessageVC).headerImage
        }
        }
    }
}


extension MeVC : UITableViewDelegate,UITableViewDataSource {
    
    //MARK:- tableview dataSource
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MeCell = tableView.dequeueReusableCell(withIdentifier: "MeCell", for: indexPath) as! MeCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        if indexPath.row == 1 {
            cell.label.text = "关于"
            cell.lineView.isHidden = true
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        switch indexPath.row {
        case 0:
            let vc : RegisterVC =  UIStoryboard.init(name: "Login", bundle:Bundle.main).instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
            vc.registerType = RegisterType.Type_reset
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            self.performSegue(withIdentifier: "toMsg", sender: nil)
        default:
            break
        }
    }
    
}

