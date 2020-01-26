//
//  UIView+.swift
//  Yetda_iOS
//
//  Created by 임수현 on 2020/01/17.
//  Copyright © 2020 Yetda. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setCardView() {
        
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 20
//        self.layer.borderColor = UIColor.lightGray.cgColor
//        self.layer.borderWidth = 1
        
        self.layer.shadowColor = UIColor.shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 20
        self.layer.shadowOpacity = 1
    }
}
