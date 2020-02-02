//
//  UIColor+.swift
//  Yetda_iOS
//
//  Created by 임수현 on 2020/01/26.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

extension UIColor {
    static let blueGrey = UIColor(red: 140/255, green: 144/255, blue: 152/255, alpha: 1)
    static let brownishGrey = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
    static let paleLilac = UIColor(red: 223/255, green: 223/255, blue: 228/255, alpha: 1)
    static let pastelRed = UIColor(red: 218/255, green: 89/255, blue: 89/255, alpha: 1)
    static let shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.03)
    
    static func blueGreyWith(alpha: CGFloat) -> UIColor {
        return UIColor(red: 140/255, green: 144/255, blue: 152/255, alpha: alpha)
    }
}
