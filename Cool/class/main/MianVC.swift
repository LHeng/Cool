//
//  MianVC.swift
//  Cool
//
//  Created by 刘恒 on 2017/10/24.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class MianVC: UIViewController {
    
    @IBOutlet weak var naviLine: UIView!
    
    @IBOutlet weak var facilityBtn: UIButton!
    
    @IBOutlet weak var recommentBtn: UIButton!
    
    @IBOutlet weak var collectBtn: UIButton!
    
    @IBOutlet weak var historyBtn: UIButton!
    
    var pageVC : UIPageViewController!
    var facilityVC : FacilityVC!
    var recommendVC : RecommendVC!
    var collectVC : CollectVC!
    var historyVC : HistoryVC!
    
    var controllers = [UIViewController]()
    var naviBurrons = [UIButton]()
    
    var topMarkView : UIView!
    var MarkFrame = CGRect()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureParameter()
        setUpNavibtn()
        setUpPageViews()
      
        // Do any additional setup after loading the view.
    }

    func setUpPageViews() {
        facilityVC = MainSB.instantiateViewController(withIdentifier: "FacilityVC") as! FacilityVC
        recommendVC = MainSB.instantiateViewController(withIdentifier: "RecommendVC") as! RecommendVC
        collectVC = MainSB.instantiateViewController(withIdentifier: "CollectVC") as! CollectVC
        historyVC = MainSB.instantiateViewController(withIdentifier: "HistoryVC") as! HistoryVC
        
        controllers.append(facilityVC)
        controllers.append(recommendVC)
        controllers.append(collectVC)
        controllers.append(historyVC)
        
        pageVC = self.childViewControllers.first as! UIPageViewController
        pageVC.dataSource = self
        pageVC.delegate = self
        pageVC.setViewControllers([facilityVC], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
    }
    func setUpNavibtn() {
        facilityBtn.setTitleColor(UIColor.karColor.karRed.color(), for: UIControlState.selected)
        recommentBtn.setTitleColor(UIColor.karColor.karRed.color(), for: UIControlState.selected)
        collectBtn.setTitleColor(UIColor.karColor.karRed.color(), for: UIControlState.selected)
        historyBtn.setTitleColor(UIColor.karColor.karRed.color(), for: UIControlState.selected)
        
        naviBurrons.append(facilityBtn)
        naviBurrons.append(recommentBtn)
        naviBurrons.append(collectBtn)
        naviBurrons.append(historyBtn)
        facilityBtn.isSelected = true
    }
    
    func configureParameter() {
        MarkFrame = CGRect.init(x: -15, y: -3.5, width: 30, height: 7)
        topMarkView = UIImageView.init(image: UIImage.init(named: "top_select"))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
        topMarkView.frame = MarkFrame
        naviLine.addSubview(topMarkView)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        topMarkAnimate()
    }
    func topMarkAnimateWithIndex(_ index : CGFloat) {
        var centerX : CGFloat = 0.0
        switch Int(index) {
        case 0:
            centerX = facilityBtn.centerX
        case 1:
            centerX = recommentBtn.centerX
        case 2:
            centerX = collectBtn.centerX
        case 3:
            centerX = historyBtn.centerX
        default:
            break
        }
        topMarkAnimateWithCenterX(centerX: centerX)
    }
    
     func topMarkAnimateWithCenterX(centerX : CGFloat) {
        var center:CGPoint = self.topMarkView.center
        center.x = centerX
        UIView.animate(withDuration: 0.3) {
            self.topMarkView.center = center
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         self.navigationController?.isNavigationBarHidden = false
        if segue.destination.isKind(of: SearchVC.self) {
            let vc : SearchVC = segue.destination as! SearchVC
            vc.hidesBottomBarWhenPushed = true
        } else  if segue.destination.isKind(of: PlayerVC.self) {
            let vc : PlayerVC = segue.destination as! PlayerVC
            vc.hidesBottomBarWhenPushed = true
        }
    }
    @IBAction func naviButtonEvent(_ sender: UIButton) {
        naviBtnSelected(sender)
        topMarkAnimate()
         pageVC.setViewControllers([controllers[sender.tag - 100]], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
    }
    
    func naviBtnSelected(_ sender : UIButton){
        for btn : UIButton in naviBurrons {
            btn.isSelected = false
        }
        sender.isSelected = !sender.isSelected
    }
    
    func topMarkAnimate() {
        for i : Int in 0..<naviBurrons.count {
            let btn : UIButton = naviBurrons[i]
            if btn.isSelected {
                topMarkAnimateWithIndex(CGFloat(i))
            }
        }
    }
    
    func naviBtnChangeSelected(_ index : NSInteger){
        topMarkAnimateWithIndex(CGFloat(index))
        let btn : UIButton = naviBurrons[index]
        naviBtnSelected(btn)
    }
}

//MARK: - UIPageViewControllerDelegate&&UIPageViewControllerDataSource
extension MianVC : UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = indexForViewController(viewController)
        naviBtnChangeSelected(index)
        if index == 0 {
            index = controllers.count - 1
        }else{
            index -= 1
        }
        print("Before index : \(index)")
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = indexForViewController(viewController)
        naviBtnChangeSelected(index)
        index += 1
        if index == controllers.count{
            index = 0
        }
        print("After index : \(index)")
        return viewControllerAtIndex(index)
    }
    
    func indexForViewController(_ viewController : UIViewController)->NSInteger{
        return controllers.index(of: viewController)!
    }
    
    func viewControllerAtIndex(_ index : NSInteger)->UIViewController?{
        if index > controllers.count{
            return nil
        }
        let vc : UIViewController = controllers[index]
        return vc
    }
}

