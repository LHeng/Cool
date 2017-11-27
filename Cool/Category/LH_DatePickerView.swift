//
//  LH_DatePickerView.swift
//  Cool
//
//  Created by 刘恒 on 2017/11/10.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class LH_DatePickerView: UIView {
    typealias CallBackBlock = (_ dateStr : String)->()
    var callbackBlock : CallBackBlock!
    @IBOutlet var myView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var toolBar: UIToolbar!
    var dateView : UIView?
    var date = NSDate()
   /* var date : NSDate {
        set {
            _date = newValue
            datePicker.setDate(newValue as Date, animated: true)
        }
        get {
            return _date
        }
    }*/
    var mode = UIDatePickerMode.time
    /*var mode : UIDatePickerMode {
        set {
            _mode = newValue
            datePicker.datePickerMode = newValue
        }
        get {
            return _mode
        }
    }*/
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.tag = 1001
        self.backgroundColor = UIColor.clear
        awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateView = Bundle.main.loadNibNamed("LH_DatePickerView", owner: self, options: nil)?.first as? UIView
        dateView?.frame = CGRect.init(x: 0, y: kScreenHeight, width: kScreenWidth, height: kScreenHeight/2)
        self.addSubview(dateView!)
        self.backgroundColor = UIColor.init(red: 255.0/225.0, green: 255.0/225.0, blue: 255.0/225.0, alpha: 0.3)
        datePicker.locale = NSLocale.init(localeIdentifier: "zh_CN") as Locale
        let maxDate = NSDate.init(timeIntervalSinceNow: 24*60*60)
        datePicker.maximumDate = maxDate as Date
        let minDate = NSDate()
        datePicker.maximumDate = minDate as Date
        toolBar.barStyle = UIBarStyle.blackTranslucent
        toolBar.barTintColor = UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.3)
        addToolButton()
        datePicker.addTarget(self, action: #selector(datePickerChange(datepicker:)), for: UIControlEvents.valueChanged)
    }
    
    @objc func datePickerChange(datepicker:UIDatePicker) {
        let dateFormatter : DateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateStr : String = dateFormatter.string(from: datepicker.date)
        print("=====\(dateStr)")
    }
    
    func addToolButton() {
        let leftButton = UIButton.init(frame: CGRect.init(x: 10, y: 0, width: 50, height: 44))
        leftButton.tag = 101
        leftButton .setTitle("取消", for: UIControlState.normal)
        leftButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        leftButton.addTarget(self, action: #selector(buttonEvent(sender:)), for:UIControlEvents.touchUpInside)
        let leftButtonItem = UIBarButtonItem.init(customView: leftButton)
        
        let rightButton = UIButton.init(frame: CGRect.init(x:kScreenWidth - 60 , y: 0, width: 50 , height: 44))
        rightButton.tag = 102
        rightButton.setTitle("确定", for: UIControlState.normal)
        rightButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        rightButton.addTarget(self, action: #selector(buttonEvent(sender:)), for:UIControlEvents.touchUpInside)
        let rightButtonItem = UIBarButtonItem.init(customView: rightButton)
        
        toolBar.items = [leftButtonItem,rightButtonItem]
    }
    
    @objc func buttonEvent(sender : UIButton) {
        switch sender.tag-100 {
        case 1:
            dismiss()
        case 2:
            let select  = self.datePicker.date 
            let dateFormatter : DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateStr : String = dateFormatter.string(from: select)
            if let _ = callbackBlock {
                callbackBlock(dateStr)
                dismiss()
            }
        default:
            break
        }
    }
    func show()
    {
        self.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
        self.backgroundColor = UIColor.init(red: 0/255.0, green:0/255.0, blue:0/255.0, alpha:0.3)
        let tap : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(dismiss))
        self.addGestureRecognizer(tap)
        datePicker.setDate(date as Date, animated: true)
        datePicker.datePickerMode = mode
        UIApplication.shared.keyWindow?.addSubview(self)
        UIView.animate(withDuration: 0.35, animations: {
            self.alpha = 1.0
            self.dateView?.frame = CGRect.init(x: 0, y: kScreenHeight/2, width: kScreenWidth, height: kScreenHeight/2)
        }) { (finish) in
            
        }
    }
    
    @objc func dismiss()
    {
        UIView.animate(withDuration: 0.35, animations: {
            self.dateView?.frame = CGRect.init(x: 0, y: kScreenHeight, width: kScreenWidth, height: kScreenHeight/2)
        }) { (finish) in
            for view : UIView in (UIApplication.shared.keyWindow?.subviews)!
            {
                if view.tag == 1001 {
                    view.removeFromSuperview()
                }
            }
        }
    }
}
