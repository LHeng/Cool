//
//  FacilityCollectionViewCell.swift
//  Cool
//
//  Created by 刘恒 on 2017/11/24.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class FacilityCollectionViewCell: UICollectionViewCell {
    typealias backBlock = (_ tag : NSInteger)->()
    
    var returnBlock : backBlock!
    
    var touchBlock : backBlock!
    
    @IBOutlet weak var settingView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        settingView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        settingView.addGestureRecognizer(tap)
    }
    @objc func tapAction(){
        if let _ = touchBlock {
            touchBlock(self.tag)
        }
    }
}
