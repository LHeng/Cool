//
//  HelpVC.swift
//  Cool
//
//  Created by 刘恒 on 2017/11/24.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class HelpVC: BaseViewController {
    
    let sentionTitles = ["开启设备","未能链接WIFI","配置网络/重置网络","声波配网失败原因"]
    
    let cellTitles = ["还不会如何开启设备吗？点击设备上的开 机按钮，设备会启动，听到开机音乐就证 明设备启动啦！",
                      "有可能是您的手机未启用WIFI网络。您可 以在手机的”设置”>“WLAN”中选择一个 可用的WIFI接入。如果您已接入WIFI网络， 请检查WIFI热点是否已接入互联网，或该 热点是否已允许您的设备访问互联网。",
                      "当设备没有网络，或需要配置网络时，请按照如下流程进行网络配置：\n1 使设备进入配网模式：请在您的智能设备上，点击语音按键，说出“帮我联网”，可听到“已进入配网模式”。\n2 使用手机App，选择添加新设备，再选择设备联网，根据手机App引导，完成网络配置。",
                      "声波配网目前不支持5G WIFI信号、请先 看下是否连接了可用WIFI。另外根据声音 的反馈，也可以定位到问题所在，例如密 码输入错误。如果手机音量较小，或配网 距离设备较远，请调大音量，并靠近设备 再次重试。"]
    
    let flagArray : NSMutableArray = NSMutableArray()
    
    let cellArray : NSMutableArray = NSMutableArray()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavi()
        makeData()
        setUpTableview()
        // Do any additional setup after loading the view.
    }
    func makeData(){
        for _ : NSInteger in 0...sentionTitles.count - 1 {
            flagArray.add(false)
        }
    }
    func setUpTableview(){
        
        tableView.tableFooterView = UIView.init()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.estimatedRowHeight = 200 //预设cell高度
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func setUpNavi(){
        self.navigationItem.title = "常见问题帮助"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension HelpVC : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sentionTitles.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 52
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view : HelpSectionHeaderView = HelpSectionHeaderView()
        view.tag = section + 2000
        view.titleLabel.text = sentionTitles[section]
        view.spreadButton.isSelected = flagArray[section] as! Bool
        view.callBack = {(index,isSelected) in
            let ratio : NSInteger = index - 2000
            for i : Int in 0...self.flagArray.count - 1 {
                if ratio == i {
                    self.flagArray[i] = isSelected
                }else{
                    self.flagArray[i] = false
                }
            }
            self.tableView.reloadData()
        }
        return view
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if flagArray[section] as! Bool{
            return 1
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell : HelpCell = tableView.dequeueReusableCell(withIdentifier: "HelpCell", for: indexPath) as! HelpCell
        let content : String = cellTitles[indexPath.section]
        
        let attributesString = NSMutableAttributedString.init(string : content)
        //创建NSMutableParagraphStyle
        let paraghStyle = NSMutableParagraphStyle()
        //设置行间距（同样这里可以设置行号，间距，对齐方式）
        paraghStyle.lineSpacing = cell.titleLabel.font.lineHeight
        //添加属性，设置行间距
        attributesString.addAttributes([NSAttributedStringKey.paragraphStyle : paraghStyle], range: NSMakeRange(0, content.count))
        cell.titleLabel.attributedText = attributesString
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}
