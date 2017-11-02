//
//  BaseViewController.swift
//  Cool
//
//  Created by 刘恒 on 2017/10/23.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var markFrame = CGRect()
    var topMark : UIImageView!
    var isMarkShow : Bool = false
    var isNaviBackShow : Bool = false
    var baseBackBtn : UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1.0)
        configureParametr()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if isNaviBackShow {
            configureNaviBackBarItem()
        }
        topMark.isHidden = !isMarkShow
        if isMarkShow {
            markFrame.origin.x = -15
            topMark.frame = markFrame
            self.navigationController?.view .addSubview(topMark)
            topMarkAnimateWithCenterX(centerX: UIScreen.main.bounds.size.width*0.5)
        }
    }
    
    func configureNaviBackBarItem() {
        baseBackBtn = UIBarButtonItem.init(title: "", style: UIBarButtonItemStyle.plain, target: self, action: #selector(naviBackAction))
        baseBackBtn.image = UIImage.init(named: "icon_back")
        let spacer : UIBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
        self.navigationItem.leftBarButtonItems = [spacer,baseBackBtn]
    }
    @objc func naviBackAction() {
        self.navigationController?.popViewController(animated: true)
    }
    func topMarkAnimateWithCenterX(centerX : CGFloat) {
        var center:CGPoint = self.topMark.center
        center.x = centerX
        UIView.animate(withDuration: 0.3) {
            self.topMark.center = center
        }
    }
    func configureParametr() {
        markFrame = CGRect.init(x: -15, y: NaviHeight - 3.5, width: 30, height: 7)
        topMark = UIImageView.init(image: UIImage.init(named: "top_select"))
        isMarkShow = true
        isNaviBackShow = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
