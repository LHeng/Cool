//
//  FacilityVC.swift
//  Cool
//
//  Created by 刘恒 on 2017/10/24.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class FacilityVC: BaseViewController {

    @IBOutlet weak var CollectionTop: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scrolleBgView: UIView!
    var pageControl : MyPagecontrol?
    override func viewDidLoad() {
        super.viewDidLoad()
        scrolleBgView.backgroundColor = UIColor.clear

        collectionView.backgroundColor = UIColor.clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = RFLayout()
        self.pageControl = MyPagecontrol.init(
            frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 30),
            pageNum: 3,
            currentPageIndex: 0,
            currentShowImage: UIImage.init(named: "icon_scroll2")!,
            pageIndicatorShowImage: UIImage.init(named: "icon_scroll1")!)
        self.scrolleBgView.addSubview(self.pageControl!)
        isNaviBackShow = false
        isMarkShow = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationController?.isNavigationBarHidden = false
        segue.destination.hidesBottomBarWhenPushed = true
    }
    
    
}

extension FacilityVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("======================\(scrollView.contentOffset.x)")
        let cellHeight : CGFloat = kScreenWidth / 375 * 341
        let cellWidth : CGFloat = cellHeight / 341 * 240
        let index = Int(scrollView.contentOffset.x / (cellWidth * 1.15))
        self.pageControl?.indexNumWithSlide = index
    }
    //MARK:- collectionview dataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return collectionView.frame.size.width * 0.1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.size.height / 341 * 240, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let width : CGFloat = (kScreenWidth - collectionView.frame.size.height / 341 * 240) * 0.5
        return UIEdgeInsets.init(top: 0, left: width, bottom: 0, right: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : FacilityCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "facilityCell", for: indexPath) as! FacilityCollectionViewCell
        cell.tag = indexPath.row
        cell.touchBlock = {(index)in
            self.performSegue(withIdentifier: "DeviceMessageVC", sender: nil)
        }
        return cell
    }
}


