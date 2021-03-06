//
//  RMDBannerCell.swift
//  Cool
//
//  Created by 刘恒 on 2017/10/30.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class RMDBannerCell: UITableViewCell {
    typealias responseBlock = (_ index : Int)->()
    
    var returnBlock : responseBlock!
    
    let imageArr = ["banner_im1","banner_im2","banner_im3"]
    let titles = ["First","Second","Third"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let cycleScrollView : SDCycleScrollView = SDCycleScrollView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: self.height), imageNamesGroup: imageArr)
        cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter
        cycleScrollView.titlesGroup = titles
        cycleScrollView.currentPageDotColor = UIColor.red
        cycleScrollView.pageDotColor = UIColor.white
        cycleScrollView.showPageControl = true
        cycleScrollView.delegate = self
        self.addSubview(cycleScrollView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension RMDBannerCell : SDCycleScrollViewDelegate {
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        if let _ = returnBlock {
            returnBlock(index)
        }
    }
}
