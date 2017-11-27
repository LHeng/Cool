//
//  MeMessageVC.swift
//  Cool
//
//  Created by 刘恒 on 2017/11/9.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class MeMessageVC: BaseViewController {
    
    static let MeMessage = "MeMessage"
    
    var sexStr = ""
    
    var dadeStr = ""
    
    var nicknameStr = ""
    
    var headerImage : UIImage!
    var cellArr : [UITableViewCell] = [UITableViewCell]()
    
    @IBOutlet weak var tableView: UITableView!
    
    let imagePickerController : UIImagePickerController = UIImagePickerController()

    let cellTitles = ["头像","昵称","性别","生日"]
    
    let cellContents = ["请输入昵称","请选择性别","请设置生日"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.backgroundColor = self.view.backgroundColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension MeMessageVC : UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //MARK:- UITableViewDataSource&&UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        if indexPath.row == 0 {
            return 70
        }else if indexPath.row == 4{
            return 30
        }else{
            return 50
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell : MeMessageHeaderCell = tableView.dequeueReusableCell(withIdentifier: "MeMessageHeaderCell", for: indexPath) as! MeMessageHeaderCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cellArr.append(cell)
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MeMessageExplainCell", for: indexPath)
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cellArr.append(cell)
            return cell
        } else {
            let cell : MeMessageListCell = tableView.dequeueReusableCell(withIdentifier: "MeMessageListCell", for: indexPath) as! MeMessageListCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            if indexPath.row == 1 {
                cell.nextImage.isHidden = true
                cell.textField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
            }else{
                cell.textField.isEnabled = false
            }
            cell.titleLabel.text = "\(cellTitles[indexPath.row])："
            cell.textField.placeholder = cellContents[indexPath.row - 1]
            cellArr.append(cell)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.view.endEditing(true)
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
           print("昵称")
        case 2:
            print("性别")
            self.view.endEditing(true)
            let MMListCell : MeMessageListCell = cellArr[2] as! MeMessageListCell
            let titles = ["男","女"]
            let styles = [0,0]
            LHUIAlertController.showArrayAlertWith(viewController: self, title: "选择性别", message:"", callBackBlock: { (str) in
                    self.sexStr = str
                    MMListCell.textField.text = str
            }, cancelButtonTitle: "取消", otherButtonTitleArray: titles, otherButtonStyleArray: styles as NSArray, actionStyle: UIAlertControllerStyle.actionSheet)
        case 3:
            print("生日")
            let MMListCell : MeMessageListCell = cellArr[3] as! MeMessageListCell
            let datePicker = LH_DatePickerView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
          /*  if self.dadeStr.isNotEmpty(){
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.date(from: self.dadeStr)
            datePicker.date = date! as NSDate
            }*/
            datePicker.date = NSDate()
            datePicker.mode = UIDatePickerMode.date
            datePicker.callbackBlock = {(Str)in
                self.dadeStr = Str
                MMListCell.textField.text = Str
            }
            datePicker.show()
                    default:
            break
        }
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition.none)
    }
    @objc func textFieldDidChange(textField: UITextField) {
        nicknameStr = textField.text!
    }
    
    //MARK:- UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            let MMHeaderCell : MeMessageHeaderCell = cellArr[0] as! MeMessageHeaderCell
            MMHeaderCell.headerImageView.image = image
            headerImage = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
