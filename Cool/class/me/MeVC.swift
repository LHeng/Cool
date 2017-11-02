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
    override func viewDidLoad() {
        super.viewDidLoad()
        isNaviBackShow = false
        
        tableView.isScrollEnabled = false
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.backgroundColor = UIColor.clear
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func buttonEvent(_ sender: UIButton) {
        
        kAppDelegate.window?.rootViewController = UIStoryboard.init(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "BaseNavigationViewController")
    }
   
}

extension MeVC : UITableViewDelegate,UITableViewDataSource {
    
    //MARK:- tableview delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.right)
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete : UITableViewRowAction = UITableViewRowAction.init(style: UITableViewRowActionStyle.default, title: "  ") { (action, indexPath) in
            
            self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.right)
        }
        delete.backgroundColor = UIColor.clear
        return [delete]
    }
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
    
}
