//
//  RMDClassicCell.swift
//  Cool
//
//  Created by 刘恒 on 2017/10/30.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class RMDClassicCell: UITableViewCell {

    typealias responseBlock = (_ index : Int)->()
    
    var returnBlock : responseBlock!
    
    @IBOutlet weak var colletionView: UICollectionView!
    
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.karColor.karBule.color()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
    
        colletionView.delegate = self
        colletionView.dataSource = self
        colletionView.showsHorizontalScrollIndicator = false
    }

    class func cellGetHeight()->CGFloat{
        return 110
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension RMDClassicCell : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : RMDClassicColletionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RMDClassicColletionCell", for: indexPath) as! RMDClassicColletionCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.width * 0.25, height: collectionView.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let _ = returnBlock {
            returnBlock(indexPath.row)
        }
    }
}
