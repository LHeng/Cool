//
//  HelpSectionHeaderView.swift
//  Cool
//
//  Created by 刘恒 on 2017/11/25.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class HelpSectionHeaderView: UIView {
    
    typealias CallBackBlock = (_ index : NSInteger, _ isSelector : Bool)->()
    var callBack : CallBackBlock!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var spreadButton: UIButton!
    
    @IBAction func buttonEvent(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if let _ = callBack {
            callBack(self.tag,sender.isSelected)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if spreadButton.isSelected {
            titleLabel.textColor = UIColor.karColor.karBule.color()
        }else{
            titleLabel.textColor = UIColor.black
        }
    }
    override func awakeFromNib(){
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        let VC : UIView = Bundle.main.loadNibNamed("HelpSectionHeaderView", owner: self, options: nil)?.first as! UIView
        VC.frame = self.frame
        self.addSubview(VC)
        spreadButton.tintColor = UIColor.clear
    }
}
