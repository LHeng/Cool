//
//  ChatCell.swift
//  Cool
//
//  Created by 刘恒 on 2017/10/30.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var ProblemLab: UILabel!
    @IBOutlet weak var AnswerLab: UILabel!
    @IBOutlet weak var AnswerBtn: UIButton!
    @IBOutlet weak var BGHeight: NSLayoutConstraint!
    @IBOutlet weak var BGWidth: NSLayoutConstraint!
    @IBOutlet weak var AnswerLabWidth: NSLayoutConstraint!
    
    let problemFont : UIFont = UIFont.systemFont(ofSize: 16)
    
    let answerFont : UIFont = UIFont.systemFont(ofSize: 15)
    
    
    var answerSize : CGSize!

    var _model = NSMutableArray()
    var model : NSMutableArray {
        set {
            answerSize = NSString.init(string: "山羊爷爷的白菜丰收了，请大家快点去帮山羊爷爷收白菜吧......").boundingRect(with: CGSize.init(width: kScreenWidth - 100 - 48, height: CGFloat(MAXFLOAT)),
                                                                        options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                                        attributes: [NSAttributedStringKey.font:answerFont],
                                                                        context: nil).size
            if answerSize.height > 54 {
                BGHeight.constant = 54.0 + 30.0
            }else{
                BGHeight.constant = answerSize.height + CGFloat(30)
            }
            
            BGWidth.constant = answerSize.width + 34.0
            AnswerLabWidth.constant = answerSize.width + 6
        }
        get {
            return _model
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    class func cellGetHeight()->CGFloat{
        let problemFont : UIFont = UIFont.systemFont(ofSize: 16)

        let answerFont : UIFont = UIFont.systemFont(ofSize: 15)
        
        var height : CGFloat = 0
        
        let problemStr = String.init(format: "%@", "请给我讲个故事吧")
        let answerStr  = "山羊爷爷的白菜丰收了，请大家快点去帮山羊爷爷收白菜吧....."
        if problemStr.characters.count > 0 {
            let problemSize = NSString.init(string: problemStr).boundingRect(with: CGSize.init(width: kScreenWidth - 39 * 2, height: CGFloat(MAXFLOAT)),
                                                                            options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                                            attributes: [NSAttributedStringKey.font:problemFont],
                                                                            context: nil).size
            height = height + problemSize.height
        }
        
        if answerStr.characters.count > 0 {
            let answerSize = NSString.init(string: answerStr).boundingRect(with: CGSize.init(width: kScreenWidth - 100 - 48, height: CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:answerFont], context: nil).size
            
            if answerSize.height > 54 {
                height = height + 54
                
            }else{
                height = height + answerSize.height
            }
            
        }
        
        height = height - 19 + 222 - 16
        if height < 0 {
            height = 0
        }
        
        return height
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
