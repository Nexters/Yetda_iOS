//
//  UIButton+.swift
//  Yetda_iOS
//
//  Created by 임수현 on 2020/02/02.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setYesNoButton(isYesBtn: Bool) {
        
        if isYesBtn {
            self.setTitle("O", for: .normal)
            self.setTitleColor(UIColor.pastelRed, for: .normal)
        } else {
            self.setTitle("X", for: .normal)
            self.setTitleColor(UIColor.blueGrey, for: .normal)
        }
        
        self.titleLabel?.font = .boldSystemFont(ofSize: 28)
        self.layer.cornerRadius = 38
        self.layer.borderColor = UIColor.paleLilac.cgColor
        self.layer.borderWidth = 2
    }
    
    func setUnderLine() {
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let underlineAttributedString = NSAttributedString(string: "StringWithUnderLine", attributes: underlineAttribute)
        self.titleLabel?.attributedText = underlineAttributedString
        
    }
}
