//
//  DeviceMessageVC.swift
//  Cool
//
//  Created by 刘恒 on 2017/11/24.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class DeviceMessageVC: BaseViewController {
    
    let cellTitles = ["设备图片","设备名称:","设备状态","宝贝信息","常见问题帮助","修改网络","解绑设备"]
    
    let imagePickerController : UIImagePickerController = UIImagePickerController()
    
    var headerImage :UIImage = UIImage()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        navigationItem.title = "设备信息"
       
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension DeviceMessageVC : UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    //MARK:- UITableViewDataSource&&UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitles.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 70
        }else if indexPath.row == 2{
            return 55
        }else if indexPath.row == cellTitles.count{
            return 155
        }else{
            return 50
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell : DeviceMessageHeaderCell = tableView.dequeueReusableCell(withIdentifier: "DeviceMessageHeaderCell", for: indexPath) as! DeviceMessageHeaderCell
            cell.backgroundColor = UIColor.clear
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            if (UIImagePNGRepresentation(headerImage) != nil){
            cell.headerImage.image = self.headerImage
            }
            return cell
        }else if indexPath.row == 1{
            let cell : DeviceMessageCell = tableView.dequeueReusableCell(withIdentifier: "DeviceMessageCell", for: indexPath) as! DeviceMessageCell
            cell.backgroundColor = UIColor.clear
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }else if indexPath.row == 2{
            let cell : DeviceStatusCell = tableView.dequeueReusableCell(withIdentifier: "DeviceStatusCell", for: indexPath) as! DeviceStatusCell
            cell.backgroundColor = UIColor.clear
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
            
        }else if indexPath.row == cellTitles.count{
            let cell : DeviceMessageFootCell = tableView.dequeueReusableCell(withIdentifier: "DeviceMessageFootCell", for: indexPath) as! DeviceMessageFootCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }else{
            let cell : DeviceMessageOtherCell = tableView.dequeueReusableCell(withIdentifier: "DeviceMessageOtherCell", for: indexPath) as! DeviceMessageOtherCell
            cell.titleLabel.text = cellTitles[indexPath.row]
            cell.backgroundColor = UIColor.clear
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            self.view.endEditing(true)
            print(indexPath.row)
            var sourceType : UIImagePickerControllerSourceType = .photoLibrary
            imagePickerController.delegate = self
            imagePickerController.allowsEditing = true
            imagePickerController.view.backgroundColor = UIColor.white
            let titles = ["图库","相机"]
            let styles = [0,0]
            LHUIAlertController.showArrayAlertWith(viewController: self, title: "选择", message:"温馨提示", callBackBlock: { (str) in
                
                switch str {
                case "图库":
                    print(str)
                    sourceType = .photoLibrary
                case "相机":
                    print(str)
                    sourceType = .camera
                default:
                    break
                }
                
                if sourceType == .camera{
                    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
                        self.imagePickerController.sourceType = sourceType
                        self.present(self.imagePickerController, animated: true, completion: nil)
                    }else{
                        print("没有访问相机的权限")
                    }
                }else{
                    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
                        self.imagePickerController.sourceType = sourceType
                        self.present(self.imagePickerController, animated: true, completion: nil)
                    }else{
                        print("没有访问相册的权限")
                    }
                }
            }, cancelButtonTitle: "取消", otherButtonTitleArray: titles, otherButtonStyleArray: styles as NSArray, actionStyle: UIAlertControllerStyle.actionSheet)
            
        case 1:
            self.view.endEditing(true)
            print(indexPath.row)
            
        case 2:
            self.view.endEditing(true)
            print(indexPath.row)
        case 3:
            self.view.endEditing(true)
            print(indexPath.row)
            self.performSegue(withIdentifier: "BabyMessageVC", sender: nil)
        case 4:
            self.view.endEditing(true)
            print(indexPath.row)
            self.performSegue(withIdentifier: "HelpVC", sender: nil)
        case 5:
            self.view.endEditing(true)
            print(indexPath.row)
            let VC = LoginSB.instantiateViewController(withIdentifier: "BindingVC")
            self.navigationController?.pushViewController(VC, animated: true)
        case 6:
            self.view.endEditing(true)
            print(indexPath.row)
            let VC : LoginOutView = LoginOutView.init(frame: UIScreen.main.bounds)
            VC.title = "确定解除设备？"
            VC.againTitle = "再考虑一下"
            VC.OKTitle = "确定"
            VC.callbackBlock={(index) in
                switch index {
                case 0:
                 print(index)
                    self.navigationController?.popToRootViewController(animated: true)
                default:
                    break
                }
            }
            Kwindow?.addSubview(VC)
        default:
            break
        }
    }
    
    //MARK:- UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            headerImage = image
            tableView.reloadData()
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
