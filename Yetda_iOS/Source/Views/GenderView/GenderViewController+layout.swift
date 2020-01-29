//
//  CheckBox.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/29.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import SnapKit

extension GenderViewController {
    func setButtonStyle(button: UIButton) {
        button.backgroundColor = .clear
        button.layer.cornerRadius = 8
        
        button.snp.makeConstraints { (make) in
            make.width.height.equalTo(16)
        }
    }
    
    func setButtonAction(button: UIButton) {
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        if sender.backgroundColor == .charcoalGrey {
            sender.backgroundColor = .clear
        } else {
            sender.backgroundColor = .charcoalGrey
        }
        
        if sender == maleButton {
            femaleButton.backgroundColor = .clear
        } else {
            maleButton.backgroundColor = .clear
        }
    }
    
    func setButtonContainerView(view: UIView) {
        view.backgroundColor = .clear
        view.layer.cornerRadius = 13
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.charcoalGrey.cgColor
        
        view.snp.makeConstraints { (make) in
            make.width.height.equalTo(26)
        }
        
    }
    
    func createRadioButton(view: UIView, button: UIButton) {
        setButtonContainerView(view: view)
        setButtonStyle(button: button)
        setButtonAction(button: button)
        
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.center.equalTo(view)
        }
    }
    
}
