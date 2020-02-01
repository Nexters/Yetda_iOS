//
//  GenderViewController+UIButton.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/30.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

// MARK: - UIButton Extension
extension UIButton {
    // Set CheckBox button style
    func setButtonStyle() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = 8
        
        self.snp.makeConstraints { (make) in
            make.width.height.equalTo(16)
        }
    }
    
}
