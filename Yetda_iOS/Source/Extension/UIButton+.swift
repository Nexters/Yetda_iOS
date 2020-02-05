//
//  UIButton+.swift
//  Yetda_iOS
//
//  Created by 임수현 on 2020/02/02.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

extension UIButton {
    func setNextButton(isEnable: Bool) {

        self.isEnabled = isEnable
        self.setTitle("다음", for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 18)
        self.layer.cornerRadius = 22
        setNextButtonEnable(isEnabled)
    }
    
    func setNextButtonEnable(_ enable: Bool){
        if enable {
            self.setTitleColor(.white, for: .normal)
            self.backgroundColor = .pastelRed
        } else {
            self.setTitleColor(.veryLightPink, for: .normal)
            self.backgroundColor = .veryLightPink2
        }
    }
}
