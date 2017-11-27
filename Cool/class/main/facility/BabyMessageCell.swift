//
//  BabyMessageCell.swift
//  Cool
//
//  Created by 刘恒 on 2017/11/24.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class BabyMessageCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    var isEdit : Bool? {
        didSet{
            if isEdit! {
                textField.isUserInteractionEnabled = true
                myImage.isHidden = true
            } else {
                textField.isUserInteractionEnabled = false
                myImage.isHidden = false
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
