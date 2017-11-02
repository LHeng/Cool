//
//  RMDHotCell.swift
//  Cool
//
//  Created by 刘恒 on 2017/10/30.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class RMDHotCell: UITableViewCell {

    @IBOutlet weak var colletionView: UICollectionView!
    
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        colletionView.delegate = self
        colletionView.dataSource = self
        colletionView.isScrollEnabled = false
    }

    class func getCellHeightWithCount(_ count : Int)->CGFloat{
        let ratio = count % 4 == 0 ? 0 : 1
        let index = count / 4 + ratio
        return CGFloat(index * 115)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension RMDHotCell : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.width * 0.25, height: 115)
    }
    
    //UICollectionViewDataSoure
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : RMDHotColletionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RMDHotColletionCell", for: indexPath) as! RMDHotColletionCell
        return cell
    }
    
}
