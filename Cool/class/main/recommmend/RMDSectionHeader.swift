//
//  RMDSectionHeader.swift
//  UniToy
//
//  Created by pxh on 2017/6/6.
//  Copyright © 2017年 pxh. All rights reserved.
//

import UIKit

class RMDSectionHeader: UIView {

    @IBOutlet weak var headerTitle: UILabel!
    
    @IBOutlet weak var headerHelp: UIButton!
    
    typealias responseBlock = ()->()
    
    var helpAction : responseBlock!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        let view = Bundle.main.loadNibNamed("RMDSectionHeader", owner: self, options: nil)?.first as! UIView
        view.frame = self.frame
        self.addSubview(view)
    }
    @IBAction func RMDHelpAction(_ sender: UIButton) {
        if let _ = helpAction {
            helpAction()
        }
    }
    
}
