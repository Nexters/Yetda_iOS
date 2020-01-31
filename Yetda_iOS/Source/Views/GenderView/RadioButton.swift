//
//  RadioButton.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/29.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import SnapKit

class Checkbox{
    var button: UIButton!
    var view: UIView!
    
    func setButtonStyle() {
        button.backgroundColor = .clear
        button.layer.cornerRadius = 8
        
        button.snp.makeConstraints { (make) in
            make.width.height.equalTo(16)
        }
    }
    
    func setButtonContainerView() {
        view.backgroundColor = .clear
        view.layer.cornerRadius = 13
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        
        view.snp.makeConstraints { (make) in
            make.width.height.equalTo(26)
        }
        
    }
    
    func createRadioButton() {
        setButtonContainerView()
        setButtonStyle()
        
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.center.equalTo(view.center)
        }
    }
    
    
}
