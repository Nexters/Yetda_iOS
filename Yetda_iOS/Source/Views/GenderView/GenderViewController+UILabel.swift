//
//  GenderViewController+UILabel.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/30.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

extension UILabel {
    // Common Settings for CheckBox Label
    func setCommonLabelSetup(title: String) {
        self.text = title
        self.tintColor = .darkGray
        self.adjustsFontSizeToFitWidth = true
        self.numberOfLines = 0
        
        self.snp.makeConstraints { (make) in
            make.width.equalTo(75)
            make.height.equalTo(33)
        }
    }
}
