//
//  MeMessageListCell.swift
//  Cool
//
//  Created by 刘恒 on 2017/11/9.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class MeMessageListCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var nextImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
