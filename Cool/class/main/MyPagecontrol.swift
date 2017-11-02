//
//  MyPagecontrol.swift
//  selfPagecontrol
//
//  Created by pxh on 2017/3/1.
//  Copyright © 2017年 pxh. All rights reserved.
//

import UIKit

protocol MyPagecontrolDelegate {
    func pageControl(_ pageControl : MyPagecontrol , indexNum : NSInteger)
}

class MyPagecontrol: UIView {

    var _indexNumWithSlide : NSInteger! = 0
    //滑动到的下标
    var indexNumWithSlide : NSInteger!{
        set{
            _indexNumWithSlide = newValue
//            print("移动到的下标：\(_indexNumWithSlide!,newValue)")
            if _indexNumWithSlide! >= self.subviews.count {
                return
            }else if(currentPageNumber! != _indexNumWithSlide!){
                
                currentPageNumber = _indexNumWithSlide
                calculateFrame()                            //重新计算对应的Frame
            }
        }
        get{
            return _indexNumWithSlide
        }
    }
    
    //代理属性
    var delegate : MyPagecontrolDelegate!
    
    
    //总个数
    var pageNumber : NSInteger!
    
    //当前的下表
    var currentPageNumber : NSInteger!
    
    //当前的图片
    var currentImage : UIImage!
    
    //接下来的图片
    var pageIndicatorImage : UIImage!
    
    //当前图片的Size
    var currentImageSize : CGSize!
    
    //接下来图片的Size
    var pageIndicatorImageSize : CGSize!
    
    let pageDistance : CGFloat = 12 //边距
    
    init(frame: CGRect, pageNum : NSInteger , currentPageIndex : NSInteger , currentShowImage : UIImage , pageIndicatorShowImage : UIImage) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.pageNumber = pageNum
        self.currentPageNumber = currentPageIndex
        self.currentImage = currentShowImage
        self.pageIndicatorImage = pageIndicatorShowImage
        
        self.currentImageSize = currentShowImage.size
        self.pageIndicatorImageSize = pageIndicatorImage.size
        creatUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- 创建对应的UI
    func creatUI(){
        for i : NSInteger in 0..<pageNumber {
            let button = UIButton()
            self.addSubview(button)
            button.tag = i
            button.addTarget(self, action: #selector(clickPageAction(sender:)), for: UIControlEvents.touchUpInside)
        }
        calculateFrame()
    }
    
    //MARK:- 计算各个视图对应的Frame
    func calculateFrame(){
        //边距和page的最小宽度
        let needMinWidth : CGFloat = CGFloat(pageNumber - 1) * (pageIndicatorImageSize.width + pageDistance) + currentImageSize.width
        let beginXValue = self.frame.size.width * 0.5 - needMinWidth * 0.5 //开始的x值
        for i in 0..<self.subviews.count {
            let view = self.subviews[i]
            if view.isKind(of: UIButton.self) {
                let button : UIButton = view as! UIButton
                if i == currentPageNumber { //当前的点
                    button.setImage(currentImage, for: UIControlState.normal)        //设置对应的UIImage
                    button.setImage(currentImage, for: UIControlState.highlighted)
                    button.frame = CGRect.init(x: beginXValue + (pageIndicatorImageSize.width + pageDistance) * CGFloat(currentPageNumber), y: self.frame.size.height * 0.5 - currentImageSize.height * 0.5, width: currentImageSize.width, height: currentImageSize.height) //设置对应的Frame
                }else{//接下来的点
                    let heightWithButton = self.frame.height * 0.5 - pageIndicatorImageSize.height * 0.5
                    if i > currentPageNumber {
                        let x = beginXValue + pageDistance * CGFloat(i) + CGFloat(i - 1) * pageIndicatorImageSize.width + currentImageSize.width
                        button.frame = CGRect.init(x: x, y: heightWithButton, width: pageIndicatorImageSize.width, height: pageIndicatorImageSize.height)
                    }else{
                        button.frame = CGRect.init(x: beginXValue + (pageIndicatorImageSize.width + pageDistance) * CGFloat(i), y: heightWithButton, width: pageIndicatorImageSize.width, height: pageIndicatorImageSize.height)
                    }
                    button.setImage(pageIndicatorImage, for: UIControlState.normal)       //设置对应的UIImage
                    button.setImage(pageIndicatorImage, for: UIControlState.highlighted)
                }
            }
        }
    }
    
    //MARK:- 点击了对应的点
    @objc func clickPageAction(sender : UIButton){
        if delegate != nil {
            delegate.pageControl(self, indexNum: sender.tag)
        }
    }
}
