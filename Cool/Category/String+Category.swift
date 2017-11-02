//
//  String+Category.swift
//  Cool
//
//  Created by 刘恒 on 2017/10/26.
//  Copyright © 2017年 Cool. All rights reserved.
//

import UIKit

extension String {
    func isNotEmpty() -> Bool {
        return self.characters.count > 0 ? true : false
    }
}
