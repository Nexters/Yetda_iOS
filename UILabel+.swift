//
//  UILabel+.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/02/19.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
extension UILabel {
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: textString.count))
            self.attributedText = attributedString
        }
    }
}
