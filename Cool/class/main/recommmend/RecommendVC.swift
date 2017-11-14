//
//  RecommendVC.swift
//  Cool
//
//  Created by 刘恒 on 2017/10/24.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class RecommendVC: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let headerTitles : [String] = ["","经典分类","热门精选"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView.init()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.showsVerticalScrollIndicator = false
        isNaviBackShow = false
        isMarkShow = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationController?.isNavigationBarHidden = false
        segue.destination.hidesBottomBarWhenPushed = true
    }

}


extension RecommendVC : UITableViewDataSource,UITableViewDelegate{
    
    //UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //UITableViewDataSoure
    
    //section
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitles.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let title = headerTitles[section]
        if title.isEmpty {
            return 0
        }else{
            return 46
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title = headerTitles[section]
        if title.isEmpty {
            return nil
        }else{
            let header = RMDSectionHeader()
            header.headerTitle.text = headerTitles[section]
            if section == 2{
                header.headerHelp.isHidden = true
            }
            header.helpAction = {()
                
            }
            return header
        }
    }
    
    //cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return kScreenWidth / 375.0 * 167.0
        case 1:
            return RMDClassicCell.cellGetHeight()
        case 2:
            return RMDHotCell.getCellHeightWithCount(20)
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let bannerCell : RMDBannerCell = tableView.dequeueReusableCell(withIdentifier: "RMDBannerCell", for: indexPath) as! RMDBannerCell
            bannerCell.returnBlock = {(index)in
                self.performSegue(withIdentifier: "toRecommendSubVC", sender: nil)
            }
            return bannerCell
        case 1:
            let classicsCell : RMDClassicCell = tableView.dequeueReusableCell(withIdentifier: "RMDClassicsCell", for: indexPath) as! RMDClassicCell
            classicsCell.returnBlock = {(index)in
                 self.performSegue(withIdentifier: "toRecommendSubDetailVC", sender: nil)
            }
            return classicsCell
        case 2:
            let hotCell : RMDHotCell = tableView.dequeueReusableCell(withIdentifier: "RMDHotCell", for: indexPath) as! RMDHotCell
            hotCell.returnBlock = {(index)in
                 self.performSegue(withIdentifier: "toRecommendSubVC", sender: nil)
            }
            return hotCell
        default:
            return UITableViewCell()
        }
    }
    
}
