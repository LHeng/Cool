//
//  ChatVC.swift
//  Cool
//
//  Created by 刘恒 on 2017/10/24.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class ChatVC: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNaviBackShow = false
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.tableFooterView = UIView.init()
        tableView.showsVerticalScrollIndicator = false
    
       

        // Do any additional setup after loading the view.
    }
 override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.reloadData()
         self.tableView.scrollToRow(at: IndexPath.init(item:8 - 1, section: 0), at: UITableViewScrollPosition.bottom, animated: false)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
extension ChatVC : UITableViewDelegate,UITableViewDataSource{
    
    
    //UITableviewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    //UITableviewDataSource
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return ChatCell.cellGetHeight()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ChatCell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        cell.model = NSMutableArray()
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
}
