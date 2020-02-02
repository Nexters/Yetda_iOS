//
//  UIView+.swift
//  Yetda_iOS
//
//  Created by 임수현 on 2020/01/26.
//  Copyright © 2020 Yetda. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setCardView() {
        
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 6
        self.layer.borderColor = UIColor.paleLilac.cgColor
        self.layer.borderWidth = 2
        
        self.layer.shadowColor = UIColor.shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 1
    }
}
